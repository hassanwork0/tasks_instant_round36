import 'package:task_products/core/network/api_result.dart';
import 'package:task_products/features/products/data/models/products_model.dart';
import 'package:task_products/features/products_details/data/data_sources/products_details_remote_data_source.dart';

class ProductsDetailsRepo {
  final ProductsDetailsRemoteDataSource _remote;

  ProductsDetailsRepo(this._remote);

  Future<ApiResult<Products>> getProductDetails({required int productId}) async {
    return await _remote.getProductDetails(productId: productId);
  }

}