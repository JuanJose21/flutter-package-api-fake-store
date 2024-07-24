# flutter_package_api_fake_store

`flutter_package_api_fake_store` es un paquete de Flutter para interactuar con el API de [fakestoreapi](https://fakestoreapi.com/), permitiendo obtener productos, gestionar carritos y usuarios, y mucho más.

## Características

- **Obtener productos**: Lista de productos disponibles en la tienda.
- **Gestionar carritos**: Añadir, actualizar y eliminar productos en carritos de compra.
- **Manejo de usuarios**: Autenticación y gestión de usuarios.

## Requisitos

- Flutter: Versión `3.22.2`
- Dart: Versión `3.4.3`

## Instalación

Agrega el paquete a tu archivo `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_package_api_fake_store: 0.0.1
```

Luego, instala las dependencias ejecutando:

```bash
flutter pub get
```

## Uso

### Ejemplo Rápido

```dart
import 'package:flutter/material.dart';
import 'package:flutter_package_api_fake_store/flutter_package_api_fake_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Store API Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fake Store API Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final products = await getProducts();
            print(products);
          },
          child: Text('Fetch Products'),
        ),
      ),
    );
  }

  Future<List<ProductModel>> getProducts() async {
    final productsService = ProductsHttpService();
    final result = await productsService.getProducts();
    return result.fold((error) => [], (products) => products);
  }
}
```

### Funcionalidades Detalladas

#### Obtener Productos

```dart
final productsService = ProductsHttpService();
final result = await productsService.getProducts();
result.fold(
  (error) => print("Error: $error"),
  (products) => print("Productos: $products"),
);
```

#### Agregar un Producto al Carrito

```dart
final cartService = CartsHttpService();
final result = await cartService.addUpdateProductCart(idcart, cart);
result.fold(
  (error) => print("Error: $error"),
  (success) => print("Producto agregado al carrito: $success"),
);
```

#### Autenticación de Usuario

```dart
final authService = AuthHttpService();
final result = await authService.login(
  AuthPostModel(username: 'user', password: 'password')
);
result.fold(
  (error) => print("Error: $error"),
  (token) => print("Token: $token"),
);
```

## Ejemplos Adicionales

Consulta la carpeta [example](example) para obtener más ejemplos sobre cómo usar este paquete.

## Contribución

Las contribuciones son bienvenidas. Por favor, abre un issue o un pull request si encuentras algún problema o si deseas mejorar este paquete.

## Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.
