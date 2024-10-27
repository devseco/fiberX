// To parse this JSON data, do
//
//     final serviceModel = serviceModelFromJson(jsonString);

import 'dart:convert';

ServiceModel serviceModelFromJson(String str) =>
    ServiceModel.fromJson(json.decode(str));

String serviceModelToJson(ServiceModel data) => json.encode(data.toJson());

class ServiceModel {
  String? profileName;
  dynamic? description;
  DateTime? expiration;
  int? profileId;
  bool? status;
  dynamic? price;
  SubscriptionStatus? subscriptionStatus;
  Limits? limits;

  ServiceModel({
    this.profileName,
    this.description,
    this.expiration,
    this.profileId,
    this.status,
    this.price,
    this.subscriptionStatus,
    this.limits,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        profileName: json["profile_name"],
        description: json["description"],
        expiration: DateTime.parse(json["expiration"]),
        profileId: json["profile_id"],
        status: json["status"],
        price: json["price"],
        subscriptionStatus:
            SubscriptionStatus.fromJson(json["subscription_status"]),
        limits: Limits.fromJson(json["limits"]),
      );

  Map<String, dynamic> toJson() => {
        "profile_name": profileName,
        "description": description,
        "expiration": expiration?.toIso8601String(),
        "profile_id": profileId,
        "status": status,
        "price": price,
        "subscription_status": subscriptionStatus?.toJson(),
        "limits": limits?.toJson(),
      };
}

class Limits {
  dynamic rxBytes;
  dynamic txBytes;
  dynamic rxtxBytes;
  dynamic uptimeSeconds;

  Limits({
    required this.rxBytes,
    required this.txBytes,
    required this.rxtxBytes,
    required this.uptimeSeconds,
  });

  factory Limits.fromJson(Map<String, dynamic> json) => Limits(
        rxBytes: json["rx_bytes"],
        txBytes: json["tx_bytes"],
        rxtxBytes: json["rxtx_bytes"],
        uptimeSeconds: json["uptime_seconds"],
      );

  Map<String, dynamic> toJson() => {
        "rx_bytes": rxBytes,
        "tx_bytes": txBytes,
        "rxtx_bytes": rxtxBytes,
        "uptime_seconds": uptimeSeconds,
      };
}

class SubscriptionStatus {
  bool status;
  bool traffic;
  bool expiration;
  bool uptime;

  SubscriptionStatus({
    required this.status,
    required this.traffic,
    required this.expiration,
    required this.uptime,
  });

  factory SubscriptionStatus.fromJson(Map<String, dynamic> json) =>
      SubscriptionStatus(
        status: json["status"],
        traffic: json["traffic"],
        expiration: json["expiration"],
        uptime: json["uptime"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "traffic": traffic,
        "expiration": expiration,
        "uptime": uptime,
      };
}
