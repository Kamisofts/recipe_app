part of 'recipe_bloc.dart';


abstract class RecipeState {

  final List<ModelRecipe> allRecipes;
  final ModelRecipe? recipe;

  RecipeState( {required this.allRecipes,this.recipe});
}

class RecipeInitial extends RecipeState {
  RecipeInitial({required super.allRecipes, super.recipe});
}
