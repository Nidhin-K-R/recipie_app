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
  List<DataModel> recipes = [];
  Future<void> fetch() async {
    final recipe = await ApiServices.getRecipes();
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
                SizedBox(height: 40.h),
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
                  label: "Meals ",
                  style: TextTheme.of(context).labelSmall,
                ),

                Container(
                  height: 260.h,
                  //margin: EdgeInsets.only(left: 50.w, top: 1.h),
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = recipes[index];
                      return Row(
                        children: [
                          Card(
                            elevation: 10,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              height: 250.h,
                              width: 220.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(recipe.image),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 30.w),
                        ],
                      );
                    },
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
