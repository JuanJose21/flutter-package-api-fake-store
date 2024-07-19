import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  const CardCustom({
    super.key,
    required this.title,
    this.subtitle = '',
    this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ListTile(
        tileColor: Colors.grey[200],
        selectedColor: Colors.grey[300],
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis),
        onTap: onTap,
        trailing: IconButton(
          icon: const Icon(Icons.arrow_right),
          onPressed: onTap,
        ),
      ),
    );
  }
}
