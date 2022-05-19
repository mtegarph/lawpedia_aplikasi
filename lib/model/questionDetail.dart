part of 'model.dart';

class QuestionDetail {
  QuestionDetail({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  DataQuestion? data;

  factory QuestionDetail.fromJson(Map<String, dynamic> json) => QuestionDetail(
        status: json["status"],
        message: json["message"],
        data: DataQuestion.fromJson(json["data"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "status": status,
  //       "message": message,
  //       "data": data.toJson(),
  //     };
}

class DataQuestion {
  DataQuestion({
    this.questions,
  });

  QuestionsListDetail? questions;

  factory DataQuestion.fromJson(Map<String, dynamic> json) => DataQuestion(
        questions: QuestionsListDetail.fromJson(json["question_details"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "questions": questions.toJson(),
  //     };
}

class QuestionsListDetail {
  QuestionsListDetail(
      {this.questionId,
      this.qTitle,
      this.qBody,
      //  this.questionedBy,
      this.questionedAt,
      this.answer});

  int? questionId;
  String? qTitle;
  String? qBody;
  //QuestionedBy? questionedBy;
  Answer? answer;
  DateTime? questionedAt;

  factory QuestionsListDetail.fromJson(Map<String, dynamic> json) =>
      QuestionsListDetail(
        questionId: json["question_id"],
        qTitle: json["q_title"],
        qBody: json["q_body"],
        // questionedBy: QuestionedBy.fromJson(jsonDecode(json["questioned_by"])),
        answer: json["answer"] == null ? null : Answer.fromJson(json["answer"]),
        questionedAt: DateTime.parse(json["questioned_at"]),
      );

  // Map<String, dynamic> toJson() => {
  //     "question_id": questionId,
  //     "user_id": userId,
  //     "q_title": qTitle,
  //     "q_body": qBody,
  //     "q_anonymity": qAnonymity,
  //     "answered_at": answeredAt,
  //     "created_at": createdAt.toIso8601String(),
  // };
}

class QuestionedBy {
  QuestionedBy({
    this.firstName,
    this.lastName,
  });

  String? firstName;
  dynamic? lastName;

  factory QuestionedBy.fromJson(Map<String, dynamic> json) => QuestionedBy(
        firstName: json["first_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
      };
}

class Answer {
  Answer({
    this.answerId,
    this.answer,
    this.answeredBy,
    this.editedBy,
    this.answeredAt,
    this.editedAt,
  });

  int? answerId;
  String? answer;
  EdBy? answeredBy;
  EdBy? editedBy;
  DateTime? answeredAt;
  DateTime? editedAt;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        answerId: json["answer_id"] == null ? null : json["answer_id"],
        answer: json["answer"] == null ? null : json["answer"],
        answeredBy: json["answered_by"] == null
            ? null
            : EdBy.fromJson(json["answered_by"]),
        editedBy:
            json["edited_by"] == null ? null : EdBy.fromJson(json["edited_by"]),
        answeredAt: json["answered_at"] == null
            ? null
            : DateTime.parse(json["answered_at"]),
        editedAt: json["edited_at"] == null
            ? null
            : DateTime.parse(json["edited_at"]),
      );

  Map<String, dynamic> toJson() => {
        "answer_id": answerId,
        "answer": answer,
        "answered_by": answeredBy?.toJson(),
        "edited_by": editedBy?.toJson(),
        "answered_at": answeredAt?.toIso8601String(),
        "edited_at": editedAt?.toIso8601String(),
      };
}

class EdBy {
  EdBy({
    this.firstName,
    this.lastName,
  });

  String? firstName;
  dynamic? lastName;

  factory EdBy.fromJson(Map<String, dynamic> json) => EdBy(
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["first_name"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
      };
}
