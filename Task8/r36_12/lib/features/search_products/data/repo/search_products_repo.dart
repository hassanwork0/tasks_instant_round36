import 'package:dio/dio.dart';
import 'package:task_products/core/network/api_result.dart';
import 'package:task_products/features/products/data/models/products_model.dart';
import 'package:task_products/features/search_products/data/data_sources/search_remote_data_source.dart';

class SearchProductsRepo {
  final SearchRemoteDataSource _remote;

  SearchProductsRepo(this._remote);

  Future<ApiResult<ProductsModel>> getSearch(
    String query, {
    CancelToken? cancelToken,
  }) {
    return _remote.search(query, cancelToken: cancelToken);
  }
}
