import 'package:flutter/material.dart';
import 'package:flutter_njoi_web/core/common/environment.dart';
import 'package:flutter_njoi_web/core/common/util/app_bloc_observer.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> configureServiceLocator(Environment env, BuildContext context) async {
  // Injection is happening on didChangeDependencies in MainApp, so every time state from InheritedWidget changes
  // it will trigger the injection again. It show warning message because it has been injected before
  if (sl.isRegistered<AppBlocObserver>()) {
    return;
  }

  sl.registerSingleton(AppBlocObserver());
}