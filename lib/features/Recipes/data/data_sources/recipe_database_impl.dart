import 'dart:convert';

import 'package:recipe_app/features/Recipes/data/data_sources/recipe_database.dart';
import 'package:recipe_app/features/Recipes/domain/entities/model_recipe.dart';
import 'package:flutter/services.dart';

class RecipeDatabaseImpl implements RecipeDatabase {
  @override
  Future<List<ModelRecipe>> getAllRecipes() async {
    String filePath = "assets/recipes.json";
    final response = await rootBundle.loadString(filePath);

    final recipes = (jsonDecode(response) as List)
        .map((e) => ModelRecipe.fromMap(e))
        .toList();

    return recipes;
  }
}
