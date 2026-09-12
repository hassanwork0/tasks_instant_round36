part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {
  final List<Products> foods;
  final List<String> categoryButtons;
  final String selectedCategory;

  HomeLoadedState({
    required this.foods,
    required this.categoryButtons,
    this.selectedCategory = "All",
  });
}

final class HomeFailureState extends HomeState {
  final String errorMessage;

  HomeFailureState({required this.errorMessage});
}
