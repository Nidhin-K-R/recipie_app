// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:recipe_app/model/data/data_model.dart';

// class ApiServices {
//   static const String baseUrl = "https://dummyjson.com/recipes";

//   static Future<List<DataModel>> getRecipes() async {
//     final response = await http.get(Uri.parse(baseUrl));

//     if (response.statusCode == 200) {
//       print(response.statusCode);
//       final data = jsonDecode(response.body)['recipes'];
//       print(data);
//       final List<DataModel> recipes = [];
//       recipes.add(data);
//       return recipes;
//     } else {
//       print("Not get");
//       return [];
//     }
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_app/model/data/data_model.dart';

class ApiServices {
  static const String baseUrl = "https://dummyjson.com/recipes";

  static Future<List<DataModel>> getRecipes() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['recipes'];

        // ✅ Parse the list into List<DataModel>

        return data.map((json) => DataModel.fromJson(json)).toList();
      } else {
        print("Failed to fetch recipes. Status code: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Exception occurred while fetching recipes: $e");
      return [];
    }
  }
}
