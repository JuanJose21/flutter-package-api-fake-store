import 'dart:convert';

class AuthPostModel {
  String username;
  String password;

  AuthPostModel({
    required this.username,
    required this.password,
  });

  /// Convert a json to a AuthPostModel object
  factory AuthPostModel.fromJson(Map<String, dynamic> json) => AuthPostModel(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };

  /// Convert a json to a AuthPostModel object
  static AuthPostModel authPostModelFromJson(String str) =>
      AuthPostModel.fromJson(json.decode(str));

  /// Convert a AuthPostModel object to a json
  static String authPostModelToJson(AuthPostModel data) =>
      json.encode(data.toJson());
}
