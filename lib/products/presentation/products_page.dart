import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:sample/products/presentation/single_product_page.dart';

class ProductsPage extends StatefulWidget {
  final List<Product> products = [
    Product(name: 'Product 1', description: 'Description', image: 'images/goteros.jpeg', price: Decimal.fromInt(100)),
    Product(name: 'Product 2', description: 'Description', image: 'images/perfume.jpeg', price: Decimal.fromInt(75)),
    Product(name: 'Product 3', description: 'Description', image: 'images/minifrasco.jpeg', price: Decimal.fromInt(50)),
    Product(name: 'Product 4', description: 'Description', image: 'images/perfume.jpeg', price: Decimal.fromInt(120)),
    Product(name: 'Product 5', description: 'Description', image: 'images/goteros.jpeg', price: Decimal.fromInt(99)),
  ];

  ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.asset(widget.products[index].image),
            title: Text(widget.products[index].name),
            subtitle: Text(widget.products[index].description),
            trailing: Text(widget.products[index].price.toStringAsFixed(2)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SingleProductPage(product: widget.products[index])),
              );
            },
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final String image;
  final Decimal price;

  Product({required this.name, required this.description, required this.image, required this.price});
}
