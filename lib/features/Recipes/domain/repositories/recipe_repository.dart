import 'package:dartz/dartz.dart';
import 'package:recipe_app/features/Recipes/domain/entities/model_recipe.dart';

import '../../../../core/utils/failure.dart';

abstract class RecipeRepository{

  Future<Either<Failure, List<ModelRecipe>>> getAllRecipes();
}