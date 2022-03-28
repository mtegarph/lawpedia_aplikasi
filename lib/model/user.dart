part of 'model.dart';

class UserDetail {
  UserDetail({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  DataUser? data;

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        status: json["status"],
        message: json["message"],
        data: DataUser.fromJson(json["data"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "status": status,
  //       "message": message,
  //       "data": data.toJson(),
  //     };
}

class DataUser {
  DataUser({
    this.userProfile,
  });

  UserProfile? userProfile;

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        userProfile: UserProfile.fromJson(json["user_profile"]),
      );
}

class UserProfile {
  UserProfile({
    this.userId,
    this.email,
    this.profilePict,
    this.firstName,
    this.lastName,
    this.noTelp,
    this.tnglLahir,
    this.subscriptionStatus,
    this.createdAt,
  });

  int? userId;
  String? email;
  String? profilePict;
  String? firstName;
  String? lastName;
  dynamic? noTelp;
  DateTime? tnglLahir;
  int? subscriptionStatus;
  DateTime? createdAt;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        userId: json["user_id"],
        email: json["email"],
        profilePict: json["profile_pict"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        noTelp: json["no_telp"],
        tnglLahir: DateTime.parse(json["tngl_lahir"]),
        subscriptionStatus: json["subscription_status"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "user_id": userId,
  //       "email": email,
  //       "profile_pict": profilePict,
  //       "first_name": firstName,
  //       "last_name": lastName,
  //       "no_telp": noTelp,
  //       "tngl_lahir":
  //           "${tnglLahir.year.toString().padLeft(4, '0')}-${tnglLahir.month.toString().padLeft(2, '0')}-${tnglLahir.day.toString().padLeft(2, '0')}",
  //       "subscription_status": subscriptionStatus,
  //       "created_at": createdAt.toIso8601String(),
  //     };
}
