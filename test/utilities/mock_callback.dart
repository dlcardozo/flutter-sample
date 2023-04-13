import 'package:mockito/mockito.dart';

class MockCallback extends Mock {
  void call();
}

class MockCallbackWithParam<T> extends Mock {
  void call(T param);
}

abstract class FutureCallbackWithParam<T, R> {
  Future<R> call(T arg);
}

abstract class StringCallback {
  String call();
}

