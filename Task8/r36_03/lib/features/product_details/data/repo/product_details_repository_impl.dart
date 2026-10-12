import '../model/product_details_model.dart';
import '../source/product_details_source.dart';

abstract class ProductDetailsRepository {
  Future<ProductDetailsModel> getProductDetails(int id);
}

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  final ProductDetailsSource source;

  ProductDetailsRepositoryImpl(this.source);

  @override
  Future<ProductDetailsModel> getProductDetails(int id) async {
    return await source.getProductDetails(id);
  }
}
