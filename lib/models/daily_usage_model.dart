// To parse this JSON data, do
//
//     final dailyUsage = dailyUsageFromJson(jsonString);

import 'dart:convert';

DailyUsage dailyUsageFromJson(String str) =>
    DailyUsage.fromJson(json.decode(str));

String dailyUsageToJson(DailyUsage data) => json.encode(data.toJson());

class DailyUsage {
  int? status;
  Data? data;

  DailyUsage({
    this.status,
    this.data,
  });

  factory DailyUsage.fromJson(Map<String, dynamic> json) => DailyUsage(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  List<int> rx;
  List<int> tx;
  List<int> total;
  List<int> totalReal;
  List<int> freeTraffic;

  Data({
    required this.rx,
    required this.tx,
    required this.total,
    required this.totalReal,
    required this.freeTraffic,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        rx: List<int>.from(json["rx"].map((x) => x)),
        tx: List<int>.from(json["tx"].map((x) => x)),
        total: List<int>.from(json["total"].map((x) => x)),
        totalReal: List<int>.from(json["total_real"].map((x) => x)),
        freeTraffic: List<int>.from(json["free_traffic"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "rx": List<dynamic>.from(rx.map((x) => x)),
        "tx": List<dynamic>.from(tx.map((x) => x)),
        "total": List<dynamic>.from(total.map((x) => x)),
        "total_real": List<dynamic>.from(totalReal.map((x) => x)),
        "free_traffic": List<dynamic>.from(freeTraffic.map((x) => x)),
      };
}
