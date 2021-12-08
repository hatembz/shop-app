import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/cubit/shop_cubit/shop_cubit.dart';
import 'package:shop/network/cache_helper.dart';
import 'package:shop/screens/login_screen.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
    ShopCubit.get(context).currentIndex = 0;
  });
}

String? token;
