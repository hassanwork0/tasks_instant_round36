import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/recipes_app/data/implement/recipes_repo.dart';
import 'package:recipes_app/features/recipes_app/data/model/product_model.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  final RecipesRepository repository;
  RecipesCubit(this.repository) : super(RecipesInitialState());
  Future<void> fetchRecipes() async {
    emit(RecipesLoadingState());
    try {
      final recipes = await repository.getRecipes();
      emit(RecipesLoadedState(recipes));
    } catch (e) {
      emit(RecipesErrorState(e.toString()));
    }
  }
}
