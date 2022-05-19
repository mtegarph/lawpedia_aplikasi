part of 'model.dart';

//list Arsip kategori
class ArsipKonsultasiKategori {
  ArsipKonsultasiKategori({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  DataKategori? data;

  factory ArsipKonsultasiKategori.fromJson(Map<String, dynamic> json) =>
      ArsipKonsultasiKategori(
        status: json["status"],
        message: json["message"],
        data: DataKategori.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class DataKategori {
  DataKategori({
    this.archiveCategories,
  });

  ArchiveCategories? archiveCategories;

  factory DataKategori.fromJson(Map<String, dynamic> json) => DataKategori(
        archiveCategories:
            ArchiveCategories.fromJson(json["archive_categories"]),
      );

  Map<String, dynamic> toJson() => {
        "archive_categories": archiveCategories?.toJson(),
      };
}

class ArchiveCategories {
  ArchiveCategories({
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
  List<DatumKategori>? data;
  String? firstPageUrl;
  int? from;
  dynamic? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;

  factory ArchiveCategories.fromJson(Map<String, dynamic> json) =>
      ArchiveCategories(
        currentPage: json["current_page"],
        data: List<DatumKategori>.from(
            json["data"].map((x) => DatumKategori.fromJson(x))),
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

class DatumKategori {
  DatumKategori({
    this.acId,
    this.acCategory,
    this.pinOrder,
  });

  int? acId;
  String? acCategory;
  int? pinOrder;

  factory DatumKategori.fromJson(Map<String, dynamic> json) => DatumKategori(
        acId: json["ac_id"],
        acCategory: json["ac_category"],
        pinOrder: json["pin_order"] == null ? null : json["pin_order"],
      );

  Map<String, dynamic> toJson() => {
        "ac_id": acId,
        "ac_category": acCategory,
        "pin_order": pinOrder == null ? null : pinOrder,
      };
}

//kategori arsip deetail
class ArsipKonsultasiDetail {
  ArsipKonsultasiDetail({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  DataKategoriDetail? data;

  factory ArsipKonsultasiDetail.fromJson(Map<String, dynamic> json) =>
      ArsipKonsultasiDetail(
        status: json["status"],
        message: json["message"],
        data: DataKategoriDetail.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class DataKategoriDetail {
  DataKategoriDetail({
    this.questions,
  });

  QuestionsKategori? questions;

  factory DataKategoriDetail.fromJson(Map<String, dynamic> json) =>
      DataKategoriDetail(
        questions: QuestionsKategori.fromJson(json["questions"]),
      );

  Map<String, dynamic> toJson() => {
        "questions": questions?.toJson(),
      };
}

class QuestionsKategori {
  QuestionsKategori({
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
  List<DatumKategoriDetail>? data;
  String? firstPageUrl;
  int? from;
  dynamic? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;

  factory QuestionsKategori.fromJson(Map<String, dynamic> json) =>
      QuestionsKategori(
        currentPage: json["current_page"],
        data: List<DatumKategoriDetail>.from(
            json["data"].map((x) => DatumKategoriDetail.fromJson(x))),
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

class DatumKategoriDetail {
  DatumKategoriDetail({
    this.questionId,
    this.userId,
    this.qTitle,
    this.qAnonymity,
    this.answeredAt,
    this.questionedAt,
  });

  int? questionId;
  int? userId;
  String? qTitle;
  int? qAnonymity;
  DateTime? answeredAt;
  DateTime? questionedAt;

  factory DatumKategoriDetail.fromJson(Map<String, dynamic> json) =>
      DatumKategoriDetail(
        questionId: json["question_id"],
        userId: json["user_id"],
        qTitle: json["q_title"],
        qAnonymity: json["q_anonymity"],
        answeredAt: DateTime.parse(json["answered_at"]),
        questionedAt: DateTime.parse(json["questioned_at"]),
      );

  Map<String, dynamic> toJson() => {
        "question_id": questionId,
        "user_id": userId,
        "q_title": qTitle,
        "q_anonymity": qAnonymity,
        "answered_at": answeredAt?.toIso8601String(),
        "questioned_at": questionedAt?.toIso8601String(),
      };
}

