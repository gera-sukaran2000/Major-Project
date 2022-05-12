import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiRecipe {
  @required
  String label;
  @required
  String imgUrl;
  @required
  List<dynamic> ingredients;
  @required
  double calories;
  @required
  String sourceDirections;
  @required
  double servings;
  @required
  double cookTime;

  ApiRecipe(
      {this.label,
      this.imgUrl,
      this.calories,
      this.ingredients,
      this.cookTime,
      this.servings,
      this.sourceDirections});
}

class ApiRecipeList with ChangeNotifier {
  List<ApiRecipe> recipelist = [];

  List<ApiRecipe> get recipesData {
    return [...recipelist];
  }

  Future<int> getData(String searchKey) async {
    final url = Uri.parse(
        'https://api.edamam.com/search?q=${searchKey}&app_id=76a54b55&app_key=87878179751e5df01ef9c5e70ae731cf');

    final response = await http.get(url);

    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData['count'] <= 0) {
      return 1;
    }
    final recipeList = extractedData['hits'] as List<dynamic>;
    recipeList.forEach((recipe) {
      recipelist.add(ApiRecipe(
        calories: recipe['recipe']['calories'],
        servings: recipe['recipe']['yield'],
        imgUrl: recipe['recipe']['image'],
        label: recipe['recipe']['label'],
        cookTime: recipe['recipe']['totalTime'],
        ingredients: recipe['recipe']['ingredientLines'],
        sourceDirections: recipe['recipe']['url'],
      ));
    });
    return 0;
  }
}
