import 'package:flutter_package_api_fake_store/flutter_package_api_fake_store.dart';

void main() async {
  final FlutterPackageApiFakeStore flutterPackageApiFakeStore =
      FlutterPackageApiFakeStore();

  // Login user by username and password
  // Return a string token if success
  // Return a string if error
  final resultLogin = await flutterPackageApiFakeStore.login(AuthPostModel(
    username: 'user1',
    password: '123456',
  ));
  resultLogin.fold(
    (error) => print(error),
    (token) => print(token),
  );

  // Get all carts from a user by id
  // Return a list of [CartModel] if success
  // Return a string if error
  final resultCartByUser = await flutterPackageApiFakeStore.getCartByUser('1');
  resultCartByUser.fold(
    (error) => print(error),
    (carts) => carts.forEach((element) {
      print(element);
    }),
  );

  // Add a product to a cart
  // Return a list of [CartModel] if success
  // Return a string if error
  final resultAddUpdateProduct =
      await flutterPackageApiFakeStore.addUpdateProductCart(
          '1', CartModel(products: [], date: DateTime.now(), id: 1, userId: 1));
  resultAddUpdateProduct.fold(
    (error) => print(error),
    (carts) => print(carts),
  );

  // Get all categories
  // Return a list of [CategoryModel] if success
  // Return a string if error
  final resultCategories = await flutterPackageApiFakeStore.getCategories();
  resultCategories.fold(
    (error) => print(error),
    (categories) => categories.forEach((element) {
      print(element);
    }),
  );

  // Get all products from a category
  // Return a list of [ProductModel] if success
  // Return a string if error
  final resultProductCategory = await flutterPackageApiFakeStore
      .getCategoryProducts(CategoryEnum.electronics);
  resultProductCategory.fold(
    (error) => print(error),
    (products) => products.forEach((element) {
      print(element);
    }),
  );

  final resultProducts = await flutterPackageApiFakeStore.getProducts();
  resultProducts.fold(
    (error) => print(error),
    (products) => products.forEach((element) {
      print(element);
    }),
  );

  // Get a product by id
  // Return a [ProductModel] if success
  // Return a string if error
  final resultProduct = await flutterPackageApiFakeStore.getProduct(1);
  resultProduct.fold(
    (error) => print(error),
    (product) => print(product),
  );

  // Get a user by id
  // Return a [UserModel] if success
  // Return a string if error
  final resultUser = await flutterPackageApiFakeStore.getUser(1);
  resultUser.fold(
    (error) => print(error),
    (user) => print(user),
  );

  // Add a user
  // Return a [UserModel] if success
  // Return a string if error
  final result = await flutterPackageApiFakeStore.addUser(UserModel(
    email: 'mail@mail.com',
    username: 'user1',
    password: '123456',
    name: NameModel(
      firstname: 'User',
      lastname: 'One',
    ),
    address: AddressModel(
      city: 'City 1',
      street: 'Street 1',
      number: 1,
      zipcode: 'Zipcode 1',
      geolocation: GeolocationModel(
        lat: 'Lat 1',
        long: 'Lng 1',
      ),
    ),
    phone: 'Phone 1',
  ));
  result.fold(
    (error) => print(error),
    (user) => print(user),
  );
}
