part of 'model.dart';
class BannerKonsultan {
    BannerKonsultan({
        this.status,
        this.message,
        this.data,
    });

    String? status;
    String? message;
    DataBannerKonsultan? data;

    factory BannerKonsultan.fromJson(Map<String, dynamic> json) => BannerKonsultan(
        status: json["status"],
        message: json["message"],
        data: DataBannerKonsultan.fromJson(json["data"]),
    );

    // Map<String, dynamic> toJson() => {
    //     "status": status,
    //     "message": message,
    //     "data": data.toJson(),
    // };
}

class DataBannerKonsultan {
    DataBannerKonsultan({
        this.konsultanHukum,
    });

    List<KonsultanHukum>? konsultanHukum;

    factory DataBannerKonsultan.fromJson(Map<String, dynamic> json) => DataBannerKonsultan(
        konsultanHukum: List<KonsultanHukum>.from(json["konsultan_hukum"].map((x) => KonsultanHukum.fromJson(x))),
    );

    // Map<String, dynamic> toJson() => {
    //     "konsultan_hukum": List<dynamic>.from(konsultanHukum.map((x) => x.toJson())),
    // };
}

class KonsultanHukum {
    KonsultanHukum({
        this.khId,
        this.khName,
        this.khDesc,
        this.khImg,
        this.createdAt,
    });

    int? khId;
    String? khName;
    String? khDesc;
    dynamic? khImg;
    DateTime? createdAt;

    factory KonsultanHukum.fromJson(Map<String, dynamic> json) => KonsultanHukum(
        khId: json["kh_id"],
        khName: json["kh_name"],
        khDesc: json["kh_desc"],
        khImg: json["kh_img"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    // Map<String, dynamic> toJson() => {
    //     "kh_id": khId,
    //     "kh_name": khName,
    //     "kh_desc": khDesc,
    //     "kh_img": khImg,
    //     "created_at": createdAt.toIso8601String(),
    // };
}
