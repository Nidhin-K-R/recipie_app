import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/app/widgets/app_widgets.dart';
import 'package:recipe_app/core/constants/app_constants.dart';
import 'package:recipe_app/core/provider/category_provider.dart';

// ignore: must_be_immutable
class Categories extends StatelessWidget {
  Categories({super.key});
  List<List<String>> categoryItems = [
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppWidgets.texts(
              label: "Categories",
              style: TextTheme.of(context).labelLarge,
            ),
            Consumer<CategoryProvider>(
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
                        color:
                            value.selectedIndex == -1
                                ? Colors.white
                                : Colors.teal,
                      ),
                    ),
                  ),
            ),
          ],
        ),
        SizedBox(
          height: 100.h,
          width: double.infinity,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryItems[0].length,
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
                              categoryItems[0][index],

                              height: 60.h,
                              width: 60.w,
                            ),
                          ),
                        ),
                        AppWidgets.texts(
                          label: categoryItems[1][index],
                          style: TextTheme.of(context).labelSmall,
                        ),
                      ],
                    ),
              );
            },
          ),
        ),
      ],
    );
  }
}
