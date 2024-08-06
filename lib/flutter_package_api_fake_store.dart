import 'package:flutter_package_api_fake_store/src/services/index.dart';
import 'package:flutter_package_api_fake_store/src/models/index.dart';
import 'package:flutter_package_api_fake_store/src/utils/index.dart';

export 'package:flutter_package_api_fake_store/src/utils/index.dart';
export 'package:flutter_package_api_fake_store/src/models/index.dart';

class FlutterPackageApiFakeStore {
  /// Login user by username and password
  /// Return a string token if success
  /// Return a string if error
  ///
  /// Example:
  /// ```dart
  /// final result = await authHttpService.login(AuthPostModel (username: 'admin', password: 'admin'));
  /// result.fold(
  ///   (error) => print(error),
  ///   (token) => print(token),
  /// );
  /// ```
  login(AuthPostModel userCredentials) {
    return AuthHttpService()
        .login(AuthPostModel(username: 'admin', password: 'admin'));
  }

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
  getCartByUser(String idUser) {
    return CartsHttpService().getCartByUser(idUser);
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
  addUpdateProductCart(String idCart, CartModel cart) {
    return CartsHttpService().addUpdateProductCart(idCart, cart);
  }

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
  getCategories() {
    return CategoriesHttpService().getCategories();
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
  getCategoryProducts(CategoryEnum category) {
    return CategoriesHttpService().getCategoryProducts(category);
  }

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
  getProducts() {
    return ProductsHttpService().getProducts();
  }

  /// Get a product by id
  /// Return a [ProductModel] if success
  /// Return a string if error
  ///
  /// Example:
  /// ```dart
  /// final result = await productsHttpService.getProduct(1);
  /// result.fold(
  ///   (error) => print(error),
  ///   (product) => print(product),
  /// );
  /// ```
  getProduct(int id) {
    return ProductsHttpService().getProduct(id);
  }

  /// Get user by id
  /// Return a [UserModel] if success
  /// Return a string if error
  ///
  /// Example:
  /// ```dart
  /// final result = await usersHttpService.getUser('1');
  /// result.fold(
  ///   (error) => print(error),
  ///   (user) => print(user),
  /// );
  /// ```
  getUser(int idUser) {
    return UsersHttpService().getUser(idUser);
  }

  /// Add new user
  /// Return a [UserModel] if success
  /// Return a string if error
  ///
  /// Example:
  /// ```dart
  /// final result = await usersHttpService.addUser(UserModel(
  ///   email: 'mail@mail.com'
  ///   username: 'user1',
  ///   password: '123456'
  ///   name: NameModel(
  ///     first: 'User',
  ///     last: 'One',
  ///   ),
  ///   address: AddressModel(
  ///     city: 'City 1',
  ///     street: 'Street 1',
  ///     number: 1,
  ///     zipcode: 'Zipcode 1',
  ///     geo: GeoModel(
  ///       lat: 'Lat 1',
  ///       long: 'Lng 1',
  ///     ),
  ///   ),
  ///   phone: 'Phone 1',
  /// ));
  /// result.fold(
  ///   (error) => print(error),
  ///   (user) => print(user),
  /// );
  /// ```
  addUser(UserModel user) {
    return UsersHttpService().addUser(user);
  }
}
