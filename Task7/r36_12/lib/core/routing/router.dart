import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/core/api/dio_factory.dart';
import 'package:recipes_app/core/routing/routes.dart';
import 'package:recipes_app/features/home/data/data_sources/remote_data_source.dart';
import 'package:recipes_app/features/home/data/repo/home_repo.dart';
import '../../features/home/data/models/recipes_model.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/recipe_details/presentation/screens/recipe_details_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(path: Routes.splash, builder: (context, state) => SplashScreen()),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              HomeCubit(HomeRepo(RemoteDataSource(DioFactory.getDio())))
                ..getRecipes(),
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        path: Routes.recipeDetails,
        builder: (context, state) {
          final recipe = state.extra as Recipes;
          return RecipeDetailsScreen(recipe: recipe);
        },
      ),
    ],
  );
}
