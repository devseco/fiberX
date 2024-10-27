// To parse this JSON data, do
//
//     final invoiceModel = invoiceModelFromJson(jsonString);

import 'dart:convert';

List<InvoiceModel> invoiceModelFromJson(String str) => List<InvoiceModel>.from(
    json.decode(str).map((x) => InvoiceModel.fromJson(x)));

String invoiceModelToJson(List<InvoiceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InvoiceModel {
  int? id;
  String? invoiceNumber;
  String? type;
  String? amount;
  dynamic? description;
  int? paid;
  int? createdBy;
  DateTime? createdAt;
  dynamic? paymentMethod;
  DateTime? dueDate;

  InvoiceModel({
    this.id,
    this.invoiceNumber,
    this.type,
    this.amount,
    this.description,
    this.paid,
    this.createdBy,
    this.createdAt,
    this.paymentMethod,
    this.dueDate,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
        id: json["id"],
        invoiceNumber: json["invoice_number"],
        type: json["type"],
        amount: json["amount"],
        description: json["description"],
        paid: json["paid"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        paymentMethod: json["payment_method"],
        dueDate: DateTime.parse(json["due_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "invoice_number": invoiceNumber,
        "type": type,
        "amount": amount,
        "description": description,
        "paid": paid,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
        "payment_method": paymentMethod,
        "due_date": dueDate?.toIso8601String(),
      };
}
