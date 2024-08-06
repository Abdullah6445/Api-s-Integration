// To parse this JSON data, do
//
//     final modelClass = modelClassFromJson(jsonString);

import 'dart:convert';

List<ModelClass> modelClassFromJson(String str) =>
    List<ModelClass>.from(json.decode(str).map((x) => ModelClass.fromJson(x)));

String modelClassToJson(List<ModelClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelClass {
  int userId;
  int id;
  String title;

  ModelClass({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory ModelClass.fromJson(Map<String, dynamic> json) => ModelClass(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}
