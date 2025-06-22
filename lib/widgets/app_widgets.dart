import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/provider/button_provider.dart';

class AppWidgets {
  bool click = false;
  // textfields
  static Widget normalTextfield({
    required String label,
    required var controller,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade300,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: label,
      ),
    );
  }

  static Widget passwordTextfield({
    required String label,
    required var controller,
  }) {
    return Consumer<ButtonProvider>(
      builder:
          (context, value, child) => Stack(
            children: [
              TextFormField(
                obscureText: value.click ? false : true,
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintText: label,
                ),
              ),
              Positioned(
                //   left: 200,
                right: 10.w,
                top: 2.h,
                child: IconButton(
                  onPressed: () {
                    value.changeIcon();
                  },
                  icon: Icon(
                    value.click ? Iconsax.eye : Iconsax.eye_slash,
                    size: 30.r,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  static Widget labelTexts({
    required String label,
    required double size,
    var color,
  }) {
    return Text(
      label,
      style: TextStyle(
        fontSize: size.sp,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  static Widget textButton({
    required String label,
    required double size,
    var color,
  }) {
    return TextButton(
      onPressed: () {},
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: size.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
