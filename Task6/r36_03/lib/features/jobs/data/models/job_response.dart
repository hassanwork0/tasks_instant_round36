import 'job_model.dart';

class JobResponse {
  final List<JobModel> jobs;
  JobResponse({required this.jobs});

  factory JobResponse.fromJson(Map<String, dynamic> json) {
    final jsonJobs = json['data'] as List<dynamic>;
    List<JobModel> jobs = jsonJobs
        .map((jobJson) => JobModel.fromJson(jobJson as Map<String, dynamic>))
        .toList();
    return JobResponse(jobs: jobs);
  }
}
