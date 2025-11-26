import 'package:flutter/material.dart';
import 'package:practice/feature/product_page/data/models/product_model.dart';
import 'product_item.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductModel> products;
  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: products.length,
      itemBuilder: (_, i) => ProductItem(product: products[i]),
    );
  }
}
