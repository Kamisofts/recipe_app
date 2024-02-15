import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recipe_app/features/OnBoardingScreens/presentation/widgets/onboarding_screen_widgets.dart';
import '../../../../core/constants/const_durations.dart';
import '../../../../core/widget/annotated_scaffold.dart';
import '../../../Recipes/presentation/pages/home_screen.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  AnnotatedScaffold(child: Column(
      children: [
        const Flexible(
          child: SizedBox(
            height: 50,
          ),
        ),
        Flexible(
          flex: 6,
          child: AnimatedDishWidget(
            dishPlayDuration: ConstDurations.mainPlayDuration,
            leavesDelayDuration: ConstDurations.leavesDelayDuration,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Flexible(
          flex: 2,
          child: AnimatedTitleWidget(
              titleDelayDuration: ConstDurations.titleDelayDuration,
              mainPlayDuration: ConstDurations.mainPlayDuration),
        ),
        const SizedBox(
          height: 20,
        ),
        Flexible(
          flex: 1,
          child: AnimatedDescriptionWidget(
            descriptionPlayDuration: ConstDurations.mainPlayDuration,
            descriptionDelayDuration: ConstDurations.descriptionDelayDuration,
          ),
        ),
        Expanded(
          flex: 3,
          child: GestureDetector(
            onTap: () {
              _controller.forward();
              _controller.addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  Future.delayed(400.ms, () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()));
                  });
                }
              });
            },
            child: AnimatedButtonWidget(
                buttonDelayDuration: ConstDurations.buttonDelayDuration,
                buttonPlayDuration: ConstDurations.buttonPlayDuration),
          ),
        )
      ],
    )
        .animate(
      autoPlay: false,
      controller: _controller,
    )
        .blurXY(begin: 0, end: 25, duration: 600.ms, curve: Curves.easeInOut)
        .scaleXY(begin: 1, end: 0.6)
        .fadeOut(
      begin: 1,
    ));
  }
}
