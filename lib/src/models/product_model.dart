import 'dart:convert';
import 'package:flutter_package_api_fake_store/src/models/rating_model.dart';
import 'package:flutter_package_api_fake_store/src/utils/enums/enums_category.dart';

class ProductModel {
  int? id;
  String title;
  double price;
  String description;
  CategoryEnum category;
  String image;
  RatingModel? rating;

  ProductModel({
    this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.rating,
  });

  /// Convert a json to a [ProductModel] object
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category:
            categoryValues.map[json["category"]] ?? CategoryEnum.electronics,
        image: json["image"],
        rating: json["rating"] != null
            ? RatingModel.fromJson(json["rating"])
            : null,
      );

  /// Convert a json to a [ProductModel] object for adding a product
  factory ProductModel.fromJsonAdd(Map<String, dynamic> json) => ProductModel(
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category:
            categoryValues.map[json["category"]] ?? CategoryEnum.electronics,
        image: json["image"],
      );

  /// Convert a [ProductModel] object to a json
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": categoryValues.reverse[category],
        "image": image,
        "rating": rating?.toJson(),
      };

  /// Convert a [ProductModel] object to a json for adding a product
  Map<String, dynamic> toAddJson() => {
        "title": title,
        "price": price,
        "description": description,
        "category": categoryValues.reverse[category],
        "image": image,
      };

  /// Convert a json to a list of type [ProductModel]
  static List<ProductModel> productsModelFromJson(String str) =>
      List<ProductModel>.from(
          json.decode(str).map((x) => ProductModel.fromJson(x)));

  /// Convert a list of [ProductModel] to a json
  static String productsModelToJson(List<ProductModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  /// Convert a json to a single [ProductModel]
  static ProductModel productModelFromJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  /// Convert a single [ProductModel] to a json
  static String productModelToJson(ProductModel data) =>
      json.encode(data.toJson());

  /// Convert a json to a [ProductModel] for adding a product
  static ProductModel productAddModelFromJson(String str) =>
      ProductModel.fromJsonAdd(json.decode(str));

  /// Convert a [ProductModel] for adding a product to a json
  static String productAddModelToJson(ProductModel data) =>
      json.encode(data.toAddJson());
}
