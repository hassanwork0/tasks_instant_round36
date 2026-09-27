import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/errors/exceptions.dart';
import '../models/product_details_model.dart';

abstract class ProductDetailsSource {
  Future<ProductDetailsModel> getProductDetails(int productId);
}

class ProductDetailsSourceImpl implements ProductDetailsSource {
  ProductDetailsSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  final http.Client _client;

  static const String _baseUrl = 'https://dummyjson.com';

  @override
  Future<ProductDetailsModel> getProductDetails(int productId) async {
    final uri = Uri.parse('$_baseUrl/products/$productId');

    try {
      final response = await _client
          .get(uri)
          .timeout(const Duration(seconds: 15));

      if (response.statusCode != 200) {
        throw ServerException(
          'Failed to load product details (HTTP ${response.statusCode}).',
        );
      }

      final decoded = jsonDecode(response.body) as Map<String, dynamic>;
      return ProductDetailsModel.fromJson(decoded);
    } on FormatException catch (_) {
      throw const ServerException(
        'The server returned an unexpected response. Please try again.',
      );
    } on ServerException {
      rethrow;
    } catch (_) {
      throw const NetworkException(
        'Unable to reach the server. Please check your internet connection.',
      );
    }
  }
}
