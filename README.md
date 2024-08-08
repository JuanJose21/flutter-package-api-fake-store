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

- **Error**: Retorna un `String` que describe el error ocurrido, por ejemplo, un fallo en la conexión o un problema al decodificar la respuesta.
- **Success**: Retorna una lista de `ProductModel` que contiene la información de los productos disponibles.

#### Agregar un Producto al Carrito

```dart
final cartService = CartsHttpService();
final result = await cartService.addUpdateProductCart(idcart, cart);
result.fold(
  (error) => print("Error: $error"),
  (success) => print("Producto agregado al carrito: $success"),
);
```

- **Error**: Retorna un `String` que describe el error ocurrido durante la operación de agregar o actualizar el producto en el carrito.
- **Success**: Retorna un `CartModel`, que representa el estado actualizado del carrito después de la operación.

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

- **Error**: Retorna un `String` que describe el error durante la autenticación, como credenciales inválidas o un fallo de conexión.
- **Success**: Retorna un `String` que contiene el token de autenticación, el cual puede ser utilizado para realizar otras solicitudes autorizadas en la API.

## Ejemplos Adicionales

Consulta la carpeta [example](example) para obtener más ejemplos sobre cómo usar este paquete.

## Contribución

Las contribuciones son bienvenidas. Por favor, abre un issue o un pull request si encuentras algún problema o si deseas mejorar este paquete.

## Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.
