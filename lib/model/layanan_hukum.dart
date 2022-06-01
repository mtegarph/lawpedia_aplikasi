part of 'model.dart';

class LayananHukum {
  LayananHukum({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  DataLayananHukum? data;

  factory LayananHukum.fromJson(Map<String, dynamic> json) => LayananHukum(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : DataLayananHukum.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class DataLayananHukum {
  DataLayananHukum({
    this.layananHukum,
  });

  LayananHukumClass? layananHukum;

  factory DataLayananHukum.fromJson(Map<String, dynamic> json) =>
      DataLayananHukum(
        layananHukum: json["konsultan_hukum"] == null
            ? null
            : LayananHukumClass.fromJson(json["konsultan_hukum"]),
      );

  Map<String, dynamic> toJson() => {
        "konsultan_hukum": layananHukum == null ? null : layananHukum!.toJson(),
      };
}

class LayananHukumClass {
  LayananHukumClass({
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
  List<DatumLayananHukum>? data;
  String? firstPageUrl;
  int? from;
  dynamic? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;

  factory LayananHukumClass.fromJson(Map<String, dynamic> json) =>
      LayananHukumClass(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        data: json["data"] == null
            ? null
            : List<DatumLayananHukum>.from(
                json["data"].map((x) => DatumLayananHukum.fromJson(x))),
        firstPageUrl:
            json["first_page_url"] == null ? null : json["first_page_url"],
        from: json["from"] == null ? null : json["from"],
        nextPageUrl: json["next_page_url"],
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"] == null ? null : json["to"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? null : currentPage,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl == null ? null : firstPageUrl,
        "from": from == null ? null : from,
        "next_page_url": nextPageUrl,
        "path": path == null ? null : path,
        "per_page": perPage == null ? null : perPage,
        "prev_page_url": prevPageUrl,
        "to": to == null ? null : to,
      };
}

class DatumLayananHukum {
  DatumLayananHukum({
    this.idLayananHukum,
    this.layananHukum,
  });

  int? idLayananHukum;
  String? layananHukum;

  factory DatumLayananHukum.fromJson(Map<String, dynamic> json) =>
      DatumLayananHukum(
        idLayananHukum:
            json["id_layanan_hukum"] == null ? null : json["id_layanan_hukum"],
        layananHukum:
            json["layanan_hukum"] == null ? null : json["layanan_hukum"],
      );

  Map<String, dynamic> toJson() => {
        "id_layanan_hukum": idLayananHukum == null ? null : idLayananHukum,
        "layanan_hukum": layananHukum == null ? null : layananHukum,
      };
}

class LayananHukumSubKategori {
  LayananHukumSubKategori({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  DataLayananHukumSub? data;

  factory LayananHukumSubKategori.fromJson(Map<String, dynamic> json) =>
      LayananHukumSubKategori(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : DataLayananHukumSub.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class DataLayananHukumSub {
  DataLayananHukumSub({
    this.layananHukum,
  });

  LayananHukumClassSub? layananHukum;

  factory DataLayananHukumSub.fromJson(Map<String, dynamic> json) =>
      DataLayananHukumSub(
        layananHukum: json["layanan_hukum"] == null
            ? null
            : LayananHukumClassSub.fromJson(json["layanan_hukum"]),
      );

  Map<String, dynamic> toJson() => {
        "layanan_hukum": layananHukum == null ? null : layananHukum!.toJson(),
      };
}

class LayananHukumClassSub {
  LayananHukumClassSub({
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
  List<DatumSub>? data;
  String? firstPageUrl;
  int? from;
  dynamic? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;

  factory LayananHukumClassSub.fromJson(Map<String, dynamic> json) =>
      LayananHukumClassSub(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        data: json["data"] == null
            ? null
            : List<DatumSub>.from(
                json["data"].map((x) => DatumSub.fromJson(x))),
        firstPageUrl:
            json["first_page_url"] == null ? null : json["first_page_url"],
        from: json["from"] == null ? null : json["from"],
        nextPageUrl: json["next_page_url"],
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"] == null ? null : json["to"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? null : currentPage,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl == null ? null : firstPageUrl,
        "from": from == null ? null : from,
        "next_page_url": nextPageUrl,
        "path": path == null ? null : path,
        "per_page": perPage == null ? null : perPage,
        "prev_page_url": prevPageUrl,
        "to": to == null ? null : to,
      };
}

class DatumSub {
  DatumSub({
    this.detailLayanan,
  });

  String? detailLayanan;

  factory DatumSub.fromJson(Map<String, dynamic> json) => DatumSub(
        detailLayanan:
            json["detail_layanan"] == null ? null : json["detail_layanan"],
      );

  Map<String, dynamic> toJson() => {
        "detail_layanan": detailLayanan == null ? null : detailLayanan,
      };
}
