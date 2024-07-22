import 'dart:convert';

import 'package:flutter_package_api_fake_store/src/models/product_cart_model.dart';

/// Convert a json to a list of type [CartModel]
List<CartModel> cartModelFromJson(String str) =>
    List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

/// Convert a list of [CartModel] to a json
String cartModelToJson(List<CartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// Convert a json to a [CartModel]
CartModel cartProductModelFromJson(String str) =>
    CartModel.fromProductJson(json.decode(str));

/// Convert a [CartModel] to a json
String cartProductModelToJson(CartModel data) =>
    json.encode(data.toProductJson());

class CartModel {
  CartModel({
    this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  int? id;
  int userId;
  DateTime date;
  List<ProductCartModel> products;

  /// Convert a json to a CartModel object
  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        userId: json["userId"],
        date: DateTime.parse(json["date"]),
        products: List<ProductCartModel>.from(
            json["products"].map((x) => ProductCartModel.fromJson(x))),
      );

  /// Convert a CartModel object to a json
  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": date.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };

  /// Convert a json to a CartModel object
  factory CartModel.fromProductJson(Map<String, dynamic> json) => CartModel(
        userId: json["userId"],
        date: DateTime.parse(json["date"]),
        products: List<ProductCartModel>.from(
            json["products"].map((x) => ProductCartModel.fromJson(x))),
      );

  /// Convert a CartModel object to a json
  Map<String, dynamic> toProductJson() => {
        "userId": userId,
        "date": date.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}
