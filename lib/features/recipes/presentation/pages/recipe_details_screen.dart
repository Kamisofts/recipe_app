import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/const_durations.dart';
import '../../../../core/widget/annotated_scaffold.dart';
import '../../../recipes/presentation/widgets/recipe_details/animated_info_widget.dart';
import '../../../recipes/presentation/widgets/recipe_details/time_line_sliding_panel.dart';
import '../blocs/recipe_bloc/recipe_bloc.dart';
import '../widgets/recipe_details/animated_app_bar_widget.dart';
import '../widgets/recipe_details/animated_dish_widget.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, recipeBloc) {
        return AnnotatedScaffold(

          // assetPath: "assets/images/recipe_details.png",
          child: LayoutBuilder(builder: (context, constraints) {

            return TimeLineSlidingPanel(
                recipe: recipeBloc.recipe!,
                constraints: constraints,
                body: Column(
                  children: [
                    AnimatedAppBarWidget(
                      name: recipeBloc.recipe!.name!,
                      appBarPlayTime: ConstDurations.appBarPlayTime,
                      appBarDelayTime: ConstDurations.appBarDelayTime,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    AnimatedDishWidget(
                      constraints: constraints,
                      imageUrl: recipeBloc.recipe!.imageUrl!,
                      dishPlayTime: ConstDurations.dishPlayTime,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    AnimatedInfoWidget(
                        nutrition: recipeBloc.recipe!.nutrition!,
                        infoDelayTime: ConstDurations.infoDelayTime,
                        infoPlayTime: ConstDurations.infoPlayTime,
                        constraints: constraints),
                  ],
                ));
          }),
        );
      },
    );

  }
}
