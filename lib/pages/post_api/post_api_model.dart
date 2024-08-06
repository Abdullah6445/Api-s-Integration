// To parse this JSON data, do
//
//     final postApiModelClass = postApiModelClassFromJson(jsonString);

import 'dart:convert';

List<PostApiModelClass> postApiModelClassFromJson(String str) =>
    List<PostApiModelClass>.from(
        json.decode(str).map((x) => PostApiModelClass.fromJson(x)));

String postApiModelClassToJson(List<PostApiModelClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostApiModelClass {
  int userId;
  int id;
  String title;
  String body;

  PostApiModelClass({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostApiModelClass.fromJson(Map<String, dynamic> json) =>
      PostApiModelClass(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
