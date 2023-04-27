
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sample/products/domain/actions/fetch_products.dart';
import 'package:sample/products/domain/repositories/product_repository.dart';

import 'fetch_products_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ProductRepository>()])
void main() {
  test("get products", () async {
    ProductRepository repository = MockProductRepository();
    var action = FetchProducts(repository);

    await action.call();

    verify(repository.getProducts()).called(1);
  });
}

