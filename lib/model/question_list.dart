part of 'model.dart';

class QuestionList {
  QuestionList({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory QuestionList.fromJson(Map<String, dynamic> json) => QuestionList(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.questions,
  });

  Questions? questions;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        questions: Questions.fromJson(json["questions"]),
      );

  Map<String, dynamic> toJson() => {
        "questions": questions?.toJson(),
      };
}

class Questions {
  Questions({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
  });

  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;

  factory Questions.fromJson(Map<String, dynamic> json) => Questions(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
      };
}

class Datum {
  Datum({
    this.questionId,
    this.userId,
    this.qTitle,
    this.qAnonymity,
    this.answeredAt,
    this.createdAt,
  });

  int? questionId;
  int? userId;
  String? qTitle;
  int? qAnonymity;
  dynamic? answeredAt;
  DateTime? createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        questionId: json["question_id"],
        userId: json["user_id"],
        qTitle: json["q_title"],
        qAnonymity: json["q_anonymity"],
        answeredAt: json["answered_at"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "question_id": questionId,
        "user_id": userId,
        "q_title": qTitle,
        "q_anonymity": qAnonymity,
        "answered_at": answeredAt,
        "created_at": createdAt?.toIso8601String(),
      };
}
