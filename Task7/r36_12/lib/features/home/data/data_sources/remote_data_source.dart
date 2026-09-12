import 'package:dio/dio.dart';
import 'package:recipes_app/core/api/end_points.dart';
import 'package:recipes_app/features/home/data/models/recipes_model.dart';

class RemoteDataSource {
  final Dio _dio;

  RemoteDataSource(this._dio);

  Future<RecipesModel> recipes() async {
    final response = await _dio.get(EndPoints.recipes);

    return RecipesModel.fromJson(response.data);
  }
}
