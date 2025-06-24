import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/app/widgets/app_widgets.dart';
import 'package:recipe_app/core/constants/app_constants.dart';
import 'package:recipe_app/core/provider/category_provider.dart';

class AppWidetBuilders {
  static Widget categorySection() {
    return SizedBox(
      height: 120.h,
      width: double.infinity,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AppWidgets.categoryItems[0].length,
        itemBuilder: (context, index) {
          return Consumer<CategoryProvider>(
            builder:
                (context, value, child) => Column(
                  children: [
                    InkWell(
                      radius: 23,
                      onTap: () {
                        value.changeCategory(index);
                      },
                      child: Card(
                        elevation: 0,
                        color:
                            value.selectedIndex == index
                                ? AppConstants.accentColor
                                : Colors.white,
                        child: Image.asset(
                          AppWidgets.categoryItems[0][index],

                          height: 80.h,
                          width: 80.w,
                        ),
                      ),
                    ),
                    AppWidgets.texts(
                      label: AppWidgets.categoryItems[1][index],
                      style: TextTheme.of(context).titleSmall,
                    ),
                  ],
                ),
          );
        },
      ),
    );
  }

  static Widget mealsSection() {
    return SizedBox();
  }
}
