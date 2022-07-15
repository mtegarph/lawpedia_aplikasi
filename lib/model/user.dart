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

  UserDetail copyWith({
    String? status,
    String? message,
    DataUser? data,
  }) =>
      UserDetail(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : DataUser.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class DataUser {
  DataUser({
    this.userProfile,
  });

  UserProfile? userProfile;

  DataUser copyWith({
    UserProfile? userProfile,
  }) =>
      DataUser(
        userProfile: userProfile ?? this.userProfile,
      );

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        userProfile: json["user_profile"] == null
            ? null
            : UserProfile.fromJson(json["user_profile"]),
      );

  Map<String, dynamic> toJson() => {
        "user_profile": userProfile == null ? null : userProfile!.toJson(),
      };
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
  String? noTelp;
  DateTime? tnglLahir;
  int? subscriptionStatus;
  DateTime? createdAt;

  UserProfile copyWith({
    int? userId,
    String? email,
    String? profilePict,
    String? firstName,
    String? lastName,
    String? noTelp,
    DateTime? tnglLahir,
    int? subscriptionStatus,
    DateTime? createdAt,
  }) =>
      UserProfile(
        userId: userId ?? this.userId,
        email: email ?? this.email,
        profilePict: profilePict ?? this.profilePict,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        noTelp: noTelp ?? this.noTelp,
        tnglLahir: tnglLahir ?? this.tnglLahir,
        subscriptionStatus: subscriptionStatus ?? this.subscriptionStatus,
        createdAt: createdAt ?? this.createdAt,
      );

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        userId: json["user_id"] == null ? null : json["user_id"],
        email: json["email"] == null ? null : json["email"],
        profilePict: json["profile_pict"] == null ? null : json["profile_pict"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        noTelp: json["no_telp"] == null ? null : json["no_telp"],
        tnglLahir: json["tngl_lahir"] == null
            ? null
            : DateTime.parse(json["tngl_lahir"]),
        subscriptionStatus: json["subscription_status"] == null
            ? null
            : json["subscription_status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "email": email == null ? null : email,
        "profile_pict": profilePict == null ? null : profilePict,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "no_telp": noTelp == null ? null : noTelp,
        "tngl_lahir": tnglLahir == null
            ? null
            : "${tnglLahir!.year.toString().padLeft(4, '0')}-${tnglLahir!.month.toString().padLeft(2, '0')}-${tnglLahir!.day.toString().padLeft(2, '0')}",
        "subscription_status":
            subscriptionStatus == null ? null : subscriptionStatus,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
      };
}
