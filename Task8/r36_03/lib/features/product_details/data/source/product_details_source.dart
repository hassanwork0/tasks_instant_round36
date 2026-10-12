import 'package:dio/dio.dart';

import '../model/product_details_model.dart';

class ProductDetailsSource {
  final Dio dio;

  ProductDetailsSource({Dio? dio}) : dio = dio ?? Dio();

  Future<ProductDetailsModel> getProductDetails(int id) async {
    final response = await dio.get('https://dummyjson.com/products/$id');
    if (response.statusCode == 200 && response.data != null) {
      return ProductDetailsModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load product details');
    }
  }
}
