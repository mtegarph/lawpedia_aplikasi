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
    QuestionsListDetail({
        this.questionId,
        this.userId,
        this.qTitle,
        this.qBody,
        this.qAnonymity,
        this.answeredAt,
        this.createdAt,
    });

    int? questionId;
    int? userId;
    String? qTitle;
    String? qBody;
    int? qAnonymity;
    dynamic? answeredAt;
    DateTime? createdAt;

    factory QuestionsListDetail.fromJson(Map<String, dynamic> json) => QuestionsListDetail(
        questionId: json["question_id"],
        userId: json["user_id"],
        qTitle: json["q_title"],
        qBody: json["q_body"],
        qAnonymity: json["q_anonymity"],
        answeredAt: json["answered_at"],
        createdAt: DateTime.parse(json["created_at"]),
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



