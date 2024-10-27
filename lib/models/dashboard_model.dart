// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  dynamic? remainingDays;
  dynamic? remainingTraffic;
  dynamic? remainingUptime;
  dynamic? balance;
  dynamic? unpaidInvoices;
  Loan? loan;

  DashboardModel({
    this.remainingDays,
    this.remainingTraffic,
    this.remainingUptime,
    this.balance,
    this.unpaidInvoices,
    this.loan,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        remainingDays: json["remaining_days"],
        remainingTraffic: json["remaining_traffic"],
        remainingUptime: json["remaining_uptime"],
        balance: json["balance"],
        unpaidInvoices: json["unpaid_invoices"],
        loan: Loan.fromJson(json["loan"]),
      );

  Map<String, dynamic> toJson() => {
        "remaining_days": remainingDays,
        "remaining_traffic": remainingTraffic,
        "remaining_uptime": remainingUptime,
        "balance": balance,
        "unpaid_invoices": unpaidInvoices,
        "loan": loan?.toJson(),
      };
}

class Loan {
  dynamic? rxMb;
  dynamic? txMb;
  dynamic? rxtxMb;
  dynamic? days;

  Loan({
    this.rxMb,
    this.txMb,
    this.rxtxMb,
    this.days,
  });

  factory Loan.fromJson(Map<String, dynamic> json) => Loan(
        rxMb: json["rx_mb"],
        txMb: json["tx_mb"],
        rxtxMb: json["rxtx_mb"],
        days: json["days"],
      );

  Map<String, dynamic> toJson() => {
        "rx_mb": rxMb,
        "tx_mb": txMb,
        "rxtx_mb": rxtxMb,
        "days": days,
      };
}
