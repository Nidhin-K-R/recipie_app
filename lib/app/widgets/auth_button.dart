import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/constants/app_constants.dart';

class AuthButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const AuthButton({
    super.key,
    required String this.label,
    required VoidCallback this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      focusNode: AppConstants.button,
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
}
