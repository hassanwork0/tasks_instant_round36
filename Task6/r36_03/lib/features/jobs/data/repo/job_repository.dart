import 'package:task_6/features/jobs/data/data_sources/job_remote_data_source.dart';
import 'package:task_6/features/jobs/data/models/job_model.dart';

abstract class JobRepository {
  Future<List<JobModel>> fetchJobs();
}

class JobRepositoryImpl implements JobRepository {
  final JobRemoteDataSource jobRemoteDataSource;
  JobRepositoryImpl({required this.jobRemoteDataSource, remoteDataSource});

  @override
  Future<List<JobModel>> fetchJobs() async {
    final jobResponse = await jobRemoteDataSource.fetchJobs();
    return jobResponse.jobs;
  }
}
