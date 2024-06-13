import "package:flutter/material.dart";

class RootScaffold extends StatelessWidget {
  const RootScaffold({
    super.key,
    this.padding = const EdgeInsets.all(20.0),
    this.backgroundColor,
    this.appBar,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
  });

  /// The padding.
  final EdgeInsets padding;

  /// The scaffold background color.
  final Color? backgroundColor;

  /// The AppBar.
  final PreferredSizeWidget? appBar;

  /// The body.
  final Widget body;

  /// The floating action button.
  final Widget? floatingActionButton;

  /// The bottom navigation bar.
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      body: SafeArea(child: Padding(padding: padding, child: body)),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
