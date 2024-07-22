import 'package:flutter/material.dart';
import 'package:flutter_package_api_fake_store/flutter_package_api_fake_store.dart';

class AddUpdateCartScreen extends StatefulWidget {
  const AddUpdateCartScreen({super.key});

  @override
  State<AddUpdateCartScreen> createState() => _AddUpdateCartScreenState();
}

class _AddUpdateCartScreenState extends State<AddUpdateCartScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _productIdController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final CartsHttpService cartsHttpService = CartsHttpService();
  String? _errorMessage;
  bool _isLoading = false;

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _errorMessage = null;
        _isLoading = true;
      });

      final productId = int.parse(_productIdController.text);
      final quantity = int.parse(_quantityController.text);

      // Assuming you have a method to add/update product in cart
      final result = await cartsHttpService.addUpdateProductCart(
          '1', // Assuming a static cart ID for simplicity
          CartModel(
            userId: 1, // Assuming a static user ID for simplicity
            date: DateTime.now(), // Assuming a static date for simplicity
            products: [
              ProductCartModel(
                productId: productId,
                quantity: quantity,
              ),
            ],
          ));

      result.fold(
        (error) => {
          setState(() {
            _errorMessage = error;
          })
        },
        (success) => {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Producto agregado/actualizado exitosamente')),
          )
        },
      );

      setState(() {
        _isLoading = false;
      });

      _productIdController.clear();
      _quantityController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar/Actualizar Producto en Carrito'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _productIdController,
                decoration: const InputDecoration(labelText: 'ID del producto'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el ID del producto';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor, ingrese un ID válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _quantityController,
                decoration: const InputDecoration(labelText: 'Cantidad'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la cantidad';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor, ingrese una cantidad válida';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _isLoading ? null : _submitForm,
                child: _isLoading
                    ? const SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          color: Colors.teal,
                        ),
                      )
                    : const Text('Agregar/Actualizar Producto'),
              ),
              if (_errorMessage != null) ...[
                const SizedBox(height: 16.0),
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
