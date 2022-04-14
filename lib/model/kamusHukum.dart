part of 'model.dart';

class KamusHukumData {
  KamusHukumData({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  DataKamusHukum? data;

  factory KamusHukumData.fromJson(Map<String, dynamic> json) => KamusHukumData(
        status: json["status"],
        message: json["message"],
        data: DataKamusHukum.fromJson(json["data"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "status": status,
  //       "message": message,
  //       "data": data.toJson(),
  //     };
}

class DataKamusHukum {
  DataKamusHukum({
    this.kamusHukum,
  });

  KamusHukumClass? kamusHukum;

  factory DataKamusHukum.fromJson(Map<String, dynamic> json) => DataKamusHukum(
        kamusHukum: KamusHukumClass.fromJson(json["kamus_hukum"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "kamus_hukum": kamusHukum.toJson(),
  //     };
}

class KamusHukumClass {
  KamusHukumClass({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<DatumKamusHukum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;
  int? total;

  factory KamusHukumClass.fromJson(Map<String, dynamic> json) =>
      KamusHukumClass(
        currentPage: json["current_page"],
        data: List<DatumKamusHukum>.from(
            json["data"].map((x) => DatumKamusHukum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  // Map<String, dynamic> toJson() => {
  //       "current_page": currentPage,
  //       "data": List<dynamic>.from(data.map((x) => x.toJson())),
  //       "first_page_url": firstPageUrl,
  //       "from": from,
  //       "last_page": lastPage,
  //       "last_page_url": lastPageUrl,
  //       "next_page_url": nextPageUrl,
  //       "path": path,
  //       "per_page": perPage,
  //       "prev_page_url": prevPageUrl,
  //       "to": to,
  //       "total": total,
  //     };
}

class DatumKamusHukum {
  DatumKamusHukum({
    this.kahuId,
    this.kahuTitle,
    this.kahuFile,
    this.createdAt,
  });

  int? kahuId;
  String? kahuTitle;
  String? kahuFile;
  DateTime? createdAt;

  factory DatumKamusHukum.fromJson(Map<String, dynamic> json) =>
      DatumKamusHukum(
        kahuId: json["kahu_id"],
        kahuTitle: json["kahu_title"],
        kahuFile: json["kahu_file"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  // Map<String, dynamic> toJson() => {
  //     "kahu_id": kahuId,
  //     "kahu_title": kahuTitle,
  //     "kahu_file": kahuFile,
  //     "created_at": createdAt.toIso8601String(),
  // };
}
