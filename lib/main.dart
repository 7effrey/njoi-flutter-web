import 'package:flutter/material.dart';
import 'package:flutter_njoi_web/presentation/widget/main_app.dart';
import 'package:flutter_njoi_web/presentation/configuration/configure_nonweb.dart'
  if (dart.library.html) 'package:flutter_njoi_web/presentation/configuration/configure_web.dart';

void main() {
  configureApp();
  runApp(MainApp());
}