import 'package:flutter/material.dart';
import 'package:sample/users/domain/actions/register.dart';

class RegisterPageViewModel with ChangeNotifier {
  late Register register;

  RegisterPageViewModel(this.register);

  void validateEmail(String email) {
    register(email);
  }
}