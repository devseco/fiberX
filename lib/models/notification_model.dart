// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

List<NotificationModel> notificationModelFromJson(String str) =>
    List<NotificationModel>.from(
        json.decode(str).map((x) => NotificationModel.fromJson(x)));

String notificationModelToJson(List<NotificationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel {
  String? id;
  bool? deleted;
  DateTime? creationDate;
  String? title;
  String? description;

  NotificationModel({
    this.id,
    this.deleted,
    this.creationDate,
    this.title,
    this.description,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        deleted: json["deleted"],
        creationDate: DateTime.parse(json["creationDate"]),
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deleted": deleted,
        "creationDate": creationDate?.toIso8601String(),
        "title": title,
        "description": description,
      };
}
