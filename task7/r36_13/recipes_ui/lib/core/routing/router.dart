import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_ui/core/api/dio_factory.dart';
import 'package:recipes_ui/core/routing/routes.dart';
import 'package:recipes_ui/features/recipes/data/models/recipes_model.dart';
import 'package:recipes_ui/features/recipes/data/remote_datasource/remote_data_source.dart';
import 'package:recipes_ui/features/recipes/data/repo/repo.dart';
import 'package:recipes_ui/features/recipes/presentation/bloc/recipes_cubit.dart';
import 'package:recipes_ui/features/recipes/presentation/pages/home_screen.dart';
import 'package:recipes_ui/features/recipes_details/pages/recipes_datails.dart';
import 'package:recipes_ui/features/splash/pages/splach_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: Routes.splash, builder: (context, state) => splashScreen()),

    GoRoute(
      path: Routes.home,
      builder: (context, state) =>
          BlocProvider(create: (context) => RecipesCubit(RecipesRepo(RemoteDataSource(DioFactory.getDio())))..getRecipes() , child : HomeScreen()),
    ),
    GoRoute(
      path: Routes.recipeDetails,
      builder: (context, state) =>
          RecipeDetailsScreen(recipe: state.extra as RecipeModel),
    ),
  ],
);
