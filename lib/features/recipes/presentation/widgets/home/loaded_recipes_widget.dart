import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recipe_app/features/recipes/presentation/blocs/recipe_bloc/recipe_bloc.dart';
import 'package:recipe_app/features/recipes/presentation/pages/recipe_details_screen.dart';
import 'package:recipe_app/features/recipes/presentation/widgets/home/recipe_card_widget.dart';

import '../../../../../core/utils/injections.dart';
import '../../../domain/entities/model_recipe.dart';

class LoadedRecipesWidget extends StatelessWidget {
  final List<ModelRecipe> recipes;

  const LoadedRecipesWidget({
    super.key,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            sl<RecipeBloc>().add(SelectRecipesEvent(recipe: recipes[index]));

            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const RecipeDetailsScreen()));
            // Navigator.of(context).pushNamed(
            //   'recipe_details',
            //   arguments: recipes[index],
            // );
          },
          child: RecipeCardWidget(
            recipeMdl: recipes[index],
          ).animate().slideX(
              duration: 200.ms,
              delay: 0.ms,
              begin: 1,
              end: 0,
              curve: Curves.easeInOutSine),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6
      ),
    );
  }
}
