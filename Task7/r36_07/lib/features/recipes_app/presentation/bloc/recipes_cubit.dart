import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/recipes_app/data/implement/recipes_repository.dart';
import 'package:recipes_app/features/recipes_app/data/model/product_model.dart';

import 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit({required this.recipesRepository})
      : super(const RecipesInitial()) {
    fetchRecipes();
  }

  final RecipesRepository recipesRepository;

  List<ProductModel> _allRecipes = [];

  List<ProductModel> get allRecipes => _allRecipes;

  Future<void> fetchRecipes() async {
    emit(const RecipesLoadingState());
    try {
      final recipes = await recipesRepository.getRecipes();
      _allRecipes = recipes;
      emit(RecipesLoadedState(recipes: recipes));
    } catch (e) {
      emit(RecipesErrorState(errorMessage: e.toString()));
    }
  }

  void searchRecipes(String query) {
    if (state is! RecipesLoadedState) return;

    final filtered = _allRecipes
        .where((recipe) =>
            recipe.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(RecipesLoadedState(recipes: filtered));
  }
}
