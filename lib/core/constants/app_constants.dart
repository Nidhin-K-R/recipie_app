import 'package:flutter/material.dart';

class AppConstants {
  static const Color primaryColor = Color(0xFF0C9A62);
  static const Color accentColor = Color(0xFF55BA86);
  static const Color textColor = Color(0xFF1E1F24);
  static const Color subTextColor = Color(0xFF62636C);
  static const Color commonUseColor = Color(0xFF8B8D98);
  //signup
  static const String sHeadding = "Create an account";
  static const String sSubTitle =
      "Let's help you set up your account,\nit won't take long.";
  //Login
  static const String lHeadding = "Hello,";
  static const String lSubTitle = "Welcome Back!";
  //new password
  static const String passwordHedding = "New Password";
  static const String passwordTitle =
      "Your new password must be different from previously used passwords";
  // home screen
  static const String hHedding = "Got a tasty dish in mind?";
  //validator
  //  .......auth
  static final lformKey = GlobalKey<FormState>();
  static final sformKey = GlobalKey<FormState>();
  // .......new password
  static final nformKey = GlobalKey<FormState>();
}
