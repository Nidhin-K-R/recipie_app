import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/constants/app_constants.dart';
import 'package:recipe_app/core/provider/button_provider.dart';

class AppWidgets {
  //focus nodes
  static FocusNode userName = FocusNode();
  static FocusNode email = FocusNode();
  static FocusNode password = FocusNode();
  static FocusNode button = FocusNode();

  static Widget texts({required String label, required TextStyle? style}) {
    return Text(label, style: style);
  }

  //email
  static Widget emailTextfield({
    required String label,
    required var controller,
    required BuildContext context,
  }) {
    return TextFormField(
      focusNode: email,
      onFieldSubmitted:
          (value) => FocusScope.of(context).requestFocus(password),
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "please enter email";
        }
        if (!RegExp("^[a-zA=Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return "enter valid email";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(hintText: label, icon: Icon(Iconsax.sms)),
    );
  }

  // username
  static Widget userNameTextfield({
    required String label,
    required var controller,
    required BuildContext context,
  }) {
    return TextFormField(
      focusNode: userName,
      onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(email),
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "please enter username";
        }
        return null;
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(hintText: label, icon: Icon(Iconsax.user)),
    );
  }

  //password
  static Widget passwordTextfield({
    required String label,
    required var controller,
    required BuildContext context,
  }) {
    return Consumer<ButtonProvider>(
      builder:
          (context, value, child) => TextFormField(
            focusNode: password,
            onFieldSubmitted:
                (value) => FocusScope.of(context).requestFocus(button),
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter password";
              }
              if (value.length < 6) {
                return "password must be at least 6 characters";
              }
              return null;
            },
            obscureText: value.click ? true : false,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              icon: Icon(Iconsax.key),
              hintText: label,
              suffixIcon: IconButton(
                onPressed: () {
                  value.changeIcon();
                },
                icon: value.click ? Icon(Iconsax.eye_slash) : Icon(Iconsax.eye),
              ),
            ),
          ),
    );
  }

  static Widget textButton({
    required String label,
    required double size,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.lightGreen,
          fontSize: size.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static Widget buttonAuth({required String label}) {
    return ElevatedButton(
      focusNode: button,
      onFocusChange: (value) => print("button focus"),
      onPressed: () {
        if (AppConstants.formKey.currentState!.validate()) {
          print("Login Successful");
        }
      },
      child: Text(
        label,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, 45.h),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
    );
  }

  static Widget googleButton() {
    return InkWell(
      child: Image.asset(
        "assets/images/google.jpeg",
        height: 80.r,
        width: 80.r,
      ),
    );
  }

  static Widget facebookButton() {
    return InkWell(
      child: Image.asset(
        "assets/images/facebook.jpeg",
        height: 55.r,
        width: 55.r,
      ),
    );
  }
}
