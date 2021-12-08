import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/login_cubit/shopapplogin_cubit.dart';
import 'package:shop/cubit/shop_cubit/shop_cubit.dart';
import 'package:shop/network/cache_helper.dart';
import 'package:shop/screens/login_screen.dart';
import 'package:shop/screens/onboarding_screem.dart';
import 'package:shop/screens/shop_layout.dart';
import 'package:shop/shared/constants.dart';
import 'package:shop/themes/theme.dart';

import 'cubit/observer.dart';
import 'network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  CacheHelper.setData(key: 'isDark', data: false);
  Widget widget;
  bool? isDark = CacheHelper.getData(key: 'isDark');
  bool? onBoarding = CacheHelper.getData(key: 'onBoard');
  token = CacheHelper.getData(key: 'token');
  if (onBoarding != false && onBoarding != null) {
    if (token != null) {
      widget = const ShopLayout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = const obBoardingScreen();
  }

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget startWidget;

  const MyApp({Key? key, required this.isDark, required this.startWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShopCubit()
            ..getHomeData()
            ..getCategoryData(),
        ),
        BlocProvider(
          create: (context) => ShopAppLogingCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home: startWidget,
      ),
    );
  }
}
