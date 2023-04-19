import 'package:flutter/material.dart';
import 'package:sample/products/presentation/products_page.dart';

class SingleProductPage extends StatelessWidget {
  final Product product;

  const SingleProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(product.name),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 16),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                Text(
                    '\$${product.price}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
              ]),
        ),
      );
  }
}