import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/Recipes/domain/entities/model_recipe.dart';

import '../../../../../core/utils/use_case.dart';
import '../../../domain/use_cases/get_all_recipe_use_case.dart';

part 'recipe_event.dart';

part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  GetAllRecipeUseCase getAllRecipeUseCase;

  RecipeBloc({required this.getAllRecipeUseCase}) : super(RecipeInitial(allRecipes: [])) {
    on<RecipeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AllRecipesEvent>((event, emit) async {

      var results = await getAllRecipeUseCase(NoParams());

      results.fold((failure) {}, (value) {

          emit(RecipeInitial( allRecipes: value));

      });
    });
    on<SelectRecipesEvent>((event, emit) async {

      emit(RecipeInitial( allRecipes: state.allRecipes,recipe: event.recipe));

    });
  }
}
