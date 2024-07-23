import 'package:flutter/material.dart';
import 'package:flutter_package_api_fake_store/flutter_package_api_fake_store.dart';

class CategoryProductsScreen extends StatefulWidget {
  const CategoryProductsScreen({super.key});

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreen();
}

class _CategoryProductsScreen extends State<CategoryProductsScreen> {
  final CategoriesHttpService categoriesHttpService = CategoriesHttpService();
  List<ProductModel> _categoryItems = [];
  String? _errorMessage;
  bool _isLoading = false;
  final category = CategoryEnum.electronics; // This category is example

  @override
  void initState() {
    super.initState();
    _fetchCategoryItems();
  }

  void _fetchCategoryItems() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final result = await categoriesHttpService.getCategoryProducts(category);

    result.fold(
      (error) {
        setState(() {
          _errorMessage = error;
        });
      },
      (categoryItems) {
        setState(() {
          _categoryItems = categoryItems;
        });
      },
    );

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos de "${categoryValues.reverse[category]}"'),
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
              : _categoryItems.isNotEmpty
                  ? ListView.builder(
                      itemCount: _categoryItems.length,
                      itemBuilder: (context, index) {
                        final product = _categoryItems[index];
                        return Card(
                          child: ListTile(
                            title: Text(product.title),
                            subtitle: Text('\$${product.price.toString()}'),
                            leading: Image.network(
                              product.image,
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text('No hay productos en el carrito.'),
                    ),
    );
  }
}
