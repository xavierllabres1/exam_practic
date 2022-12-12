// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';
import 'package:exam_practic/models/models.dart';

class UserResponse {
  UserResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    this.support,
  });

  int page;
  int perPage;
  int total;
  int totalPages;
  List<User> data;
  Support? support;

  factory UserResponse.fromJson(String str) =>
      UserResponse.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory UserResponse.fromMap(Map<String, dynamic> json) => UserResponse(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<User>.from(json["data"].map((x) => User.fromMap(x))),
        support: Support.fromMap(json["support"]),
      );

  // Map<String, dynamic> toMap() => {
  //     "page": page,
  //     "per_page": perPage,
  //     "total": total,
  //     "total_pages": totalPages,
  //     "data": List<dynamic>.from(data.map((x) => x.toMap())),
  //     "support": support.toMap(),
  // };
}

class Support {
  Support({
    this.url,
    this.text,
  });

  String? url;
  String? text;

  factory Support.fromJson(String str) => Support.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory Support.fromMap(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  // Map<String, dynamic> toMap() => {
  //     "url": url,
  //     "text": text,
  // };
}
