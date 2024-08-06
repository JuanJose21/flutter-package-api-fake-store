import 'package:flutter_package_api_fake_store/src/services/index.dart';
import 'package:flutter_package_api_fake_store/src/models/index.dart';
import 'package:flutter_package_api_fake_store/src/utils/index.dart';

export 'package:flutter_package_api_fake_store/src/utils/index.dart';
export 'package:flutter_package_api_fake_store/src/models/index.dart';

class FlutterPackageApiFakeStore {
  login(AuthPostModel userCredentials) {
    return AuthHttpService()
        .login(AuthPostModel(username: 'admin', password: 'admin'));
  }

  getCartByUser(String idUser) {
    return CartsHttpService().getCartByUser(idUser);
  }

  addUpdateProductCart(String idCart, CartModel cart) {
    return CartsHttpService().addUpdateProductCart(idCart, cart);
  }

  getCategories() {
    return CategoriesHttpService().getCategories();
  }

  getCategoryProducts(CategoryEnum category) {
    return CategoriesHttpService().getCategoryProducts(category);
  }

  getProducts() {
    return ProductsHttpService().getProducts();
  }

  getProduct(int id) {
    return ProductsHttpService().getProduct(id);
  }

  getUser(int idUser) {
    return UsersHttpService().getUser(idUser);
  }

  addUser(UserModel user) {
    return UsersHttpService().addUser(user);
  }
}
