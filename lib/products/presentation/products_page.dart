import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:provider/provider.dart';
import 'package:sample/products/domain/actions/fetch_products.dart';
import 'package:sample/products/infrastructure/in_memory_product_repository.dart';
import 'package:sample/products/presentation/products_page_view_model.dart';
import 'package:sample/products/presentation/single_product_page.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late ProductsPageViewModel _viewModel;

  @override
  void initState() {
    _viewModel =
        ProductsPageViewModel(FetchProducts(InMemoryProductRepository()));
    _viewModel.fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ChangeNotifierProvider.value(
        value: _viewModel,
        child: Consumer<ProductsPageViewModel>(
          builder: (BuildContext context, newViewModel, Widget? child) {
            return ListView.builder(
              itemCount: newViewModel.products.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.asset(newViewModel.products[index].image),
                  title: Text(newViewModel.products[index].name),
                  subtitle: Text(newViewModel.products[index].description),
                  trailing: Text(
                      newViewModel.products[index].price.toStringAsFixed(2)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleProductPage(
                            product: newViewModel.products[index]),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
