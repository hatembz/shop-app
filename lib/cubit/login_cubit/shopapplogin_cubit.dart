import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop/model/login_model.dart';
import 'package:shop/network/dio_helper.dart';
import 'package:shop/network/endpoints.dart';

part 'shopapplogin_state.dart';

class ShopAppLogingCubit extends Cubit<ShopAppLoginState> {
  ShopAppLogingCubit() : super(ShopappInitial());
  static ShopAppLogingCubit get(context) => BlocProvider.of(context);
  LoginModel? loginmodel;
  void UserLogin({
    required email,
    required password,
  }) {
    emit(ShoppingloginLodingState());
    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      loginmodel = LoginModel.fromjson(value.data);
      print(loginmodel!.message);
      emit(ShoppingloginSuccesState(loginmodel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShoppingloginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPasswod = true;
  void changePasswordVisibility() {
    isPasswod = !isPasswod;
    isPasswod
        ? suffix = Icons.visibility_off_outlined
        : suffix = Icons.visibility_outlined;
    emit(PasswordVisibilityState());
  }
}
