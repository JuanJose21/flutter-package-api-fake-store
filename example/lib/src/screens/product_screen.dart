import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final int productId;

  const ProductScreen({required this.productId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Obtener un producto'),
      ),
      body: const Center(
        child: Text('Pantalla de Obtener un producto'),
      ),
    );
  }
}
