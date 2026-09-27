import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/core/api/dio_factory.dart';
import 'package:recipes_app/core/routes/router.dart';
import 'package:recipes_app/features/recipes_app/data/implement/recipes_repo.dart';
import 'package:recipes_app/features/recipes_app/data/model/product_model.dart';
import 'package:recipes_app/features/recipes_app/data/source/recipes_remote_data_source.dart';
import 'package:recipes_app/features/recipes_app/presentation/bloc/recipes_cubit.dart';
import 'package:recipes_app/features/recipes_app/presentation/pages/home_screen.dart';
import 'package:recipes_app/features/recipes_app/presentation/pages/product_details.dart';
import 'package:recipes_app/features/recipes_app/presentation/pages/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return BlocProvider(
          create: (context) {
            final dio = DioFactory.getDio();
            final remoteDataSource = RecipesRemoteDataSource(dio);
            final repository = RecipesRepositoryImpl(remoteDataSource);
            return RecipesCubit(repository)..fetchRecipes();
          },
          child: const HomeScreen(),
        );
      },
    ),
    GoRoute(
      path: Routes.productDetails,
      pageBuilder: (context, state) {
        final product = state.extra as ProductModel;
        return MaterialPage(
          key: state.pageKey,
          child: ProductScreen(product: product),
        );
      },
    ),
  ],
);
