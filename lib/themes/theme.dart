import 'package:flutter/material.dart';

import 'colors.dart';

var lightTheme = ThemeData(
      textTheme: TextTheme(
        // bodyText1: TextStyle(color: Colors.white,fontSize: ),
        bodyText2: const TextStyle(
            color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
        headline1: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        headline2: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        headline3: const TextStyle(
          fontSize: 10.0,
          color: Colors.black,
        ),
        headline4: TextStyle(
          color: Colors.grey[600],
          fontSize: 18,
        ),
      ),
      colorScheme: const ColorScheme.light(
        primary: defaultColor,
        secondary: defaultColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        selectedItemColor: defaultColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: defaultColor)),
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
    ),
    darkTheme = ThemeData(
      textTheme: const TextTheme(
        // bodyText1: TextStyle(color: Colors.white,fontSize: ),
        bodyText2: TextStyle(
            color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        headline1: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        headline2: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        headline3: TextStyle(
          fontSize: 10.0,
          color: Colors.white,
        ),
        headline4: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      colorScheme: const ColorScheme.dark(
        primary: defaultColor,
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff3a3a38),
          elevation: 0.0,
          iconTheme: IconThemeData(color: defaultColor)),
      scaffoldBackgroundColor: const Color(0xff3a3a38),
      backgroundColor: const Color(0xff3a3a38),
    );
