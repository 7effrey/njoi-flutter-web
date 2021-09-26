import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_njoi_web/core/common/dev_environment.dart';
import 'package:flutter_njoi_web/core/common/util/app_bloc_observer.dart';
import 'package:flutter_njoi_web/core/di/service_locator.dart';
import 'package:flutter_njoi_web/presentation/app_routes.dart';
import 'package:flutter_njoi_web/presentation/bloc/home/home_cubit.dart';
import 'package:flutter_njoi_web/presentation/bloc/test/test_cubit.dart';
import 'package:flutter_njoi_web/presentation/widget/home/home_screen.dart';
import 'package:flutter_njoi_web/presentation/widget/test/test_screen.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();

}

class _MainAppState extends State<MainApp> {
  @override
  void didChangeDependencies() {
    configureServiceLocator(DevEnvironment(), context);
    Bloc.observer = sl<AppBlocObserver>();
    super.didChangeDependencies();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // builder: (context, widget) => MediaQuery(
      //   data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      //   child: ResponsiveWrapper.builder(
      //       BouncingScrollWrapper.builder(context, widget!),
      //       maxWidth: 1280,
      //       minWidth: 480,
      //       defaultScale: true,
      //       breakpoints: [
      //         ResponsiveBreakpoint.resize(480, name: MOBILE),
      //         ResponsiveBreakpoint.autoScale(800, name: TABLET),
      //         ResponsiveBreakpoint.resize(1000, name: DESKTOP),
      //       ],
      //       background: Container(color: Color(0xFFFFFFFF))),
      //       // background: Container(color: Color(0xFF000000))),
      // ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(create: (_) => HomeCubit(0)),
          BlocProvider<TestCubit>(create: (_) => TestCubit(0)),
        ],
        // child: HomeScreen(title: 'Flutter Demo Home Page'),
        child: TestScreen(title: 'Flutter Demo Home Page'),
      ),
      onGenerateRoute: (RouteSettings setting) {
        return AppRoutes.generateRoute(setting, context);
      },
    );
  }

}