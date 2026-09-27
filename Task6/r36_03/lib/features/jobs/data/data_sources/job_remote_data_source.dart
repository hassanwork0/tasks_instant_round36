import 'package:dio/dio.dart';
import 'package:task_6/core/constants/api_constants.dart';

import '../models/job_response.dart';

class JobRemoteDataSource {
  final Dio dio;
  JobRemoteDataSource({required this.dio});

  Future<JobResponse> fetchJobs() async {
    final response = await dio.get(ApiConstants.jobsEndpoint);
    return JobResponse.fromJson(response.data);
  }
}
