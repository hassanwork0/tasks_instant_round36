import 'package:dio/dio.dart';
import 'package:product_details_ui/core/api/api_result.dart';
import 'package:product_details_ui/core/api/expections/faliure_handler.dart';
import 'package:product_details_ui/features/products/data/models/product_model.dart';


import '../../../../core/api/endpoints.dart';

class ProductsRemoteDataSource {
  final Dio _dio;

  const ProductsRemoteDataSource(this._dio);

  Future<ApiResult<ProductModel>> getProducts({
    int limit = 20,
    int skip = 0,
  }) async {
    try{
      final response = await _dio.get(
        EndPoints.products,
        queryParameters: {'limit': limit, 'skip': skip},
      );

      final data = ProductModel.fromJson(response.data);

      return ApiSuccess(data);
    } catch (error) {
      return ApiFailure(ApiFaliureHandler.handle(error));
    }
  }
}