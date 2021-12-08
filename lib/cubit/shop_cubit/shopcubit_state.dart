part of 'shop_cubit.dart';

@immutable
abstract class ShopcubitState {}

class ShopcubitInitial extends ShopcubitState {}

class OnChangeBottomNavBar extends ShopcubitState {}

class ShopLoadingHomePageState extends ShopcubitState {}

class ShopSuccesHomePageState extends ShopcubitState {}

class ShopErrorHomePageState extends ShopcubitState {}

class ShopSuccesCategoryPageState extends ShopcubitState {}

class ShopErrorCategoryPageState extends ShopcubitState {}

class ShopChangeFavoritesState extends ShopcubitState {}

class ShopSuccessChangeFavoritesState extends ShopcubitState {
  final ChangeFavoritesModel model;

  ShopSuccessChangeFavoritesState(this.model);
}

class ShopErrorChangeFavoritesState extends ShopcubitState {}

class ShopLoadingGetFavoritesState extends ShopcubitState {}

class ShopSuccesfavoritesPageState extends ShopcubitState {}

class ShopErrorfavoritesPageState extends ShopcubitState {}
