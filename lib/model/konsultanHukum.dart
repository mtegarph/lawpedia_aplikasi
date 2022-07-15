part of 'model.dart';
//konsultan hukum list
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

    this.khImg,
    this.createdAt,
  });

  int? khId;
  String? khName;

  String? khImg;
  DateTime? createdAt;

  factory DatumKonsultanHukum.fromJson(Map<String, dynamic> json) => DatumKonsultanHukum(
        khId: json["kh_id"],
        khName: json["kh_name"],
     
        khImg: json["kh_img"],
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
//konsultan hukum detail
class KonsultanHukumDetail {
    KonsultanHukumDetail({
        this.status,
        this.message,
        this.data,
    });

    String? status;
    String? message;
    DataKonsultanHukum? data;

    factory KonsultanHukumDetail.fromJson(Map<String, dynamic> json) => KonsultanHukumDetail(
        status: json["status"],
        message: json["message"],
        data: DataKonsultanHukum.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class DataKonsultanHukum {
    DataKonsultanHukum({
        this.konsultanHukum,
    });

    KonsultanHukumDetailIsi? konsultanHukum;

    factory DataKonsultanHukum.fromJson(Map<String, dynamic> json) => DataKonsultanHukum(
        konsultanHukum: KonsultanHukumDetailIsi.fromJson(json["konsultan_hukum"]),
    );

    Map<String, dynamic> toJson() => {
        "konsultan_hukum": konsultanHukum?.toJson(),
    };
}

class KonsultanHukumDetailIsi {
    KonsultanHukumDetailIsi({
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

    factory KonsultanHukumDetailIsi.fromJson(Map<String, dynamic> json) => KonsultanHukumDetailIsi(
        khId: json["kh_id"],
        khName: json["kh_name"],
        khDesc: json["kh_desc"],
        khImg: json["kh_img"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "kh_id": khId,
        "kh_name": khName,
        "kh_desc": khDesc,
        "kh_img": khImg,
        "created_at": createdAt?.toIso8601String(),
    };
}


//rekomendasi konsultan hukum
class RekomendasiKonsultan {
  RekomendasiKonsultan({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  DataRekomendasi? data;

  factory RekomendasiKonsultan.fromJson(Map<String, dynamic> json) =>
      RekomendasiKonsultan(
        status: json["status"],
        message: json["message"],
        data: DataRekomendasi.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class DataRekomendasi {
  DataRekomendasi({
    this.konsultanHukum,
  });

  KonsultanHukumRekomendasi? konsultanHukum;

  factory DataRekomendasi.fromJson(Map<String, dynamic> json) =>
      DataRekomendasi(
        konsultanHukum:
            KonsultanHukumRekomendasi.fromJson(json["konsultan_hukum"]),
      );

  Map<String, dynamic> toJson() => {
        "konsultan_hukum": konsultanHukum?.toJson(),
      };
}

class KonsultanHukumRekomendasi {
  KonsultanHukumRekomendasi({
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
  List<DatumRekomendasi>? data;
  String? firstPageUrl;
  int? from;
  dynamic? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;

  factory KonsultanHukumRekomendasi.fromJson(Map<String, dynamic> json) =>
      KonsultanHukumRekomendasi(
        currentPage: json["current_page"],
        data: List<DatumRekomendasi>.from(
            json["data"].map((x) => DatumRekomendasi.fromJson(x))),
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

class DatumRekomendasi {
  DatumRekomendasi({
    this.khId,
    this.khName,
    this.khImg,
    this.createdAt,
  });

  int? khId;
  String? khName;
  String? khImg;
  DateTime? createdAt;

  factory DatumRekomendasi.fromJson(Map<String, dynamic> json) =>
      DatumRekomendasi(
        khId: json["kh_id"],
        khName: json["kh_name"],
        khImg: json["kh_img"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "kh_id": khId,
        "kh_name": khName,
        "kh_img": khImg,
        "created_at": createdAt?.toIso8601String(),
      };
}
