import 'package:task_products/core/network/api_result.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/products_remote_data_source.dart';
import '../models/products_model.dart';

class ProductsRepo {
  final ProductsRemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  ProductsRepo(this._remoteDataSource, this._localDataSource);

  Future<ApiResult<ProductsModel>> getProducts({
    required int limit,
    required int skip,
  }) async {
    final productModel = await _remoteDataSource.getProducts(
      limit: limit,
      skip: skip,
    );

    switch (productModel) {
      case ApiSuccess(data: final productsModel):
        await _localDataSource.saveProducts(productsModel.products ?? []);
        return productModel;

      case ApiFailure():
        final cachedProducts = _localDataSource.getProducts();

        if (cachedProducts.isNotEmpty) {
          return ApiSuccess(
            ProductsModel(
              products: cachedProducts,
              total: cachedProducts.length,
              skip: skip,
              limit: limit,
            ),
          );
        }

        return productModel;
    }
  }
}
