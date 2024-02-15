import 'package:recipe_app/features/Recipes/domain/entities/model_recipe.dart';

abstract class RecipeDatabase{

  Future<List<ModelRecipe>> getAllRecipes();
}