import 'package:flutter/material.dart' show runApp;
import 'app.dart';
import 'app_injector.dart';

void main() {
  AppInjector(); // Inject all dependencies.
  runApp(const App());
}
