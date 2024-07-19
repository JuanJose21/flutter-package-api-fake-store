library flutter_package_api_fake_store;

import 'package:flutter_package_api_fake_store/src/services/index.dart';

/// A PackageApiFakeStore.
class PackageApiFakeStore {
  /// get all products data from the API
  void getProductsData() async {
    ProductsHttpService productsHttpService = ProductsHttpService();
    final products = await productsHttpService.getProducts();

    products.fold(
      (error) {
        return ("Ha ocurrido un error: $error");
      },
      (productsResult) {
        // Si la llamada es exitosa, se imprimen los detalles de cada producto.
        return productsResult;
      },
    );
  }
}
