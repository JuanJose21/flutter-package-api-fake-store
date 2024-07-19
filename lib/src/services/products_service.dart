import 'package:dartz/dartz.dart';
import 'package:flutter_package_api_fake_store/src/global/global.dart';
import 'package:flutter_package_api_fake_store/src/models/product_model.dart';
import 'package:flutter_package_api_fake_store/src/utils/index.dart';
import 'package:http/http.dart' as http;

class ProductsHttpService {
  /// Get all products
  /// Return a list of [ProductModel] if success
  /// Return a string if error
  ///
  /// Example:
  /// ```dart
  /// final result = await productsHttpService.getProducts();
  /// result.fold(
  ///   (error) => print(error),
  ///   (products) => print(products),
  /// );
  /// ```
  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      final uri = Uri.parse(baseUrl + endPointProducts);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<ProductModel> products =
            productsModelFromJson(response.body);
        return Right(products);
      } else {
        return Left('Error: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception - getProducts: $e');
    }
  }

  /// Get a product by id
  /// Return a [ProductModel] if success
  /// Return a string if error
  ///
  /// Example:
  /// ```dart
  /// final result = await productsHttpService.getProduct('1');
  /// result.fold(
  ///   (error) => print(error),
  ///   (product) => print(product),
  /// );
  /// ```
  Future<Either<String, ProductModel>> getProduct(String id) async {
    try {
      final uri = Uri.parse(baseUrl + endPointProducts + id);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final ProductModel products = productModelFromJson(response.body);
        return Right(products);
      } else {
        return Left('Error: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception - getProduct: $e');
    }
  }
}
