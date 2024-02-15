// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recipe_app/core/constants/const_colors.dart';
import 'package:recipe_app/core/constants/const_texts.dart';

class AnimatedTitleWidget extends StatelessWidget {
  final Duration titleDelayDuration;
  final Duration mainPlayDuration;

  const AnimatedTitleWidget({
    super.key,
    required this.titleDelayDuration,
    required this.mainPlayDuration,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text.rich(
          TextSpan(
              style: Theme.of(context).textTheme.displaySmall,
              children: const [
                TextSpan(
                  text: ConstTexts.onBoardingTitle,
                ),
                TextSpan(
                    text: ' everyday',
                    style: TextStyle(color: ConstColors.timeLineColor)),
              ]),
          textAlign: TextAlign.center,
        ),
      ),
    )
        .animate()
        .slideY(
            begin: -0.2,
            end: 0,
            delay: titleDelayDuration,
            duration: mainPlayDuration,
            curve: Curves.easeInOutCubic)
        .scaleXY(
            begin: 0,
            end: 1,
            delay: titleDelayDuration,
            duration: mainPlayDuration,
            curve: Curves.easeInOutCubic);
  }
}
