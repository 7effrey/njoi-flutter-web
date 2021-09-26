import 'package:bloc/bloc.dart';
import 'package:flutter_njoi_web/presentation/bloc/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  int _counter;

  HomeCubit(this._counter) : super(UpdatedHomeState(_counter));

  increment() {
    _counter++;
    emit(UpdatedHomeState(_counter));
  }

  decrement() {
    _counter--;
    emit(UpdatedHomeState(_counter));
  }
}