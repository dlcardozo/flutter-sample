import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sample/users/domain/actions/register.dart';
import 'package:sample/users/presentation/register_page_view_model.dart';

import 'register_page_view_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Register>()])
void main() {
  late Register register;
  late RegisterPageViewModel viewmodel;

  setUp(() {
    register = MockRegister();
    viewmodel = RegisterPageViewModel(register);
  });

  test('call register on validate email', () {
    viewmodel.validateEmail("Some email");
    verify(register.call("Some email")).called(1);
  });
}
