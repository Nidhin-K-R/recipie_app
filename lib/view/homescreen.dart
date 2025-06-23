import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipe_app/core/constants/app_constants.dart';
import 'package:recipe_app/widgets/app_widgets.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  AppConstants.hHedding,
                  style: TextTheme.of(context).headlineLarge,
                ),
                SizedBox(height: 10.h),
                AppWidgets.searchBar(),
                SizedBox(height: 40.h),
                AppWidgets.texts(
                  label: "Categories",
                  style: TextTheme.of(context).labelLarge,
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  height: 130.sp,
                  width: double.infinity,

                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      AppWidgets.categoryCard(
                        category: "Breakfast",
                        image: "assets/images/breakfast.png",
                        context: context,
                      ),
                      SizedBox(width: 10.w),
                      AppWidgets.categoryCard(
                        category: "Lunch",
                        image: "assets/images/lunch.png",
                        context: context,
                      ),
                      SizedBox(width: 10.w),
                      AppWidgets.categoryCard(
                        category: "Evening",
                        image: "assets/images/evening.png",
                        context: context,
                      ),
                      SizedBox(width: 10.w),
                      AppWidgets.categoryCard(
                        category: "Dinner",
                        image: "assets/images/dinner.png",
                        context: context,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
