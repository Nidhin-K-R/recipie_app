import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          child: Image.asset(
            "assets/images/google.jpeg",
            height: 80.r,
            width: 80.r,
          ),
        ),
        InkWell(
          child: Image.asset(
            "assets/images/facebook.jpeg",
            height: 55.r,
            width: 55.r,
          ),
        ),
      ],
    );
  }
}
