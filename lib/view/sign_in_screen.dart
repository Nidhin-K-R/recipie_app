import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/constants/app_constants.dart';

import 'package:recipe_app/widgets/app_widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignInScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.labelTexts(label: "Sign In", size: 30),
                SizedBox(height: 7.h),
                AppWidgets.labelTexts(
                  label: "Hi! Welcome back,you've been missed",
                  size: 18,
                  color: AppConstants.commonUseColor,
                ),
                SizedBox(height: 40.h),
                AppWidgets.labelTexts(label: "Email", size: 20),
                SizedBox(height: 7.h),
                AppWidgets.normalTextfield(
                  label: "Enter email",
                  controller: _controller,
                ),
                SizedBox(height: 20.h),
                AppWidgets.labelTexts(label: "Password", size: 20),
                SizedBox(height: 7.h),

                AppWidgets.passwordTextfield(
                  label: "password",
                  controller: _controller,
                ),
                SizedBox(height: 5.h),
                AppWidgets.textButton(
                  label: "forgot password?",
                  size: 15,
                  color: const Color(0xFFf5d60f),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
