import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/data/food_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  Future<void> getFoodList() async {
    emit(HomeLoadingState());


    final dio = Dio();

    final response = await dio.get("https://pastefy.app/nugKuFP2/raw");


    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.data);


      final List<dynamic> jsonProducts = body['products'];
      final List<Products> productsList = jsonProducts
          .map((json) => Products.fromJson(json))
          .toList();

      final List<String> buttonsList = body['categoryButtons'].cast<String>();

      emit(HomeLoadedState(foods: productsList, categoryButtons: buttonsList));
    } else {
      emit(HomeFailureState(errorMessage: 'Loading failed!'));
    }
  }

  void selectCategory(String category) {
    final currentState = state;

    if (currentState is HomeLoadedState) {
      emit(
        HomeLoadedState(
          foods: currentState.foods,
          categoryButtons: currentState.categoryButtons,
          selectedCategory: category,
        ),
      );
    }
  }
}
