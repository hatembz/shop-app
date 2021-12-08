part of 'shopapplogin_cubit.dart';

@immutable
abstract class ShopAppLoginState {}

class ShopappInitial extends ShopAppLoginState {}

class ShoppingloginLodingState extends ShopAppLoginState {}

class ShoppingloginSuccesState extends ShopAppLoginState {
  final LoginModel loginmodel;

  ShoppingloginSuccesState(this.loginmodel);
}

class ShoppingloginErrorState extends ShopAppLoginState {
  final String error;

  ShoppingloginErrorState(this.error);
}

class PasswordVisibilityState extends ShopAppLoginState {}
