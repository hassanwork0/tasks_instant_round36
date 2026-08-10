import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/job_response.dart';

class JobRemoteDataSource {
  static const String _baseUrl = 'https://www.arbeitnow.com/api/job-board-api';

  Future<JobResponse> fetchJobs() async {
    final response = await http
        .get(Uri.parse(_baseUrl))
        .timeout(const Duration(seconds: 15));

    if (response.statusCode != 200) {
      throw Exception('Failed to load jobs. Status code: ${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return JobResponse.fromJson(json);
  }
}
