import 'package:sample/products/domain/actions/fetch_products.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}