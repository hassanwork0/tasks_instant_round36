import '../data_sources/local_data_source.dart';
import '../data_sources/remote_data_source.dart';
import '../models/products_model.dart';

class ProductsRepo {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  ProductsRepo(this._remoteDataSource, this._localDataSource);

  Future<ProductsModel> getProducts() async {
    try {
      final productsModel = await _remoteDataSource.products();

      await _localDataSource.saveProducts(productsModel.products ?? []);

      return productsModel;
    } catch (e) {
      final cachedProducts = _localDataSource.getProducts();

      if (cachedProducts.isNotEmpty) {
        return ProductsModel(products: cachedProducts);
      }

      rethrow;
    }
  }
}
