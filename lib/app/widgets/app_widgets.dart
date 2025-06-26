import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/constants/app_constants.dart';
import 'package:recipe_app/core/provider/button_provider.dart';
import 'package:recipe_app/core/provider/category_provider.dart';

class AppWidgets {
  //focus nodes
  static final userName = FocusNode();
  static final email = FocusNode();
  static final password = FocusNode();
  static final newPassword = FocusNode();
  static final button = FocusNode();
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
      focusNode: newPassword,
      onFieldSubmitted:
          (value) => FocusScope.of(context).requestFocus(password),
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
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 20.r, fontWeight: FontWeight.bold),
      ),
    );
  }

  // google button
  static Widget googleButton() {
    return InkWell(
      child: Image.asset(
        "assets/images/google.jpeg",
        height: 80.r,
        width: 80.r,
      ),
    );
  }

  // facebook button
  static Widget facebookButton() {
    return InkWell(
      child: Image.asset(
        "assets/images/facebook.jpeg",
        height: 55.r,
        width: 55.r,
      ),
    );
  }

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
  static Widget exploreCard() {
    return SizedBox(
      height: 200.h,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30.h),
            height: 130.h,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppConstants.accentColor, AppConstants.primaryColor],
              ),

              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cook the best\nrecipes at home",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.r,
                      color: Colors.white,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Explore"),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150.w, 25.h),
                      foregroundColor: AppConstants.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(1.2.w, 0),
            child: Image.asset(
              "assets/images/chef.png",

              height: 180.r,
              filterQuality: FilterQuality.high,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
  // category

  static List<List<String>> categoryItems = [
    [
      "assets/images/breakfast.png",
      "assets/images/lunch.png",
      "assets/images/evening.png",
      "assets/images/dinner.png",
      "assets/images/desert.png",
      "assets/images/juice.png",
    ],
    ["Breakfast", "Lunch", "Snacks", "Dinner", "Desert", "Juice"],
  ];

  //allcategory button
  static Widget allCategoryButton() {
    return Consumer<CategoryProvider>(
      builder:
          (context, value, child) => TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                value.selectedIndex == -1
                    ? AppConstants.accentColor
                    : Colors.white,
              ),
            ),
            onPressed: () {
              value.changeCategory(-1);
            },
            child: Text(
              "All",
              style: TextStyle(
                fontSize: 15.r,
                color: value.selectedIndex == -1 ? Colors.white : Colors.teal,
              ),
            ),
          ),
    );
  }

  //popular recipie
  static Widget popularCard() {
    return InkWell(child: Card());
  }
}
