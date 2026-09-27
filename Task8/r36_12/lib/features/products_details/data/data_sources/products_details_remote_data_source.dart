import 'package:dio/dio.dart';
import 'package:task_products/core/api/endpoints.dart';
import 'package:task_products/core/network/api_result.dart';
import 'package:task_products/core/network/safe_api_call.dart';
import 'package:task_products/features/products/data/models/products_model.dart';

class ProductsDetailsRemoteDataSource {
  final Dio _dio;

  ProductsDetailsRemoteDataSource(this._dio);

  Future<ApiResult<Products>> getProductDetails({required int productId}) {
    return safeApiCall(() async {
      final response = await _dio.get(EndPoints.productDetails(productId));

      return Products.fromJson(response.data);
    });
  }
}
