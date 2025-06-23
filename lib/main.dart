import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/provider/button_provider.dart';
import 'package:recipe_app/core/theme/app_themes.dart';
import 'package:recipe_app/mainscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      builder:
          (context, child) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => ButtonProvider()),
            ],

            child: MaterialApp(
              theme: AppThemes.lightTheme,
              debugShowCheckedModeBanner: false,
              home: Mainscreen(),
            ),
          ),
    );
  }
}
