import 'package:dio/dio.dart';
import 'package:product_details_ui/core/api/api_result.dart';
import 'package:product_details_ui/core/api/endpoints.dart';
import 'package:product_details_ui/core/api/safe_api_call.dart';
import 'package:product_details_ui/features/products_details/data/models/products_details_model.dart';


class ProductsDetailsRemoteDataSource {
  final Dio _dio;
  ProductsDetailsRemoteDataSource(this._dio);

  Future<ApiResult<ProductDetailsModel>> getProductDetails({
    required int productId
    }) {
    return safeApiCall(() async {
      final Response = await _dio.get(
        EndPoints.productDetails(productId),
        );
        final model = ProductDetailsModel.fromJson(Response.data); 
        return model; 
    });
  }
}
