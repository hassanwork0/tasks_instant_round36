import 'package:dio/dio.dart';
import 'package:product_details_ui/core/api/api_result.dart';
import 'package:product_details_ui/features/products/data/models/product_model.dart';
import 'package:product_details_ui/features/search_products/data/data_sources/search_product_remote_data_source.dart';


class SearchProductsRepo {
  SearchProductsRemoteDataSource _remote;
  SearchProductsRepo(this._remote);

  Future<ApiResult<ProductModel>> search( String query, {
  CancelToken? cancelToken,
}) {
    return _remote.search(query, cancelToken: cancelToken);
  }
}
