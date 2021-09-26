import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdatedHomeState extends HomeState {
  final int counter;

  UpdatedHomeState(this.counter);

  @override
  List<Object> get props => [counter];

  @override
  String toString() {
    return counter.toString();
  }
}