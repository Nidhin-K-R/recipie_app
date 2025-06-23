import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/constants/app_constants.dart';
import 'package:recipe_app/core/provider/button_provider.dart';

class AppWidgets {
  //focus nodes
  static final userName = FocusNode();
  static final email = FocusNode();
  static final password = FocusNode();
  static final newPassword = FocusNode();
  static final button = FocusNode();
  static var passwordValue;

  static Widget texts({required String label, required TextStyle? style}) {
    return Text(label, style: style);
  }

  //email
  static Widget emailfield({
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
          // controller.clear();
          return "enter valid email";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(hintText: label, icon: Icon(Iconsax.sms)),
    );
  }

  // username
  static Widget userNamefield({
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
  static Widget passwordfield({
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
                // controller.clear();
                return "password must be at least 6 characters";
              }
              if (value != passwordValue) {
                return "password incorrect ";
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

  static Widget newPasswordfield({
    required String label,
    required var controller,
    required BuildContext context,
  }) {
    return TextFormField(
      validator: (value) {
        passwordValue = value;
        if (value == null || value.isEmpty) {
          return "please enter new password";
        }
        if (value.length < 6) {
          controller.clear();
          return "password must be at least 6 characters";
        }

        return null;
      },
      focusNode: newPassword,
      onFieldSubmitted:
          (value) => FocusScope.of(context).requestFocus(password),
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(icon: Icon(Iconsax.key), hintText: label),
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

  static Widget buttonAuth({
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      focusNode: button,
      onFocusChange: (value) => print("button focus"),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, 45.h),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
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

  static Widget searchBar() {
    return SearchBar(
      hintText: "Search recipes",
      trailing: [
        Icon(Iconsax.search_normal, color: Colors.grey, size: 18.sp),
        SizedBox(width: 15.w),
      ],
    );
  }

  static Widget categoryCard({
    required String category,
    required String image,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        print("TApped category");
      },
      child: Column(
        children: [
          Image.asset(image, height: 80.h, width: 80.w),
          texts(label: category, style: TextTheme.of(context).labelSmall),
        ],
      ),
    );
  }
}
