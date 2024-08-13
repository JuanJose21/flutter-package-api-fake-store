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

#### Autenticación de Usuario

```dart
final resultLogin = await flutterPackageApiFakeStore.login(AuthPostModel(
  username: 'user1',
  password: '123456',
));
resultLogin.fold(
  (error) => print(error),
  (token) => print(token),
);
```

- **Error**: Retorna un `String` que describe el error durante la autenticación, como credenciales inválidas o un fallo de conexión.
- **Success**: Retorna un `String` que contiene el token de autenticación, el cual puede ser utilizado para realizar otras solicitudes autorizadas en la API.

#### Obtener el carrito según el ID del usuario

```dart
final resultCartByUser = await flutterPackageApiFakeStore.getCartByUser('1');
resultCartByUser.fold(
  (error) => print(error),
  (carts) => carts.forEach((element) {
    print(element);
  }),
);
```

- **Error**: Retorna un `String` que describe el error durante la consulta del carrito.
- **Success**: Retorna una lista de CartModel.

#### Agregar un producto al carrito

```dart
final resultAddUpdateProduct =
    await flutterPackageApiFakeStore.addUpdateProductCart(
        '1', CartModel(products: [], date: DateTime.now(), id: 1, userId: 1));
resultAddUpdateProduct.fold(
  (error) => print(error),
  (carts) => print(carts),
);
```

- **Error**: Retorna un `String` que describe el error durante la consulta.
- **Success**: Retorna una lista de CartModel

#### Obtener todas las categorias

```dart
final resultCategories = await flutterPackageApiFakeStore.getCategories();
resultCategories.fold(
  (error) => print(error),
  (categories) => categories.forEach((element) {
    print(element);
  }),
);
```

- **Error**: Retorna un `String` que describe el error durante la consulta.
- **Success**: Retorna una lista de CategoryModel

#### Obtener todos los productos de una categoria

```dart
final resultProductCategory = await flutterPackageApiFakeStore
    .getCategoryProducts(CategoryEnum.electronics);
resultProductCategory.fold(
  (error) => print(error),
  (products) => products.forEach((element) {
    print(element);
  }),
);
```

- **Error**: Retorna un `String` que describe el error durante la consulta.
- **Success**: Retorna una lista de ProductModel

#### Obtener todos los productos

```dart
final resultProducts = await flutterPackageApiFakeStore.getProducts();
resultProducts.fold(
  (error) => print(error),
  (products) => products.forEach((element) {
    print(element);
  }),
);
```

- **Error**: Retorna un `String` que describe el error durante la consulta.
- **Success**: Retorna una lista de ProductModel

#### Obtener la información de un producto

```dart
final resultProduct = await flutterPackageApiFakeStore.getProduct(1);
resultProduct.fold(
  (error) => print(error),
  (product) => print(product),
);
```

- **Error**: Retorna un `String` que describe el error durante la consulta.
- **Success**: Retorna la información del producto en ProductModel

#### Obtener la información de un usuario

```dart
final resultUser = await flutterPackageApiFakeStore.getUser(1);
resultUser.fold(
  (error) => print(error),
  (user) => print(user),
);
```

- **Error**: Retorna un `String` que describe el error durante la consulta.
- **Success**: Retorna la información del usuario en UserModel

#### Agregar un usuario

```dart
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
```

- **Error**: Retorna un `String` que describe el error durante el registro.
- **Success**: Retorna UserModel como respuesta

## Contribución

Las contribuciones son bienvenidas. Por favor, abre un issue o un pull request si encuentras algún problema o si deseas mejorar este paquete.

## Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.
