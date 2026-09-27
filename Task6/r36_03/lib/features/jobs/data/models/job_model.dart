class JobModel {
  final String title;
  final String companyName;
  final String location;
  final String url;
  final String createdAt;

  JobModel({
    required this.companyName,
    required this.title,
    required this.location,
    required this.url,
    required this.createdAt,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      title: json['title'] ?? 'No title',
      companyName: json['company_name'] ?? 'Unknown company',
      location: json['location'] ?? 'Unknown location',
      url: json['url'] ?? 'Unknown URL',
      createdAt: json['created_at']?.toString() ?? '',
    );
  }
}
