import 'package:flutter/material.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Obtener productos de una categoría'),
      ),
      body: const Center(
        child: Text('Pantalla de Obtener productos de una categoría'),
      ),
    );
  }
}
