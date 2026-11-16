import 'package:dio/dio.dart';
import 'package:job_ui/core/api/endpoints.dart';

import 'package:job_ui/features/job/data/model/job_model.dart';

class RemoteDataSource {
  final Dio _dio;

  RemoteDataSource(this._dio);

  Future<List<JobModel>> jobs() async {
    final response = await _dio.get(EndPoints.jobBoard);

    final model = JobResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
    return model.data;
  }
}
