// To parse this JSON data, do
//
//     final offersModel = offersModelFromJson(jsonString);

import 'dart:convert';

List<OffersModel> offersModelFromJson(String str) => List<OffersModel>.from(
    json.decode(str).map((x) => OffersModel.fromJson(x)));

String offersModelToJson(List<OffersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OffersModel {
  String? id;
  bool? deleted;
  DateTime? creationDate;
  String? image;
  String? title;
  String? description;

  OffersModel({
    this.id,
    this.deleted,
    this.creationDate,
    this.image,
    this.title,
    this.description,
  });

  factory OffersModel.fromJson(Map<String, dynamic> json) => OffersModel(
        id: json["id"],
        deleted: json["deleted"],
        creationDate: DateTime.parse(json["creationDate"]),
        image: json["image"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deleted": deleted,
        "creationDate": creationDate?.toIso8601String(),
        "image": image,
        "title": title,
        "description": description,
      };
}
