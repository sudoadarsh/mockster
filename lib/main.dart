import 'package:flutter/material.dart' show runApp;
import 'package:mockster/config/mockster_schema.dart';
import 'package:mockster/core/http_service/http_configuration.dart';
import 'package:mockster/core/http_service/http_service.dart';
import 'app.dart';
import 'app_injector.dart';

void main() {
  final HttpConfiguration configuration = HttpConfiguration();
  configuration.authority = "jsonplaceholder.typicode.com";
  configuration.defaultResponseSchema = MocksterSchema();
  HttpService().configure(configuration); // Configure the Http service.
  AppInjector(); // Inject all dependencies.
  runApp(const App());
}
