class Job {
  final String id;
  final String title;
  final String companyName;
  final String location;
  final String url;
  final DateTime createdAt;
  final String? jobType;

  const Job({
    required this.id,
    required this.title,
    required this.companyName,
    required this.location,
    required this.url,
    required this.createdAt,
    this.jobType,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['slug'] as String? ?? json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      companyName: json['company_name'] as String? ?? '',
      location: json['location'] as String? ?? '',
      url: json['url'] as String? ?? '',
      createdAt: _parseDate(json['created_at']),
      jobType: _firstJobType(json['job_types']),
    );
  }

  static DateTime _parseDate(dynamic value) {
    if (value is int) {
      return DateTime.fromMillisecondsSinceEpoch(value * 1000);
    }
    final parsed = DateTime.tryParse(value?.toString() ?? '');
    return parsed ?? DateTime.fromMillisecondsSinceEpoch(0);
  }

  static String? _firstJobType(dynamic jobTypes) {
    if (jobTypes is List && jobTypes.isNotEmpty) {
      return jobTypes.first.toString();
    }
    if (jobTypes is String && jobTypes.isNotEmpty) {
      return jobTypes;
    }
    return null;
  }

  String get relativeTime {
    final difference = DateTime.now().difference(createdAt);
    if (difference.inDays >= 1) {
      return '${difference.inDays} days ago';
    }
    if (difference.inHours >= 1) {
      return '${difference.inHours} hours ago';
    }
    return '${difference.inMinutes.clamp(0, 59)} minutes ago';
  }
}
