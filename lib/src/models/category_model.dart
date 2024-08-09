import 'dart:convert';
import 'package:flutter_package_api_fake_store/src/utils/index.dart';

class CategoryModel {
  /// Convert a json to a list of type [String]
  static List<String> categoryModelFromJson(String str) =>
      List<String>.from(json.decode(str).map((x) => x));

  /// Convert a list of [CategoryEnum] to a json
  static String categoryModelToJson(List<String> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x)));
}
