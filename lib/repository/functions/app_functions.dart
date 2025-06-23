import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/app_constants.dart';

class AppFunctions {
  static void navigate(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (ctx) => screen),
    );
  }

  static entryPoint(BuildContext context, Widget screen) {
    if (AppConstants.sformKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => screen));
    }
  }

  static entryPoint2(BuildContext context, Widget screen) {
    if (AppConstants.lformKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => screen));
    }
  }

  static entryPoint3(BuildContext context, Widget screen) {
    if (AppConstants.nformKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => screen));
    }
  }
}
