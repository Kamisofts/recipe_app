
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recipe_app/features/recipes/presentation/widgets/home/home_screen_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/const_durations.dart';
import '../../../../core/widget/annotated_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showRecipeList = false;
  void changeListVisibility() {
    setState(() {
      _showRecipeList = true;
    });
  }

  @override
  void initState() {
    Future.delayed(2550.ms, () => changeListVisibility());
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {

    return AnnotatedScaffold(
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                 SizedBox(
                  height: 5.h,
                ),
                AnimatedAppBarWidget(
                    avatarWaitingDuration: ConstDurations.avatarWaitingDuration,
                    avatarPlayDuration: ConstDurations.avatarPlayDuration,
                    nameDelayDuration: ConstDurations.nameDelayDuration,
                    namePlayDuration: ConstDurations.namePlayDuration),
                 SizedBox(
                  height: 5.h,
                ),
                AnimatedCategoryList(
                  categoryListPlayDuration: ConstDurations.categoryListPlayDuration,
                  categoryListDelayDuration: ConstDurations.categoryListDelayDuration,
                ),
                 SizedBox(
                  height: 2.h,
                ),
                AnimatedSelectedCategoryWidget(
                  selectedCategoryPlayDuration: ConstDurations.selectedCategoryPlayDuration,
                  selectedCategoryDelayDuration: ConstDurations.selectedCategoryDelayDuration,
                ),
                 SizedBox(
                  height: 3.h,
                ),
              ],
            ),
          ),

          _showRecipeList
              ? const AnimatedRecipesWidget()
              : const SliverToBoxAdapter(
                  child: SizedBox(),
                )
        ],
      ),
    );
  }
}
