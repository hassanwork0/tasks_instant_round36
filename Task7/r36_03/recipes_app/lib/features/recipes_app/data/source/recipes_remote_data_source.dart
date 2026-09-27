import 'package:dio/dio.dart';
import 'package:recipes_app/core/const/app_constants.dart';

import '../model/product_model.dart';

class RecipesRemoteDataSource {
  final Dio _dio;

  const RecipesRemoteDataSource(this._dio);

  Future<List<ProductModel>> getRecipes() async {
    try {
      final response = await _dio.get(AppConstants.recipesEndpoint);

      final List<dynamic> recipesJson = response.data['recipes'];

      return recipesJson.map((json) => ProductModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load recipes: $e');
    }
  }
}
