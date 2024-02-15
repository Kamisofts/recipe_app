part of 'recipe_bloc.dart';


abstract class RecipeEvent {}

class AllRecipesEvent extends RecipeEvent{}
class SelectRecipesEvent extends RecipeEvent{
  final ModelRecipe recipe;

  SelectRecipesEvent({required this.recipe});
}
