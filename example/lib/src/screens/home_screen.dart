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
      appBar: const CustomAppBar(title: 'Aplicación de ejemplo!'),
      body: Center(
        child: Column(
          children: [
            CardCustom(
              title: 'Hola!',
              subtitle: 'Descripción!!!!!',
              onTap: () => (),
            )
          ],
        ),
      ),
    );
  }
}
