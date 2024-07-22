import 'package:flutter/material.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Obtener todos los productos'),
      ),
      body: const Center(
        child: Text('Pantalla de Obtener todos los productos'),
      ),
    );
  }
}
