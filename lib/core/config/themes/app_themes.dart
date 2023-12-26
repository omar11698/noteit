import 'package:flutter/material.dart';
import 'package:noteit/core/utils/constants/utility/colors.dart';

abstract class AppTheme {

  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(elevation: 0,color: Colors.white,titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 24)),
      scaffoldBackgroundColor: Colors.white,
      navigationBarTheme: const NavigationBarThemeData(
        indicatorColor: Colors.redAccent,
        backgroundColor: Colors.redAccent,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(unselectedItemColor: Colors.black),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.redAccent),
      primaryColor: Colors.white,
      splashColor: Colors.black,
      fontFamily: "IBM",
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme:  AppBarTheme(elevation: 0,color: Colors.grey.withOpacity(0.3),titleTextStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 24)),
      bottomAppBarTheme:  BottomAppBarTheme(color: Colors.grey.withOpacity(0.3),),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.black,unselectedItemColor: Colors.blue),
      scaffoldBackgroundColor: Colors.grey.withOpacity(0.3),
      navigationBarTheme: const NavigationBarThemeData(
        indicatorColor: Colors.redAccent,
        backgroundColor: Colors.redAccent,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.white,foregroundColor: Colors.red),
      primaryColor: Colors.black,
      splashColor: Colors.white,
      fontFamily: "IBM",
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
    );
  }


}
