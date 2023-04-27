import 'package:flutter/foundation.dart';
import 'package:sample/products/domain/actions/fetch_products.dart';

class ProductsPageViewModel extends ChangeNotifier {
  final FetchProducts _fetchProducts;
  var products = List<Product>.empty();

  ProductsPageViewModel(this._fetchProducts);

  void fetchProducts() async {
    products = await _fetchProducts.call();
    notifyListeners();
  }
}
