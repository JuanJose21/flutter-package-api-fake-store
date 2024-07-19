import 'dart:convert';

import 'package:flutter_package_api_fake_store/src/models/address_model.dart';
import 'package:flutter_package_api_fake_store/src/models/name_model.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int id;
  String email;
  String username;
  String password;
  NameModel name;
  AddressModel address;
  String phone;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
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
        "name": name.toJson(),
        "address": address.toJson(),
        "phone": phone,
      };
}
