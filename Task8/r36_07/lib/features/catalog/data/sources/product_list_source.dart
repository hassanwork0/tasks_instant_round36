import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/errors/exceptions.dart';
import '../models/product_summary_model.dart';

abstract class ProductListSource {
  Future<List<ProductSummaryModel>> getProducts();
}

class ProductListSourceImpl implements ProductListSource {
  ProductListSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  final http.Client _client;

  static const String _baseUrl = 'https://dummyjson.com';

  @override
  Future<List<ProductSummaryModel>> getProducts() async {
    final uri = Uri.parse('$_baseUrl/products');
    try {
      final response = await _client
          .get(uri)
          .timeout(const Duration(seconds: 15));

      if (response.statusCode != 200) {
        throw ServerException(
          'Failed to load products (HTTP ${response.statusCode}).',
        );
      }

      final decoded = jsonDecode(response.body) as Map<String, dynamic>;
      final items = (decoded['products'] as List<dynamic>? ?? const []);
      return items
          .map(
            (item) =>
                ProductSummaryModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();
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
