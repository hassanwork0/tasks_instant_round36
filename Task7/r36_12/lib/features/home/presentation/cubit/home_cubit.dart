import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:recipes_app/features/home/data/models/recipes_model.dart';
import 'package:recipes_app/features/home/data/repo/home_repo.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(HomeRepo homeRepo)
    : _homeRepo = homeRepo,
      super(HomeInitialState());

  Future<void> getRecipes() async {
    emit(HomeLoadingState());

    await Future.delayed(Duration(seconds: 2));
    final recipesCase = Random().nextInt(3);
    final recipesModel = await _homeRepo.getRecipes();
    final recipes = recipesModel.recipes ?? [];

    if (recipesCase == 0) {
      emit(HomeFailureState());
    }

    if (recipesCase == 1) {
      emit(
        HomeLoadedState(
          allRecipes: recipes,
          filteredRecipesList: [],
          categoryNames: [],
        ),
      );
    }

    if (recipesCase == 2) {
      final categories = recipes
          .map((recipe) => recipe.cuisine)
          .toSet()
          .toList();
      emit(
        HomeLoadedState(
          allRecipes: recipes,
          filteredRecipesList: recipes,
          categoryNames: categories,
        ),
      );
    }
  }

  void selectCategory(String category) {
    final currentState = state;

    if (currentState is HomeLoadedState) {
      final filteredRecipes = category == "All"
          ? currentState.allRecipes
          : currentState.allRecipes
                .where((recipe) => recipe.cuisine == category)
                .toList();

      emit(
        HomeLoadedState(
          filteredRecipesList: filteredRecipes,
          allRecipes: currentState.allRecipes,
          categoryNames: currentState.categoryNames,
          selectedCategory: category,
        ),
      );
    }
  }
}
