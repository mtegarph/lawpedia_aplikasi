part of 'model.dart';

class ListKonsultan {
  ListKonsultan({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  DataList? data;

  factory ListKonsultan.fromJson(Map<String, dynamic> json) => ListKonsultan(
        status: json["status"],
        message: json["message"],
        data: DataList.fromJson(json["data"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "status": status,
  //       "message": message,
  //       "data": data.toJson(),
  //     };
}

class DataList {
  DataList({
    this.konsultanHukum,
  });

  KonsultanHukumList? konsultanHukum;

  factory DataList.fromJson(Map<String, dynamic> json) => DataList(
        konsultanHukum: KonsultanHukumList.fromJson(json["konsultan_hukum"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "konsultan_hukum": konsultanHukum.toJson(),
  //     };
}

class KonsultanHukumList {
  KonsultanHukumList({
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
  List<DatumKonsultanHukum>? data;
  String? firstPageUrl;
  int? from;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;

  factory KonsultanHukumList.fromJson(Map<String, dynamic> json) => KonsultanHukumList(
        currentPage: json["current_page"],
        data: List<DatumKonsultanHukum>.from(json["data"].map((x) => DatumKonsultanHukum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
      );

  // Map<String, dynamic> toJson() => {
  //       "current_page": currentPage,
  //       "data": List<dynamic>.from(data.map((x) => x.toJson())),
  //       "first_page_url": firstPageUrl,
  //       "from": from,
  //       "next_page_url": nextPageUrl,
  //       "path": path,
  //       "per_page": perPage,
  //       "prev_page_url": prevPageUrl,
  //       "to": to,
  //     };
}

class DatumKonsultanHukum {
  DatumKonsultanHukum({
    this.khId,
    this.khName,
    this.khDesc,
    this.khImg,
    this.createdAt,
  });

  int? khId;
  String? khName;
  String? khDesc;
  String? khImg;
  DateTime? createdAt;

  factory DatumKonsultanHukum.fromJson(Map<String, dynamic> json) => DatumKonsultanHukum(
        khId: json["kh_id"],
        khName: json["kh_name"],
        khDesc: json["kh_desc"],
        khImg: json["kh_img"] == null ? null : json["kh_img"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "kh_id": khId,
  //       "kh_name": khName,
  //       "kh_desc": khDesc,
  //       "kh_img": khImg == null ? null : khImg,
  //       "created_at": createdAt.toIso8601String(),
  //     };
}
