import '../datasources/job_remote_data_source.dart';
import '../models/job_model.dart';
import 'job_repository.dart';

class JobRepositoryImpl implements JobRepository {
  final JobRemoteDataSource _remoteDataSource;

  JobRepositoryImpl({required this._remoteDataSource});

  @override
  Future<List<Job>> getJobs() async {
    final response = await _remoteDataSource.fetchJobs();
    return response.jobs;
  }
}