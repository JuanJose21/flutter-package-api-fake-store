import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final VoidCallback? onTap;

  const CardProduct({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle:
            Text('\$$price', maxLines: 1, overflow: TextOverflow.ellipsis),
        leading: Image.network(
          image,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        onTap: onTap,
      ),
    );
  }
}
