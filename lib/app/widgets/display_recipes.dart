import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/app/widgets/app_widgets.dart';
import 'package:recipe_app/services/api_services.dart';

class DisplayRecipes extends StatelessWidget {
  final List list;
  const DisplayRecipes({required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 460.h,
      width: double.infinity,
      child: FutureBuilder(
        future: ApiServices.getRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error"));
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 300.h,

                  child: Column(
                    children: [
                      SizedBox(
                        height: 100.h,
                        width: 100.w,
                        child: Image.network(list[index].image),
                      ),
                      SizedBox(height: 15.h),
                      AppWidgets.texts(
                        label: list[index].name,
                        style: TextTheme.of(context).titleSmall,
                      ),
                    ],
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
