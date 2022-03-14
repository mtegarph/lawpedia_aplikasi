part of 'model.dart';

class Login {
  Login({
    this.status,
    this.message,
    this.authToken,
  });

  String? status;
  String? message;
  String? authToken;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"],
        message: json["message"],
        authToken: json["auth_token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "auth_token": authToken,
      };
}
