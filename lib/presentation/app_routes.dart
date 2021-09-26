import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_njoi_web/presentation/bloc/home/home_cubit.dart';
import 'package:flutter_njoi_web/presentation/bloc/test/test_cubit.dart';
import 'package:flutter_njoi_web/presentation/widget/home/home_screen.dart';
import 'package:flutter_njoi_web/core/app_path.dart' as app_path;
import 'package:flutter_njoi_web/presentation/widget/test/test_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings,
      BuildContext context) {
    switch (routeSettings.name) {
      case app_path.home:
        return MaterialPageRoute<HomeScreen>(
          builder: (context) =>
              BlocProvider(
                create: (context) => HomeCubit(0),
                child: HomeScreen(title: 'Flutter Demo - App Routes - Home'),
              ),
        );
      case app_path.test:
        return MaterialPageRoute<TestScreen>(
          builder: (context) =>
              BlocProvider(
                create: (context) => TestCubit(0),
                child: TestScreen(title: 'Flutter Demo - App Routes - Test'),
              ),
        );
      default:
        return MaterialPageRoute<Scaffold>(
          builder: (_) =>
              Scaffold(
                body: Center(
                  child:
                    Text('No route defined for ${routeSettings.name}')
                ),
              ));
    }
  }
}