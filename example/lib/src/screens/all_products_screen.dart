import 'package:example/src/screens/product_screen.dart';
import 'package:example/src/widgets/shared/card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package_api_fake_store/flutter_package_api_fake_store.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreen();
}

class _AllProductsScreen extends State<AllProductsScreen> {
  final FlutterPackageApiFakeStore flutterPackageApiFakeStore =
      FlutterPackageApiFakeStore();
  List<ProductModel> _productsItems = [];
  String? _errorMessage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchProductsItems();
  }

  void _fetchProductsItems() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final result = await flutterPackageApiFakeStore.getProducts();

    result.fold(
      (error) {
        setState(() {
          _errorMessage = error;
        });
      },
      (productsItems) {
        setState(() {
          _productsItems = productsItems;
        });
      },
    );

    setState(() {
      _isLoading = false;
    });
  }

  void redirectProductScreen(int productId) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProductScreen(productId: productId)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos los Productos'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _errorMessage != null
              ? Center(
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : _productsItems.isNotEmpty
                  ? ListView.builder(
                      itemCount: _productsItems.length,
                      itemBuilder: (context, index) {
                        final product = _productsItems[index];
                        return CardProduct(
                            title: product.title,
                            price: product.price.toString(),
                            image: product.image,
                            onTap: () => redirectProductScreen(product.id!));
                      },
                    )
                  : const Center(
                      child: Text('No hay productos en el carrito.'),
                    ),
    );
  }
}
