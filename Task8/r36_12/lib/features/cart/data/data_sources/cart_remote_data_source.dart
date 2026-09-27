import 'package:dio/dio.dart';
import 'package:task_products/core/api/endpoints.dart';
import 'package:task_products/core/network/api_result.dart';
import 'package:task_products/core/network/safe_api_call.dart';
import 'package:task_products/features/cart/data/models/cart_model.dart';
import 'package:task_products/features/cart/data/models/aud_to_cart_model.dart';

class CartRemoteDataSource {
  final Dio _dio;

  CartRemoteDataSource(this._dio);

  Future<ApiResult<CartModel>> getCart() {
    return safeApiCall(() async {
      final response = await _dio.get(EndPoints.cart);
      return CartModel.fromJson(response.data);
    });
  }

  Future<ApiResult<AUDToCartModel>> addToCart({
    required int productId,
    required int quantity,
  }) {
    return safeApiCall(() async {
      final response = await _dio.post(
        EndPoints.addToCart,
        data: {
          "userId": 1,
          "products": [
            {"id": productId, "quantity": quantity},
          ],
        },
      );
      return AUDToCartModel.fromJson(response.data);
    });
  }

  Future<ApiResult<AUDToCartModel>> updateToCart({
    required int productId,
    required int quantity,
  }) {
    return safeApiCall(() async {
      final response = await _dio.patch(
        EndPoints.cart,
        data: {
          "merge": true,
          "products": [
            {"id": productId, "quantity": quantity},
          ],
        },
      );
      return AUDToCartModel.fromJson(response.data);
    });
  }

  Future<ApiResult<AUDToCartModel>> deleteCart() {
    return safeApiCall(() async {
      final response = await _dio.delete(EndPoints.cart);
      return AUDToCartModel.fromJson(response.data);
    });
  }
}
