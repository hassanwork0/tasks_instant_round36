import 'package:dio/dio.dart';
import 'package:job_app/core/api/end_points.dart';
import 'package:job_app/features/job/data/models/jobs_model.dart';

class RemoteDataSource {
  final Dio _dio;

  RemoteDataSource(this._dio);

  Future<JobsModel> jobs() async {
    final response = await _dio.get(EndPoints.jobBoard);

    return JobsModel.fromJson(response.data);
  }
}
