 import 'package:dartz/dartz.dart';

import 'package:recipe_app/core/utils/failure.dart';
import 'package:recipe_app/features/recipes/data/data_sources/recipe_database.dart';

import 'package:recipe_app/features/recipes/domain/entities/model_recipe.dart';

import '../../domain/repositories/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository{
  RecipeDatabase database;

  RecipeRepositoryImpl({required this.database});
  @override
  Future<Either<Failure, List<ModelRecipe>>> getAllRecipes() async {
    try {
      final result = await database.getAllRecipes();

      return Right(result);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

}