import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/constants/app_constants.dart';
import 'package:recipe_app/repository/functions/app_functions.dart';
import 'package:recipe_app/view/homescreen.dart';
import 'package:recipe_app/app/widgets/app_widgets.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 30.w),
            child: Form(
              key: AppConstants.nformKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.texts(
                    label: AppConstants.passwordHedding,
                    style: TextTheme.of(context).titleMedium,
                  ),
                  SizedBox(height: 5.h),
                  AppWidgets.texts(
                    label: AppConstants.passwordTitle,
                    style: TextTheme.of(context).displayMedium,
                  ),
                  SizedBox(height: 70.h),
                  AppWidgets.texts(
                    label: "Password",
                    style: TextTheme.of(context).labelSmall,
                  ),
                  AppWidgets.newPasswordfield(
                    label: "Enter new password",
                    controller: _passwordController,
                    context: context,
                  ),
                  SizedBox(height: 15.h),
                  AppWidgets.texts(
                    label: "Confirm Password",
                    style: TextTheme.of(context).labelSmall,
                  ),
                  AppWidgets.passwordfield(
                    label: "Confirm password",
                    controller: _confirmPasswordController,
                    context: context,
                  ),
                  SizedBox(height: 40.h),
                  AppWidgets.buttonAuth(
                    label: "Change Password",
                    onPressed:
                        () => AppFunctions.entryPoint3(context, Homescreen()),
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
