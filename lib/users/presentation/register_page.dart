import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/users/presentation/register_page_view_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterPageViewModel _viewModel;

  @override
  void initState() {
    _viewModel = RegisterPageViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Wrap(
        children: [
          ChangeNotifierProvider.value(
            value: _viewModel,
            child: Consumer<RegisterPageViewModel>(
              builder: (BuildContext context, viewModel, Widget? child) {
                return const Placeholder();
              },
            ),
          ),
        ],
      ),
    );
  }
}
