import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/app_constants.dart';

class AppThemes {
  // colors for each thems.

  //get the light theme

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        displayLarge: TextStyle(color: AppConstants.textColor),
        bodyMedium: TextStyle(color: AppConstants.subTextColor, fontSize: 50),
      ),
    );
  }

  // get the dark theme

  static ThemeData get darkTheme {
    return ThemeData(brightness: Brightness.dark, primaryColor: Colors.black);
  }
}
