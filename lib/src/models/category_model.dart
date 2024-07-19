import 'dart:convert';

import 'package:flutter_package_api_fake_store/src/utils/index.dart';

/// Convert a json to a list of type [CategoryEnum]
List<CategoryEnum> categoryModelFromJson(String str) =>
    List<CategoryEnum>.from(json.decode(str).map((x) => x));

/// Convert a list of [CategoryEnum] to a json
String categoryModelToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
