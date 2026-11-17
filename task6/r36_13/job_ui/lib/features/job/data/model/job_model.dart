class JobModel {
  const JobModel({
    required this.slug,
    required this.companyName,
    required this.title,
    required this.description,
    required this.remote,
    required this.url,
    required this.tags,
    required this.jobTypes,
    required this.location,
    required this.createdAt,
  });

  final String slug;
  final String companyName;
  final String title;
  final String description;
  final bool remote;
  final String url;
  final List<String> tags;
  final List<String> jobTypes;
  final String location;
  final int createdAt;

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      slug: json['slug'] as String,
      companyName: json['company_name'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      remote: json['remote'] as bool,
      url: json['url'] as String,
      tags: List<String>.from(json['tags'] as List),
      jobTypes: List<String>.from(json['job_types'] as List),
      location: json['location'] as String,
      createdAt: json['created_at'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'company_name': companyName,
      'title': title,
      'description': description,
      'remote': remote,
      'url': url,
      'tags': tags,
      'job_types': jobTypes,
      'location': location,
      'created_at': createdAt,
    };
  }
}

class JobResponseModel {
  const JobResponseModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  final List<JobModel> data;
  final JobLinksModel links;
  final JobMetaModel meta;

  factory JobResponseModel.fromJson(Map<String, dynamic> json) {
    return JobResponseModel(
      data: (json['data'] as List)
          .map((job) => JobModel.fromJson(job as Map<String, dynamic>))
          .toList(),
      links: JobLinksModel.fromJson(json['links'] as Map<String, dynamic>),
      meta: JobMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((job) => job.toJson()).toList(),
      'links': links.toJson(),
      'meta': meta.toJson(),
    };
  }
}

class JobLinksModel {
  const JobLinksModel({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  factory JobLinksModel.fromJson(Map<String, dynamic> json) {
    return JobLinksModel(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'first': first, 'last': last, 'prev': prev, 'next': next};
  }
}

class JobMetaModel {
  const JobMetaModel({
    required this.currentPage,
    required this.currentPageUrl,
    required this.from,
    required this.path,
    required this.perPage,
    required this.to,
    required this.terms,
    required this.info,
  });

  final int currentPage;
  final String currentPageUrl;
  final int? from;
  final String path;
  final int perPage;
  final int? to;
  final String terms;
  final String info;

  factory JobMetaModel.fromJson(Map<String, dynamic> json) {
    return JobMetaModel(
      currentPage: json['current_page'] as int,
      currentPageUrl: json['current_page_url'] as String,
      from: json['from'] as int?,
      path: json['path'] as String,
      perPage: json['per_page'] as int,
      to: json['to'] as int?,
      terms: json['terms'] as String,
      info: json['info'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'current_page_url': currentPageUrl,
      'from': from,
      'path': path,
      'per_page': perPage,
      'to': to,
      'terms': terms,
      'info': info,
    };
  }
}
