import 'dart:async';

import 'package:decimal/decimal.dart';
import 'package:sample/products/domain/repositories/product_repository.dart';

class FetchProducts {
  final ProductRepository _productsRepository;

  FetchProducts(this._productsRepository);

  Future<List<Product>> call() => _productsRepository.getProducts();
}

class Product {
  final String name;
  final String description;
  final String image;
  final Decimal price;

  Product(
      {required this.name,
      required this.description,
      required this.image,
      required this.price});
}
