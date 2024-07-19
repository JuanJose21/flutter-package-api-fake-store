import 'package:example/src/widgets/shared/card_custom.dart';
import 'package:example/src/widgets/shared/custom_app_bar.dart';
import 'package:flutter/material.dart';

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
          children: [
            CardCustom(
              title: 'Iniciar sesión',
              subtitle:
                  'En esta pantalla podrás ver el token al iniciar sesión',
              onTap: () => (),
            ),
            CardCustom(
              title: 'Obtener carrito',
              subtitle: 'En esta pantalla podrás ver el carrito de un usuario',
              onTap: () => (),
            ),
            CardCustom(
              title: 'Agregar / Actualizar producto al carrito',
              subtitle:
                  'En esta pantalla podrás agregar o actualizar un producto del carrito',
              onTap: () => (),
            ),
            CardCustom(
              title: 'Obtener productos de una categoría',
              subtitle:
                  'En esta pantalla podrás ver los productos de una categoría',
              onTap: () => (),
            ),
            CardCustom(
              title: 'Obtener todos los productos',
              subtitle:
                  'En esta pantalla podrás ver todos los productos de la tienda',
              onTap: () => (),
            ),
            CardCustom(
              title: 'Obtener un producto',
              subtitle: 'En esta pantalla podrás ver un producto en específico',
              onTap: () => (),
            ),
            CardCustom(
              title: 'Obtener un usuario',
              subtitle: 'En esta pantalla podrás ver un usuario en específico',
              onTap: () => (),
            ),
            CardCustom(
              title: 'Agregar un usuario',
              subtitle:
                  'En esta pantalla podrás agregar un usuario a la tienda',
              onTap: () => (),
            ),
          ],
        ),
      ),
    );
  }
}
