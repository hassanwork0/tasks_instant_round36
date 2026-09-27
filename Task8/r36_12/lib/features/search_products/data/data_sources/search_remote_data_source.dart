import 'package:dio/dio.dart';
import 'package:task_products/core/api/endpoints.dart';
import 'package:task_products/core/network/api_result.dart';
import 'package:task_products/core/network/safe_api_call.dart';
import 'package:task_products/features/products/data/models/products_model.dart';

class SearchRemoteDataSource {
  final Dio _dio;

  SearchRemoteDataSource(this._dio);

  Future<ApiResult<ProductsModel>> search(
    String query, {
    CancelToken? cancelToken,
  }) {
    return safeApiCall(() async {
      final response = await _dio.get(
        EndPoints.productsSearch,
        queryParameters: {'q': query, 'limit': 20},
        cancelToken: cancelToken,
      );

      return ProductsModel.fromJson(response.data);
    });
  }
}
