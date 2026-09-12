part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {
  final List<Recipes> allRecipes;
  final List<Recipes> filteredRecipesList;
  final List<String> categoryNames;
  final String selectedCategory;
  HomeLoadedState({
    required this.allRecipes,
    required this.filteredRecipesList,
    required this.categoryNames,
    this.selectedCategory = "All",
  });
}

final class HomeFailureState extends HomeState {}
