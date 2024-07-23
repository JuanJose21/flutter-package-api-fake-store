import 'package:flutter/material.dart';
import 'package:example/src/widgets/shared/card_custom.dart';
import 'package:example/src/widgets/shared/custom_app_bar.dart';
import 'package:example/src/screens/login_screen.dart';
import 'package:example/src/screens/cart_screen.dart';
import 'package:example/src/screens/add_product_screen.dart';
import 'package:example/src/screens/category_products_screen.dart';
import 'package:example/src/screens/all_products_screen.dart';
import 'package:example/src/screens/product_screen.dart';
import 'package:example/src/screens/user_screen.dart';
import 'package:example/src/screens/add_user_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Aplicación de ejemplo'),
      body: Center(
        child: ListView(
          children: _buildCardList(context),
        ),
      ),
    );
  }

  /// Generates a list of cards with the data of the screens to navigate
  List<Widget> _buildCardList(BuildContext context) {
    final List<Map<String, dynamic>> cardData = [
      {
        'title': 'Iniciar sesión',
        'subtitle': 'En esta pantalla podrás ver el token al iniciar sesión',
        'screen': const LoginScreen(),
      },
      {
        'title': 'Obtener carrito',
        'subtitle': 'En esta pantalla podrás ver el carrito de un usuario',
        'screen': const CartScreen(),
      },
      {
        'title': 'Agregar / Actualizar producto del carrito',
        'subtitle':
            'En esta pantalla podrás agregar o actualizar un producto del carrito',
        'screen': const AddUpdateCartScreen(),
      },
      {
        'title': 'Obtener productos de una categoría',
        'subtitle':
            'En esta pantalla podrás ver los productos de una categoría',
        'screen': const CategoryProductsScreen(),
      },
      {
        'title': 'Obtener todos los productos',
        'subtitle':
            'En esta pantalla podrás ver todos los productos de la tienda',
        'screen': const AllProductsScreen(),
      },
      {
        'title': 'Obtener un producto',
        'subtitle': 'En esta pantalla podrás ver un producto en específico',
        'screen': const ProductScreen(
          productId: 1,
        ),
      },
      {
        'title': 'Obtener un usuario',
        'subtitle': 'En esta pantalla podrás ver un usuario en específico',
        'screen': const UserScreen(),
      },
      {
        'title': 'Agregar un usuario',
        'subtitle': 'En esta pantalla podrás agregar un usuario a la tienda',
        'screen': const AddUserScreen(),
      },
    ];

    return cardData
        .map((data) => CardCustom(
              title: data['title']!,
              subtitle: data['subtitle']!,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => data['screen']),
              ),
            ))
        .toList();
  }
}
