class JobsModel {
  List<Data>? data;
  Links? links;
  Meta? meta;

  JobsModel({this.data, this.links, this.meta});

  JobsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  String slug;
  String companyName;
  String title;
  String description;
  bool remote;
  String url;
  List<String>? tags;
  List<String>? jobTypes;
  String location;
  int createdAt;

  Data({
    required this.slug,
    required this.companyName,
    required this.title,
    required this.description,
    required this.remote,
    required this.url,
    this.tags,
    this.jobTypes,
    required this.location,
    required this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      slug: json['slug'] as String? ?? "",
      companyName: json['company_name'] as String? ?? "",
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      remote: json['remote'] as bool? ?? true,
      url: json['url'] as String? ?? "",
      tags: json['tags'].cast<String>() ?? [],
      jobTypes: json['job_types'].cast<String>() ?? [],
      location: json['location'] as String? ?? "",
      createdAt: json['created_at'] as int? ?? 0,
    );
  }

  String get isRemoteString => remote ? "Remote" : "Office";

  String get postedAgo {
    final date = DateTime.fromMillisecondsSinceEpoch(createdAt * 1000);
    final now = DateTime.now();

    final difference = now.difference(date);

    if (difference.inMinutes < 1) {
      return "Posted just now";
    } else if (difference.inMinutes < 60) {
      return "Posted ${difference.inMinutes} minutes ago";
    } else if (difference.inHours < 24) {
      final hours = difference.inHours;

      if (hours == 1) {
        return "Posted 1 hour ago";
      }

      return "Posted $hours hours ago";
    } else {
      final days = difference.inDays;

      if (days == 1) {
        return "Posted 1 day ago";
      }

      return "Posted $days days ago";
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['slug'] = slug;
    data['company_name'] = companyName;
    data['title'] = title;
    data['description'] = description;
    data['remote'] = remote;
    data['url'] = url;
    data['tags'] = tags;
    data['job_types'] = jobTypes;
    data['location'] = location;
    data['created_at'] = createdAt;
    return data;
  }
}

class Links {
  String? first;
  Null? last;
  Null? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['first'] = first;
    data['last'] = last;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class Meta {
  int? currentPage;
  String? currentPageUrl;
  int? from;
  String? path;
  int? perPage;
  int? to;
  String? terms;
  String? info;

  Meta({
    this.currentPage,
    this.currentPageUrl,
    this.from,
    this.path,
    this.perPage,
    this.to,
    this.terms,
    this.info,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    currentPageUrl = json['current_page_url'];
    from = json['from'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    terms = json['terms'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['current_page'] = currentPage;
    data['current_page_url'] = currentPageUrl;
    data['from'] = from;
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['terms'] = terms;
    data['info'] = info;
    return data;
  }
}
