import 'package:equatable/equatable.dart';

class TestState extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdatedTestState extends TestState {
  final int counter;

  UpdatedTestState(this.counter);

  @override
  List<Object> get props => [counter];

  @override
  String toString() {
    return counter.toString();
  }
}