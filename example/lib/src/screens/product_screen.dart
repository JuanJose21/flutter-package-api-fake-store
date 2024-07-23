import 'package:flutter/material.dart';
import 'package:flutter_package_api_fake_store/flutter_package_api_fake_store.dart';

class ProductScreen extends StatelessWidget {
  final ProductModel product;

  const ProductScreen({required this.product, super.key});

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
