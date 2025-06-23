import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/constants/app_constants.dart';

class AppThemes {
  // colors for each thems.

  //get the light theme

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppConstants.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        titleMedium: TextStyle(
          //create an account
          fontSize: 30.sp,
          color: AppConstants.textColor,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          //Let's help you set up your account,\nit won't take long.
          fontSize: 15.sp,
          fontWeight: FontWeight.w900,
          color: AppConstants.commonUseColor,
        ),
        titleLarge: TextStyle(
          //hello
          fontSize: 40.sp,
          fontWeight: FontWeight.bold,
          color: AppConstants.textColor,
        ),
        displayLarge: TextStyle(
          ////welcome back
          fontSize: 20.sp,
          color: AppConstants.textColor,
        ),
        labelSmall: TextStyle(
          // normal labels
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: AppConstants.textColor,
        ),
        //dont have an account
        labelMedium: TextStyle(
          fontSize: 18.sp,
          color: Colors.grey.shade400,
          fontWeight: FontWeight.bold,
        ),
        // or
        bodySmall: TextStyle(
          color: Colors.grey.shade500,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          //got a tasty dish
          fontSize: 30.sp,
          color: AppConstants.textColor,
          wordSpacing: 1.sp,
          fontWeight: FontWeight.bold,
        ),
        labelLarge: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      ),
      searchBarTheme: SearchBarThemeData(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        constraints: BoxConstraints(maxHeight: 50.h, minHeight: 40.h),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        elevation: WidgetStatePropertyAll(2),
        textStyle: WidgetStatePropertyAll(
          TextStyle(color: Colors.grey, fontSize: 18.sp),
        ),
      ),
    );
  }

  // get the dark theme

  static ThemeData get darkTheme {
    return ThemeData(brightness: Brightness.dark, primaryColor: Colors.black);
  }
}
