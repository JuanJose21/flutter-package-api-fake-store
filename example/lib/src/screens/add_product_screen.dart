import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar / Actualizar producto al carrito'),
      ),
      body: const Center(
        child: Text('Pantalla de Agregar / Actualizar producto al carrito'),
      ),
    );
  }
}
