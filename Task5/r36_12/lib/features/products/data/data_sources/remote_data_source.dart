import 'package:dio/dio.dart';
import 'package:task_products/core/api/endpoints.dart';
import 'package:task_products/features/products/data/models/products_model.dart';

class RemoteDataSource {
  final Dio _dio;

  RemoteDataSource(this._dio);

  Future<ProductsModel> products() async {
    final response = await _dio.get(EndPoints.products);

    return ProductsModel.fromJson(response.data);
  }
}
