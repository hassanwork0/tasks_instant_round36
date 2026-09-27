import 'package:dio/dio.dart';
import 'package:task_products/core/api/endpoints.dart';
import 'package:task_products/core/network/safe_api_call.dart';
import 'package:task_products/features/products/data/models/products_model.dart';
import '../../../../core/network/api_result.dart';

class ProductsRemoteDataSource {
  final Dio _dio;
  ProductsRemoteDataSource(this._dio);

  Future<ApiResult<ProductsModel>> getProducts({
    int limit = 20,
    int skip = 0,
  }) async {
    return safeApiCall(() async {

      final response = await _dio.get(
        EndPoints.products,
        queryParameters: {'limit': limit, 'skip': skip},
      );

      return ProductsModel.fromJson(response.data);
    });
  }
}
