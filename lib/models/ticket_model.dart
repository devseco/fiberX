// To parse this JSON data, do
//
//     final ticketModel = ticketModelFromJson(jsonString);

import 'dart:convert';

TicketModel ticketModelFromJson(String str) =>
    TicketModel.fromJson(json.decode(str));

String ticketModelToJson(TicketModel data) => json.encode(data.toJson());

class TicketModel {
  String subject;
  String description;
  String phone;

  TicketModel({
    required this.subject,
    required this.description,
    required this.phone,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        subject: json["subject"],
        description: json["description"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "subject": subject,
        "description": description,
        "phone": phone,
      };
}
