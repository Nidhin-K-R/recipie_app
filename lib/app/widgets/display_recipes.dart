import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayRecipes extends StatelessWidget {
  final List recipeList;
  const DisplayRecipes({super.key, required this.recipeList});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        child:
            recipeList.isEmpty
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                  shrinkWrap: true,
                  physics:
                      NeverScrollableScrollPhysics(), // Prevents nested scrolling
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 20.w,
                    childAspectRatio: 0.60.r, // Adjust based on design
                  ),
                  itemCount: recipeList.length,
                  itemBuilder: (context, index) {
                    final recipe = recipeList[index];
                    return Container(
                      width: 150.w,
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              recipe.image,
                              height: 120.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) =>
                                      Icon(Icons.broken_image),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            recipe.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.r,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              Icon(Icons.timer, size: 16.r),
                              SizedBox(width: 4.w),
                              Text('${recipe.prepTimeMinutes} min'),
                              Spacer(),
                              Icon(Icons.star, color: Colors.amber, size: 16.r),
                              SizedBox(width: 4.w),
                              Text(recipe.rating.toString()),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
