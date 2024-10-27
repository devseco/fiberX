// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'dart:convert';

List<LocationModel> locationModelFromJson(String str) =>
    List<LocationModel>.from(
        json.decode(str).map((x) => LocationModel.fromJson(x)));

String locationModelToJson(List<LocationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocationModel {
  String? id;
  bool? deleted;
  DateTime? creationDate;
  dynamic? long;
  dynamic? lat;
  String? name;
  String? address;

  LocationModel({
    this.id,
    this.deleted,
    this.creationDate,
    this.long,
    this.lat,
    this.name,
    this.address,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json["id"],
        deleted: json["deleted"],
        creationDate: DateTime.parse(json["creationDate"]),
        long: json["long"],
        lat: json["lat"],
        name: json["name"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deleted": deleted,
        "creationDate": creationDate?.toIso8601String(),
        "long": long,
        "lat": lat,
        "name": name,
        "address": address,
      };
}
