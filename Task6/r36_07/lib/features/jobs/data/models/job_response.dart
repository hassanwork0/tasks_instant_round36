import 'job_model.dart';

class JobResponse {
  final List<Job> jobs;

  const JobResponse({required this.jobs});

  factory JobResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return JobResponse(
      jobs: (data as List<dynamic>? ?? [])
          .map((item) => Job.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
