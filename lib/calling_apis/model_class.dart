// To parse this JSON data, do
//
//     final modelClassSaqlein = modelClassSaqleinFromJson(jsonString);

import 'dart:convert';

List<ModelClassSaqlein> modelClassSaqleinFromJson(String str) =>
    List<ModelClassSaqlein>.from(
        json.decode(str).map((x) => ModelClassSaqlein.fromJson(x)));

String modelClassSaqleinToJson(List<ModelClassSaqlein> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelClassSaqlein {
  int userId;
  int id;
  String title;

  ModelClassSaqlein({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory ModelClassSaqlein.fromJson(Map<String, dynamic> json) =>
      ModelClassSaqlein(
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
