import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:recipe_app/app/widget-builders/widget_builders.dart';
import 'package:recipe_app/core/constants/app_constants.dart';
import 'package:recipe_app/app/widgets/app_widgets.dart';

import 'package:recipe_app/model/data/data_model.dart';
import 'package:recipe_app/services/api_services.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  static List<DataModel> recipes = [];
  Future<void> fetch() async {
    final recipe = await ApiServices.getRecipes();
    print(recipe);
    setState(() {
      recipes = recipe;
    });
  }

  @override
  void initState() {
    fetch();
    super.initState();
  }

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

                AppWidgets.exploreCard(),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.texts(
                      label: "Categories",
                      style: TextTheme.of(context).labelLarge,
                    ),
                    AppWidgets.allCategoryButton(),
                  ],
                ),
                AppWidetBuilders.categorySection(),
                AppWidgets.texts(
                  label: "Recommended for you ",
                  style: TextTheme.of(context).labelLarge,
                ),
                AppWidetBuilders.recommendedMeals(list: recipes),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
