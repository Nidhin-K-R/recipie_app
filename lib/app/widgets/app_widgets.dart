import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/constants/app_constants.dart';
import 'package:recipe_app/core/provider/button_provider.dart';

class AppWidgets {
  //focus nodes

  static var passwordValue;

  static Widget texts({required String label, required TextStyle? style}) {
    return Text(label, style: style, textAlign: TextAlign.center);
  }

  //email
  static Widget emailfield({
    required String label,
    required var controller,
    required BuildContext context,
  }) {
    return TextFormField(
      focusNode: AppConstants.email,
      onFieldSubmitted:
          (value) => FocusScope.of(context).requestFocus(AppConstants.password),
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
      focusNode: AppConstants.userName,
      onFieldSubmitted:
          (value) => FocusScope.of(context).requestFocus(AppConstants.email),
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
            focusNode: AppConstants.password,
            onFieldSubmitted:
                (value) =>
                    FocusScope.of(context).requestFocus(AppConstants.button),
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

  //new password
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
      focusNode: AppConstants.newPassword,
      onFieldSubmitted:
          (value) => FocusScope.of(context).requestFocus(AppConstants.password),
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(icon: Icon(Iconsax.key), hintText: label),
    );
  }

  //text button
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
          fontSize: size.r,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // button authentication

  // google button

  // facebook button

  // searchbar
  static Widget searchBar() {
    return SearchBar(
      hintText: "Search recipes",
      trailing: [
        Icon(Iconsax.search_normal, color: Colors.grey, size: 18.r),
        SizedBox(width: 15.w),
      ],
    );
  }

  // explore bar

  // category

  //allcategory button
}
