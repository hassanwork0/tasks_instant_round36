import 'package:product_details_ui/core/api/api_result.dart';
import 'package:product_details_ui/features/products_details/data/data_sources/products_details_remote_data_source.dart';
import 'package:product_details_ui/features/products_details/data/models/products_details_model.dart';

class ProductDetailsRepo {

final ProductsDetailsRemoteDataSource _remoteDataSource;

  ProductDetailsRepo(this._remoteDataSource);

  Future<ApiResult<ProductDetailsModel>> getProductDetails({
    required int productId,
  }) async {
    return await _remoteDataSource.getProductDetails(productId: productId);
  }
}