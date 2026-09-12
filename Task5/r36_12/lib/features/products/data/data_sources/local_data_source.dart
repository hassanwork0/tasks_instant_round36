import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/products_model.dart';

class LocalDataSource {
  final SharedPreferences _sharedPreferences;
  LocalDataSource(this._sharedPreferences);

  static const String productsKey = 'products';

  Future<bool> saveProducts(List<Products> products) async {
    final productsJson = products.map((product) => product.toJson()).toList();
    final productsString = jsonEncode(productsJson);

    return await _sharedPreferences.setString(productsKey, productsString);
  }

  List<Products> getProducts() {
    final productsString = _sharedPreferences.getString(productsKey);

    if (productsString == null) {
      return [];
    }

    final List<dynamic> productsJson = jsonDecode(productsString);

    return productsJson.map((json) => Products.fromJson(json)).toList();
  }
}
