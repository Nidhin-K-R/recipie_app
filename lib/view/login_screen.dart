import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/app/widgets/auth_button.dart';
import 'package:recipe_app/app/widgets/social_auth_button.dart';
import 'package:recipe_app/core/constants/app_constants.dart';
import 'package:recipe_app/repository/functions/app_functions.dart';
import 'package:recipe_app/view/homescreen.dart';

import 'package:recipe_app/view/sign_up_screen.dart';
import 'package:recipe_app/app/widgets/app_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 70.h, horizontal: 30.w),
            child: Form(
              key: AppConstants.lformKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.texts(
                    label: AppConstants.lHeadding,
                    style: TextTheme.of(context).titleLarge,
                  ),
                  AppWidgets.texts(
                    label: AppConstants.lSubTitle,
                    style: TextTheme.of(context).displayLarge,
                  ),
                  SizedBox(height: 70.h),
                  AppWidgets.texts(
                    label: "Email",
                    style: TextTheme.of(context).labelSmall,
                  ),
                  AppWidgets.emailfield(
                    label: "Enter email",
                    controller: _emailController,
                    context: context,
                  ),
                  SizedBox(height: 15.h),
                  AppWidgets.texts(
                    label: "Password",
                    style: TextTheme.of(context).labelSmall,
                  ),
                  AppWidgets.passwordfield(
                    label: "Enter password",
                    controller: _passwordController,
                    context: context,
                  ),
                  SizedBox(height: 5.h),
                  AppWidgets.textButton(
                    label: "Forgot Password?",
                    size: 15,
                    onPressed: () {},
                  ),
                  SizedBox(height: 25.h),
                  AuthButton(
                    label: "Log In",
                    onPressed:
                        () => AppFunctions.entryPoint2(context, Homescreen()),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                          indent: 10.w,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "Or SignUp With",
                        style: TextTheme.of(context).bodySmall,
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                          endIndent: 10.w,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SocialAuthButton(),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppWidgets.texts(
                        label: "Don't have an account?",
                        style: TextTheme.of(context).labelMedium,
                      ),

                      AppWidgets.textButton(
                        label: "SignUp",
                        size: 20,
                        onPressed: () {
                          AppFunctions.navigate(context, SignUpScreen());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
