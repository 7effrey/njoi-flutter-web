import 'package:bloc/bloc.dart';
import 'package:flutter_njoi_web/presentation/bloc/test/test_state.dart';

class TestCubit extends Cubit<TestState> {
  int _counter;

  TestCubit(this._counter) : super(UpdatedTestState(_counter));

  increment() {
    _counter++;
    emit(UpdatedTestState(_counter));
  }

  decrement() {
    _counter--;
    emit(UpdatedTestState(_counter));
  }
}