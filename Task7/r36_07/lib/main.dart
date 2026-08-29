import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/colors/app_colors.dart';
import 'core/routes/routes_name.dart';
import 'features/recipes_app/data/implement/recipes_repository_impl.dart';
import 'features/recipes_app/presentation/bloc/recipes_cubit.dart';
import 'features/recipes_app/presentation/pages/home.dart';
import 'features/recipes_app/presentation/pages/product_screen.dart';
import 'features/recipes_app/presentation/pages/splash.dart';

void main() {
  runApp(const RecipesApp());
}

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipesCubit(
        recipesRepository: RecipesRepositoryImpl(),
      ),
      child: MaterialApp(
        title: 'Recipes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          scaffoldBackgroundColor: AppColors.background,
          useMaterial3: true,
        ),
        initialRoute: RoutesName.splash,
        routes: {
          RoutesName.splash: (context) => const SplashPage(),
          RoutesName.home: (context) => const HomePage(),
          RoutesName.product: (context) => ProductScreen(
                product:
                    ModalRoute.of(context)?.settings.arguments as dynamic,
              ),
        },
      ),
    );
  }
}
