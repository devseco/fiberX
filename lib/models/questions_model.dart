// To parse this JSON data, do
//
//     final questionsModel = questionsModelFromJson(jsonString);

import 'dart:convert';

List<QuestionsModel> questionsModelFromJson(String str) =>
    List<QuestionsModel>.from(
        json.decode(str).map((x) => QuestionsModel.fromJson(x)));

String questionsModelToJson(List<QuestionsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuestionsModel {
  String? id;
  bool? deleted;
  DateTime? creationDate;
  String? question;
  String? answer;
  bool? isExpanded = false;

  QuestionsModel(
      {this.id,
      this.deleted,
      this.creationDate,
      this.question,
      this.answer,
      this.isExpanded});

  factory QuestionsModel.fromJson(Map<String, dynamic> json) => QuestionsModel(
      id: json["id"],
      deleted: json["deleted"],
      creationDate: DateTime.parse(json["creationDate"]),
      question: json["question"],
      answer: json["answer"],
      isExpanded: false);

  Map<String, dynamic> toJson() => {
        "id": id,
        "deleted": deleted,
        "creationDate": creationDate?.toIso8601String(),
        "question": question,
        "answer": answer,
      };
}
