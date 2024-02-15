import 'package:dartz/dartz.dart';
import 'package:recipe_app/features/recipes/domain/entities/model_recipe.dart';
import 'package:recipe_app/features/recipes/domain/repositories/recipe_repository.dart';
import '../../../../core/utils/failure.dart';
import '../../../../core/utils/use_case.dart';



class GetAllRecipeUseCase implements UseCase<List<ModelRecipe>, NoParams> {
  final RecipeRepository repository;

  GetAllRecipeUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ModelRecipe>>> call(NoParams params) async {
    return await repository.getAllRecipes();
  }
}
