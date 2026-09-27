import 'package:task_products/core/network/api_result.dart';
import 'package:task_products/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:task_products/features/cart/data/models/aud_to_cart_model.dart';
import 'package:task_products/features/cart/data/models/cart_model.dart';

class CartRepo {
  final CartRemoteDataSource _remote;

  CartRepo(this._remote);

  Future<ApiResult<CartModel>> getCart() {
    return _remote.getCart();
  }

  Future<ApiResult<AUDToCartModel>> addToCart({
    required int productId,
    required int quantity,
  }) {
    return _remote.addToCart(productId: productId, quantity: quantity);
  }

  Future<ApiResult<AUDToCartModel>> updateToCart({
    required int productId,
    required int quantity,
  }) {
    return _remote.updateToCart(productId: productId, quantity: quantity);
  }

  Future<ApiResult<AUDToCartModel>> deleteCart() {
    return _remote.deleteCart();
  }
}
