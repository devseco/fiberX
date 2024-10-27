// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? username;
  dynamic? firstname;
  dynamic? lastname;
  dynamic? name;
  String? email;
  String? phone;
  dynamic? address;
  dynamic? company;
  RegisteredOn? registeredOn;
  int? id;
  dynamic? staticIp;
  dynamic? balance;
  int? autoRenew;
  int? profileId;

  UserModel({
    this.username,
    this.firstname,
    this.lastname,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.company,
    this.registeredOn,
    this.id,
    this.staticIp,
    this.balance = 0.0,
    this.autoRenew,
    this.profileId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        company: json["company"],
        registeredOn: RegisteredOn.fromJson(json["registered_on"]),
        id: json["id"],
        staticIp: json["static_ip"],
        balance: json["balance"],
        autoRenew: json["auto_renew"],
        profileId: json["profile_id"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "firstname": firstname,
        "lastname": lastname,
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "company": company,
        "registered_on": registeredOn?.toJson(),
        "id": id,
        "static_ip": staticIp,
        "balance": balance,
        "auto_renew": autoRenew,
        "profile_id": profileId,
      };
}

class RegisteredOn {
  DateTime date;
  int timezoneType;
  String timezone;

  RegisteredOn({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  factory RegisteredOn.fromJson(Map<String, dynamic> json) => RegisteredOn(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezone,
      };
}
