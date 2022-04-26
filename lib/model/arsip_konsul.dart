part of 'model.dart';

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
