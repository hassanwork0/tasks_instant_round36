import 'package:dio/dio.dart';
import 'package:recipes_ui/core/api/endpoints.dart';
import 'package:recipes_ui/features/recipes/data/models/recipes_model.dart';


class RemoteDataSource {
  final Dio _dio;

  RemoteDataSource(this._dio);

  Future<List<RecipeModel>> recipes() async {
    final response = await _dio.get(EndPoints.recipes);

    final model = RecipesModel.fromJson(
      response.data as Map<String, dynamic>,
    );
    return model.recipes;
  }
}
