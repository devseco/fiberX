// To parse this JSON data, do
//
//     final adsModel = adsModelFromJson(jsonString);

import 'dart:convert';

List<AdsModel> adsModelFromJson(String str) =>
    List<AdsModel>.from(json.decode(str).map((x) => AdsModel.fromJson(x)));

String adsModelToJson(List<AdsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdsModel {
  String? id;
  bool? deleted;
  DateTime? creationDate;
  String? image;
  String? link;
  bool? active;

  AdsModel({
    this.id,
    this.deleted,
    this.creationDate,
    this.image,
    this.link,
    this.active,
  });

  factory AdsModel.fromJson(Map<String, dynamic> json) => AdsModel(
        id: json["id"],
        deleted: json["deleted"],
        creationDate: DateTime.parse(json["creationDate"]),
        image: json["image"],
        link: json["link"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deleted": deleted,
        "creationDate": creationDate?.toIso8601String(),
        "image": image,
        "link": link,
        "active": active,
      };
}
