import '../../data/models/product_details_model.dart';
import '../../data/sources/product_details_source.dart';

abstract class ProductDetailsRepository {
  Future<ProductDetailsModel> getProductDetails(int productId);
}

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  const ProductDetailsRepositoryImpl(this._source);

  final ProductDetailsSource _source;

  @override
  Future<ProductDetailsModel> getProductDetails(int productId) {
    return _source.getProductDetails(productId);
  }
}
