import 'package:job_app/features/job/data/data_sources/remote_data_source.dart';
import 'package:job_app/features/job/data/models/jobs_model.dart';

class JobsRepo {
  final RemoteDataSource _remoteDataSource;

  JobsRepo(this._remoteDataSource);

  Future<JobsModel> getJob() async {
    final jobModel = await _remoteDataSource.jobs();
    return jobModel;
  }
}
