import '../models/job_model.dart';

abstract class JobRepository {
  Future<List<Job>> getJobs();
}
