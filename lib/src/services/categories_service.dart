import 'package:dartz/dartz.dart';
import 'package:flutter_package_api_fake_store/src/global/global.dart';
import 'package:flutter_package_api_fake_store/src/models/category_model.dart';
import 'package:flutter_package_api_fake_store/src/models/product_model.dart';
import 'package:flutter_package_api_fake_store/src/utils/index.dart';
import 'package:http/http.dart' as http;

class CategoriesHttpService {
  /// Get all categories
  /// Return a list of [CategoryEnum] if success
  /// Return a string if error
  ///
  /// Example:
  /// ```dart
  /// final result = await categoriesHttpService.getCategories();
  /// result.fold(
  ///   (error) => print(error),
  ///   (categories) => print(categories),
  /// );
  /// ```
  Future<Either<String, List<CategoryEnum>>> getCategories() async {
    try {
      final uri = Uri.parse(baseUrl + endPointCategories);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<CategoryEnum> categories =
            categoryModelFromJson(response.body);
        return Right(categories);
      } else {
        return Left('Error: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception - getCategories: $e');
    }
  }

  /// Get products by category
  /// Return a list of [ProductModel] if success
  /// Return a string if error
  ///
  /// Example:
  /// ```dart
  /// final result = await categoriesHttpService.getCategorieProducts(CategoryEnum.electronics);
  /// result.fold(
  ///   (error) => print(error),
  ///   (products) => print(products),
  /// );
  /// ```
  Future<Either<String, List<ProductModel>>> getCategoryProducts(
      CategoryEnum category) async {
    try {
      final uri = Uri.parse(baseUrl + endPointCategories + category.toString());
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<ProductModel> categories =
            productsModelFromJson(response.body);
        return Right(categories);
      } else {
        return Left('Error: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception - getCategorieProducts: $e');
    }
  }
}
