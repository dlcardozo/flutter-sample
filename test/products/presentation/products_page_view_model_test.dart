import 'package:decimal/decimal.dart';
import 'package:fake_async/fake_async.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sample/products/domain/actions/fetch_products.dart';
import 'package:sample/products/presentation/products_page_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utilities/mock_callback.dart';
import 'products_page_view_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FetchProducts>()])
void main() {
  test("call fetch products on fetchProducts", () {
    var fetchProducts = MockFetchProducts();
    var viewModel = ProductsPageViewModel(fetchProducts);

    viewModel.fetchProducts();

    verify(fetchProducts.call()).called(1);
  });

  test("update products on fetchProducts", () {
    var fetchProducts = MockFetchProducts();

    var product = Product(
        name: "name", description: "", image: "", price: Decimal.fromInt(0));
    when(fetchProducts.call()).thenAnswer((_) => Future.value([product]));

    var viewModel = ProductsPageViewModel(fetchProducts);

    fakeAsync((async) {
      viewModel.fetchProducts();
      async.flushMicrotasks();
      expect(viewModel.products[0], product);
    });
  });

  test("notify on fetchProducts", () {
    var fetchProducts = MockFetchProducts();
    var notifier = MockCallback();

    var viewModel = ProductsPageViewModel(fetchProducts);

    viewModel.addListener(notifier);

    fakeAsync((async) {
      viewModel.fetchProducts();
      async.flushMicrotasks();
      verify(notifier()).called(1);
    });
  });
}
