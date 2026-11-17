import 'package:product_details_ui/core/api/api_result.dart';
import 'package:product_details_ui/features/products/data/data_sources/product_remote_data_source.dart';
import 'package:product_details_ui/features/products/data/models/product_model.dart';

class ProductsRepo {
  ProductsRemoteDataSource remote;
  ProductsRepo(this.remote);

  Future<ApiResult<ProductModel>> getProducts({ required int limit, required int skip}) {
    return remote.getProducts(limit: limit, skip: skip);
  }
}
