import 'package:equatable/equatable.dart';
import 'package:recipes_app/features/recipes_app/data/model/product_model.dart';

abstract class RecipesState extends Equatable {
  const RecipesState();

  @override
  List<Object?> get props => [];
}

class RecipesInitial extends RecipesState {
  const RecipesInitial();
}

class RecipesLoadingState extends RecipesState {
  const RecipesLoadingState();
}

class RecipesLoadedState extends RecipesState {
  const RecipesLoadedState({required this.recipes});

  final List<ProductModel> recipes;

  @override
  List<Object?> get props => [recipes];
}

class RecipesErrorState extends RecipesState {
  const RecipesErrorState({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
