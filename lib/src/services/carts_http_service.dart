import 'package:dartz/dartz.dart';
import 'package:flutter_package_api_fake_store/src/global/global.dart';
import 'package:flutter_package_api_fake_store/src/models/cart_model.dart';
import 'package:flutter_package_api_fake_store/src/utils/index.dart';
import 'package:http/http.dart' as http;

class CartsHttpService {
  /// Get all carts from a user by id
  /// Return a list of [CartModel] if success
  /// Return a string if error
  ///
  /// Example:
  /// ```dart
  /// final result = await cartsHttpService.getCartByUser('1');
  /// result.fold(
  ///   (error) => print(error),
  ///   (carts) => print(carts),
  /// );
  /// ```
  Future<Either<String, List<CartModel>>> getCartByUser(String idUser) async {
    try {
      final uri = Uri.parse('$baseUrl$endPointCarts$endPointUser/$idUser');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final carts = CartModel.cartModelFromJson(response.body);
        return Right(carts);
      } else {
        return Left("Error!!! ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      return Left('Exception - getCartByUser: $e');
    }
  }

  /// Add a product to a cart
  /// Return a list of [CartModel] if success
  /// Return a string if error
  ///
  /// Example:
  /// ```dart
  /// final result = await cartsHttpService.addUpdateProductCart(idcart, cart);
  /// result.fold(
  ///   (error) => print(error),
  ///   (carts) => print(carts),
  /// );
  Future<Either<String, CartModel>> addUpdateProductCart(
      String idCart, CartModel cart) async {
    try {
      final uri = Uri.parse('$baseUrl$endPointCarts/$idCart');
      final response = await http.patch(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: CartModel.cartProductModelToJson(cart),
      );

      if (response.statusCode == 200) {
        final CartModel carts =
            CartModel.cartProductModelFromJson(response.body);
        return Right(carts);
      } else {
        return Left("Error!!! ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      return Left('Exception - addUpdateProductCart: $e');
    }
  }
}
