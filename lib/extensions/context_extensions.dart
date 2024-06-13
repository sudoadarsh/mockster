import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  /// Access the color scheme.
  ColorScheme get color => Theme.of(this).colorScheme;

  /// Access the text theme.
  TextTheme get text => Theme.of(this).textTheme;
}
