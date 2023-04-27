import 'package:decimal/decimal.dart';
import 'package:sample/products/domain/actions/fetch_products.dart';
import 'package:sample/products/domain/repositories/product_repository.dart';

class InMemoryProductRepository implements ProductRepository{
  @override
  Future<List<Product>> getProducts() {
    return Future.value([
      Product(name: 'Product 1', description: 'Description', image: 'images/goteros.jpeg', price: Decimal.fromInt(100)),
      Product(name: 'Product 123123', description: 'Description', image: 'images/perfume.jpeg', price: Decimal.fromInt(75)),
      Product(name: 'Product 323232', description: 'Description', image: 'images/minifrasco.jpeg', price: Decimal.fromInt(50)),
      Product(name: 'Product 4', description: 'Description', image: 'images/perfume.jpeg', price: Decimal.fromInt(120)),
      Product(name: 'Product 5', description: 'Description', image: 'images/goteros.jpeg', price: Decimal.fromInt(99)),
    ]);
  }

}