import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/app/widgets/app_widgets.dart';
import 'package:recipe_app/core/constants/app_constants.dart';
import 'package:recipe_app/core/provider/category_provider.dart';
import 'package:recipe_app/services/api_services.dart';

class AppWidetBuilders {
  static Widget categorySection() {
    return SizedBox(
      height: 100.h,
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

                          height: 60.h,
                          width: 60.w,
                        ),
                      ),
                    ),
                    AppWidgets.texts(
                      label: AppWidgets.categoryItems[1][index],
                      style: TextTheme.of(context).labelSmall,
                    ),
                  ],
                ),
          );
        },
      ),
    );
  }

  static Widget recommendedMeals({required List list}) {
    return SizedBox(
      height: 260.h,
      width: double.infinity,
      child: FutureBuilder(
        future: ApiServices.getRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error"));
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                final recipe = list[index];
                return SizedBox(
                  height: 150.r,
                  width: 150.r,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150.h,
                          width: 150.w,
                          child: Image.network(list[index].image),
                          //Center(child: CircularProgressIndicator()),
                        ),
                        AppWidgets.texts(
                          label: list[index].name,
                          style: TextTheme.of(context).titleSmall,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
