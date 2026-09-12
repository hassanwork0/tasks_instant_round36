import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Api({http.Client? client}) : _client = client ?? http.Client();

  static const String baseUrl = 'https://dummyjson.com';

  final http.Client _client;

  Future<dynamic> get(String endPoint) async {
    final response = await _client
        .get(Uri.parse('$baseUrl$endPoint'))
        .timeout(const Duration(seconds: 20));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data (status: ${response.statusCode})');
    }
  }
}
