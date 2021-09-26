import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase cubit, Change change) {
    print('onChange ---> ${cubit.runtimeType.toString()} $change');
    super.onChange(cubit, change);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print('onEvent ---> $bloc, event: $event ');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('onTransition ---> $bloc, transition: $transition ');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase cubit, Object error, StackTrace stacktrace) {
    print('onError ---> $cubit, transition: $error');
    super.onError(cubit, error, stacktrace);
  }

  @override
  void onClose(BlocBase cubit) {
    print('onClose ---> $cubit');
    super.onClose(cubit);
  }
}
