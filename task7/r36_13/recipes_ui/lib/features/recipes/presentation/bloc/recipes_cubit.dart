import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_ui/features/recipes/data/repo/repo.dart';
import 'package:recipes_ui/features/recipes/presentation/bloc/recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  final RecipesRepo _recipesRepo;

  RecipesCubit(RecipesRepo recipesRepo)
    : _recipesRepo = recipesRepo,
      super(RecipesInitialState());

  Future<void> getRecipes() async {
    emit(RecipesLoadingState());

    final int Cases = Random().nextInt(3);
    
    try {
      final model = await _recipesRepo.getRecipes();

      if (Cases == 0) {
        emit(RecipesFailureState(errorMessage: 'Unable to load recipes.'));
      }

      if (Cases == 1) {
        emit(RecipesLoadedState(recipes: []));
      }

      if (Cases == 2) {
        emit(RecipesLoadedState(recipes: model));
      }
    } on DioException catch (error) {
      emit(
        RecipesFailureState(
          errorMessage: error.message ?? 'Unable to load recipes.',
        ),
      );
    } on FormatException catch (error) {
      emit(
        RecipesFailureState(errorMessage: 'Invalid recipes response: $error'),
      );
    } on TypeError catch (error) {
      emit(
        RecipesFailureState(errorMessage: 'Invalid recipes  response: $error'),
      );
    }
  }
}
