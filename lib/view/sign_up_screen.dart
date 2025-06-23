import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/constants/app_constants.dart';
import 'package:recipe_app/repository/functions/app_functions.dart';
import 'package:recipe_app/view/homescreen.dart';
import 'package:recipe_app/view/login_screen.dart';
import 'package:recipe_app/widgets/app_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Form(
              key: AppConstants.sformKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.texts(
                    label: AppConstants.sHeadding,
                    style: TextTheme.of(context).titleMedium,
                  ),
                  SizedBox(height: 5.h),
                  AppWidgets.texts(
                    label: AppConstants.sSubTitle,
                    style: TextTheme.of(context).displayMedium,
                  ),
                  SizedBox(height: 70.h),
                  AppWidgets.texts(
                    label: "Username",
                    style: TextTheme.of(context).labelSmall,
                  ),
                  AppWidgets.userNamefield(
                    label: "Enter Username",
                    controller: _usernameController,
                    context: context,
                  ),
                  SizedBox(height: 15.h),
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
                  SizedBox(height: 30.h),
                  AppWidgets.buttonAuth(
                    label: "Sign Up",
                    onPressed:
                        () => AppFunctions.entryPoint(context, Homescreen()),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppWidgets.googleButton(),
                      AppWidgets.facebookButton(),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppWidgets.texts(
                        label: "Don't have an account?",
                        style: TextTheme.of(context).labelMedium,
                      ),

                      AppWidgets.textButton(
                        label: "LogIn",
                        size: 20,
                        onPressed: () {
                          AppFunctions.navigate(context, LoginScreen());
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
