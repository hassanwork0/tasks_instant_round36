import 'package:dio/dio.dart';
import 'package:product_details_ui/core/api/api_result.dart';
import 'package:product_details_ui/core/api/safe_api_call.dart';
import 'package:product_details_ui/features/products/data/models/product_model.dart';
import '../../../../core/api/endpoints.dart';

class SearchProductsRemoteDataSource {
  final Dio _dio;

  const SearchProductsRemoteDataSource(this._dio);

Future<ApiResult<ProductModel>> search(
  String query, {
  CancelToken? cancelToken,
}) {
  return safeApiCall(() async {
    final response = await _dio.get(
      EndPoints.productsSearch,
      queryParameters: {'q': query, 'limit': 20},
      cancelToken: cancelToken,
    );

    final model = ProductModel.fromJson(response.data as Map<String, dynamic>,);
    return model;
  });
 }
}