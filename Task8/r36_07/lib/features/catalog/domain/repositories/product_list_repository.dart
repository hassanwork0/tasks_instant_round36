import '../../data/models/product_summary_model.dart';
import '../../data/sources/product_list_source.dart';

abstract class ProductListRepository {
  Future<List<ProductSummaryModel>> getProducts();
}

class ProductListRepositoryImpl implements ProductListRepository {
  const ProductListRepositoryImpl(this._source);

  final ProductListSource _source;

  @override
  Future<List<ProductSummaryModel>> getProducts() {
    return _source.getProducts();
  }
}
