
import 'package:get_it/get_it.dart';
import 'package:recipe_app/features/recipes/data/data_sources/recipe_database.dart';
import 'package:recipe_app/features/recipes/data/data_sources/recipe_database_impl.dart';
import 'package:recipe_app/features/recipes/data/repositories/recipe_repository_impl.dart';
import 'package:recipe_app/features/recipes/domain/repositories/recipe_repository.dart';
import 'package:recipe_app/features/recipes/domain/use_cases/get_all_recipe_use_case.dart';
import 'package:recipe_app/features/recipes/presentation/blocs/recipe_bloc/recipe_bloc.dart';


final sl = GetIt.instance;

Future<void> init() async {
  //! Blocs
  sl.registerLazySingleton<RecipeBloc>(() => RecipeBloc(getAllRecipeUseCase: sl()));


  //! USE CASES
  ///
  sl.registerLazySingleton(() => GetAllRecipeUseCase(repository: sl()));

  //! REPOSITORIES
  sl.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(database: sl()),
  );

  //! DATA SOURCES
  sl.registerLazySingleton<RecipeDatabase>(
    () => RecipeDatabaseImpl(),
  );

  //! CORE

  //! EXTERNAL
  // sl.registerLazySingleton(() => Dio());
  // final sharedPref = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPref);

  //! Initial Functions
  sl<RecipeBloc>().add(AllRecipesEvent());

}
