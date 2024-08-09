import 'package:example/src/screens/product_screen.dart';
import 'package:example/src/widgets/shared/card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package_api_fake_store/flutter_package_api_fake_store.dart';

class CategoryProductsScreen extends StatefulWidget {
  const CategoryProductsScreen({super.key});

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreen();
}

class _CategoryProductsScreen extends State<CategoryProductsScreen> {
  final FlutterPackageApiFakeStore flutterPackageApiFakeStore =
      FlutterPackageApiFakeStore();
  List<ProductModel> _categoryItems = [];
  List<String> _categories = [];
  String? _errorMessage;
  bool _isLoading = false;
  final category = CategoryEnum.electronics; // This category is example

  @override
  void initState() {
    super.initState();
    _fetchCategoryItems();
    _fetchCategories();
  }

  void _fetchCategories() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final result = await flutterPackageApiFakeStore.getCategories();

    result.fold(
      (error) {
        setState(() {
          _errorMessage = error;
        });
      },
      (categories) {
        setState(() {
          _categories = categories;
        });
      },
    );

    setState(() {
      _isLoading = false;
    });
  }

  void _fetchCategoryItems() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final result =
        await flutterPackageApiFakeStore.getCategoryProducts(category);

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
                  ? Column(children: [
                      Flexible(
                        child: ListView.builder(
                          itemCount: _categories.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${_categories[index]} - ${categoryValues.map[_categories[index]]}",
                                style: const TextStyle(fontSize: 18),
                              ),
                            );
                          },
                        ),
                      ),
                      Flexible(
                          child: ListView.builder(
                        itemCount: _categoryItems.length,
                        itemBuilder: (context, index) {
                          final product = _categoryItems[index];
                          return CardProduct(
                            title: product.title,
                            price: product.price.toString(),
                            image: product.image,
                            onTap: () => redirectProductScreen(product.id!),
                          );
                        },
                      ))
                    ])
                  : const Center(
                      child: Text('No hay productos en el carrito.'),
                    ),
    );
  }
}
