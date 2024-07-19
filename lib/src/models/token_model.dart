import 'dart:convert';

/// Convert a json to a TokenModel object
TokenModel tokenModelFromJson(String str) =>
    TokenModel.fromJson(json.decode(str));

/// Convert a TokenModel object to a json
String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
  String token;

  TokenModel({
    required this.token,
  });

  /// Convert a json to a TokenModel object
  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
