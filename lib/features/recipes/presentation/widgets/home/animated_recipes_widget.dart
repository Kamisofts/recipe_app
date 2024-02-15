// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/recipes/presentation/blocs/recipe_bloc/recipe_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'loaded_recipes_widget.dart';

class AnimatedRecipesWidget extends StatelessWidget {
  const AnimatedRecipesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, recipe) {
        return LoadedRecipesWidget(
          recipes: recipe.allRecipes,
        );
      },
    );
  }
}
