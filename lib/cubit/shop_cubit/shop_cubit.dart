import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop/model/categories_model.dart';
import 'package:shop/model/change_favorites.dart';
import 'package:shop/model/favorites_model.dart';
import 'package:shop/model/home_model.dart';
import 'package:shop/modules/categories.dart';
import 'package:shop/modules/favorits.dart';
import 'package:shop/modules/products.dart';
import 'package:shop/modules/settings.dart';
import 'package:shop/network/dio_helper.dart';
import 'package:shop/network/endpoints.dart';
import 'package:shop/shared/constants.dart';

part 'shopcubit_state.dart';

class ShopCubit extends Cubit<ShopcubitState> {
  ShopCubit() : super(ShopcubitInitial());
  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> pages = [
    productsScreen(),
    CategoriesScreen(),
    FavoritScreen(),
    SettingsScreen()
  ];
  void onIndexChange(int value) {
    currentIndex = value;
    emit(OnChangeBottomNavBar());
  }

  HomeModel? homeModel;
  void getHomeData() {
    emit(ShopLoadingHomePageState());
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = HomeModel.fromjson(json: value.data);

      for (var element in homeModel!.data!.products) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      }
      // print(favorites.toString());
      emit(ShopSuccesHomePageState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomePageState());
    });
  }

  CategoriesModel? categoryModel;
  void getCategoryData() {
    DioHelper.getData(url: GET_CATEGORIES, token: token).then((value) {
      categoryModel = CategoriesModel.fromJson(value.data);
      emit(ShopSuccesCategoryPageState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoryPageState());
    });
  }

  Map<int?, bool?> favorites = {};

  ChangeFavoritesModel? changeFavoritesModel;

  void changeFavorite(int? productId) {
    favorites[productId] = !(favorites[productId] ?? false);
    emit(ShopChangeFavoritesState());
    print(productId.toString());
    DioHelper.postData(
      url: FAVORITES,
      token: token,
      data: {
        "product_id": productId,
      },
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      // print(token);
      // print(value.data);
      if (changeFavoritesModel!.status == false) {
        favorites[productId] = !(favorites[productId] ?? false);
      } else {
        getfavoritesData();
      }
      emit(ShopSuccessChangeFavoritesState(changeFavoritesModel!));
    }).catchError((error) {
      favorites[productId] = !(favorites[productId] ?? false);
      emit(ShopErrorChangeFavoritesState());
    });
  }

  FavoritesModel? favModel;
  void getfavoritesData() {
    emit(ShopLoadingGetFavoritesState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favModel = FavoritesModel.fromJson(value.data);
      print(value.data.toString());
      emit(ShopSuccesfavoritesPageState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoryPageState());
    });
  }
}
