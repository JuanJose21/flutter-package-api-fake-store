import 'dart:convert';

import 'package:flutter_package_api_fake_store/src/models/address_model.dart';
import 'package:flutter_package_api_fake_store/src/models/name_model.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

UserModel userAddModelFromJson(String str) =>
    UserModel.fromJsonId(json.decode(str));

String userAddModelToJson(UserModel data) => json.encode(data.toJsonAdd());

class UserModel {
  int? id;
  String? email;
  String? username;
  String? password;
  NameModel? name;
  AddressModel? address;
  String? phone;

  UserModel({
    this.id,
    this.email,
    this.username,
    this.password,
    this.name,
    this.address,
    this.phone,
  });

  /// Convert a json to a UserModel object
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        name: NameModel.fromJson(json["name"]),
        address: AddressModel.fromJson(json["address"]),
        phone: json["phone"],
      );

  /// Convert a UserModel object to a json
  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "password": password,
        "name": name?.toJson(),
        "address": address?.toJson(),
        "phone": phone,
      };

  /// Convert a json to a UserModel object
  factory UserModel.fromJsonAdd(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        username: json["username"],
        password: json["password"],
        name: NameModel.fromJson(json["name"]),
        address: AddressModel.fromJson(json["address"]),
        phone: json["phone"],
      );

  factory UserModel.fromJsonId(Map<String, dynamic> json) => UserModel(
        id: json["id"],
      );

  /// Convert a UserModel object to a json
  Map<String, dynamic> toJsonAdd() => {
        "email": email,
        "username": username,
        "password": password,
        "name": name?.toJson(),
        "address": address?.toJson(),
        "phone": phone,
      };
}
