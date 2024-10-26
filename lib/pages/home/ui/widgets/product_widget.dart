import 'package:flutter/material.dart';
import 'package:ui_example/core/model/product_model.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: product.thumbnail != null
            ? Image.network(product.thumbnail!)
            : null,
        title: Text(
          product.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
              label: Text('Price: \$${product.price}'),
            ),
          ],
        ),
      ),
    );
  }
}
