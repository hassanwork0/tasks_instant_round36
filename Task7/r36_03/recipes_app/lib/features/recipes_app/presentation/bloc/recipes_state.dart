part of 'recipes_cubit.dart';

sealed class RecipesState {}

class RecipesInitialState extends RecipesState {}

class RecipesLoadingState extends RecipesState {}

class RecipesLoadedState extends RecipesState {
  final List<ProductModel> recipes;
  RecipesLoadedState(this.recipes);
}

class RecipesErrorState extends RecipesState {
  final String errorMessage;

  RecipesErrorState(this.errorMessage);
}
