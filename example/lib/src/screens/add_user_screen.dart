import 'package:flutter/material.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar un usuario'),
      ),
      body: const Center(
        child: Text('Pantalla de Agregar un usuario'),
      ),
    );
  }
}
