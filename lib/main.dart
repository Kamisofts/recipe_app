import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/utils/main_method.dart';
import 'package:recipe_app/features/recipes/presentation/blocs/recipe_bloc/recipe_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/theme/app_theme.dart';
import 'core/utils/injections.dart';
import 'features/on_boarding/presentation/pages/onboarding_screen.dart';

void main() {
  MainMethods.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<RecipeBloc>()),
        ],
        child: ResponsiveSizer(builder: (context, orientation, screenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Recipes',

            theme: mainTheme,
            darkTheme: mainTheme,
            themeMode: ThemeMode.dark,
            home: const OnBoardingScreen(),
          );
        }));
  }
}
