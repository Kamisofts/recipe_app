// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/constants/const_durations.dart';
import '../../../domain/entities/model_recipe.dart';


class RecipeCardWidget extends StatelessWidget {
  final ModelRecipe recipeMdl;
  const RecipeCardWidget({
    super.key,
    required this.recipeMdl,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 50.h,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _AnimatedImageWidget(
              imageUrl: recipeMdl.imageUrl!,
              playDuration: ConstDurations.playDuration,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AnimatedNutritionText(
                  playDuration: ConstDurations.playDuration,
                  nutrition: recipeMdl.nutrition!,
                ),
                _AnimatedNameWidget(
                    playDuration: ConstDurations.playDuration, name: recipeMdl.name!),
                _AnimatedDescriptionWidget(
                    playDuration: ConstDurations.playDuration, description: recipeMdl.description!)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _AnimatedNutritionText extends StatelessWidget {
  final Duration playDuration;
  final Map<String, dynamic> nutrition;
  const _AnimatedNutritionText({
    super.key,
    required this.playDuration,
    required this.nutrition,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
              "${nutrition["calories"]}cal \t\t\t\t${nutrition["protein"]}protein",
              style: Theme.of(context).textTheme.labelMedium //label medium
              )
          .animate()
          .scaleXY(
              begin: 0,
              end: 1,
              delay: 300.ms,
              duration: playDuration - 100.ms,
              curve: Curves.decelerate),
    );
  }
}

class _AnimatedImageWidget extends StatelessWidget {
  final Duration playDuration;
  final String imageUrl;
  const _AnimatedImageWidget({
    super.key,
    required this.playDuration,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
            constraints: const BoxConstraints(maxHeight: 150, maxWidth: 150),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ))
        .animate(delay: 400.ms)
        .shimmer(duration: playDuration - 200.ms)
        .flip();
  }
}

class _AnimatedNameWidget extends StatelessWidget {
  final Duration playDuration;
  final String name;
  const _AnimatedNameWidget({
    super.key,
    required this.playDuration,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 150),
      alignment: Alignment.centerLeft,
      child: Text(name,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: true,
              style: Theme.of(context).textTheme.titleLarge //title large
              )
          .animate()
          .fadeIn(
              duration: 300.ms, delay: playDuration, curve: Curves.decelerate)
          .slideX(begin: 0.2, end: 0),
    );
  }
}

class _AnimatedDescriptionWidget extends StatelessWidget {
  final Duration playDuration;
  final String description;
  const _AnimatedDescriptionWidget({
    super.key,
    required this.playDuration,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(top: 10, left: 5, bottom: 10),
      constraints: const BoxConstraints(maxWidth: 150),
      child: Text(description,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              softWrap: true,
              style: Theme.of(context).textTheme.labelLarge //label large
              )
          .animate()
          .scaleXY(
              begin: 0,
              end: 1,
              delay: 300.ms,
              duration: playDuration - 100.ms,
              curve: Curves.decelerate),
    );
  }
}
