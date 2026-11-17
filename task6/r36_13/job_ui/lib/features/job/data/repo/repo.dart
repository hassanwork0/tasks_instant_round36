import 'package:job_ui/features/job/data/model/job_model.dart';
import 'package:job_ui/features/job/data/remote_datasource/remote_data_source.dart';

class JobsRepo {
  final RemoteDataSource _remoteDataSource;

  JobsRepo(this._remoteDataSource);

  Future<List<JobModel>> getJob() async {
    return _remoteDataSource.jobs();
  }
}
