import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.email,
    this.id,
    this.token,
  });

  String? email;
  String? id;
  String? token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        email: json["email"],
        id: json["_id"],
        token: json["Token"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "_id": id,
        "Token": token,
      };
}
