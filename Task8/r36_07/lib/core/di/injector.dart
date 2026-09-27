import 'package:http/http.dart' as http;

import '../../features/catalog/data/sources/product_list_source.dart';
import '../../features/catalog/domain/repositories/product_list_repository.dart';
import '../../features/product_details/data/sources/product_details_source.dart';
import '../../features/product_details/domain/repositories/product_details_repository.dart';

class Injector {
  Injector._();

  static final http.Client _client = http.Client();

  static ProductDetailsRepository get productDetailsRepository =>
      ProductDetailsRepositoryImpl(ProductDetailsSourceImpl(client: _client));

  static ProductListRepository get productListRepository =>
      ProductListRepositoryImpl(ProductListSourceImpl(client: _client));
}
