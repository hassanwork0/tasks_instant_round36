import 'package:recipes_ui/features/recipes/data/models/recipes_model.dart';

sealed class RecipesState {}

final class RecipesInitialState extends RecipesState {}

final class RecipesLoadingState extends RecipesState   {}

final class RecipesLoadedState extends RecipesState {
  final List<RecipeModel> recipes;

  RecipesLoadedState({required this.recipes});
}

final class RecipesFailureState extends RecipesState {
  final String errorMessage;

  RecipesFailureState({required this.errorMessage});
}