import "package:flutter/material.dart";

typedef _SingleTicker = SingleTickerProviderStateMixin<RootFadeIn>;

class RootFadeIn extends StatefulWidget {
  const RootFadeIn({
    super.key,
    this.duration = const Duration(milliseconds: 800),
    required this.child,
  });

  /// The duration.
  final Duration duration;

  /// The child.
  final Widget child;

  @override
  State<RootFadeIn> createState() => _RootFadeInState();
}

class _RootFadeInState extends State<RootFadeIn> with _SingleTicker {
  /// The animation controller.
  late final AnimationController controller;

  /// The animation object.
  late final Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: widget.duration);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant RootFadeIn oldWidget) {
    if (widget.key == oldWidget.key) return;
    controller.reset();
    controller.forward();

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: animation, child: widget.child);
  }
}
