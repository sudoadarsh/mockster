import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RootGap extends LeafRenderObjectWidget {
  const RootGap(this.gap, {super.key});

  /// The required gap.
  final double gap;

  @override
  RenderObject createRenderObject(BuildContext context) => RenderGap(gap);

  @override
  void updateRenderObject(BuildContext context, RenderGap renderObject) =>
      renderObject.gap = gap;
}

class RenderGap extends RenderBox {
  RenderGap(double gap) : _gap = gap;

  double get gap => _gap;
  double _gap;

  set gap(double value) {
    if (_gap != value) {
      _gap = value;
      markNeedsLayout();
    }
  }

  Axis? get _direction {
    final parentNode = parent;
    if (parentNode is RenderFlex) {
      return parentNode.direction;
    }
    return null;
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    return _computeIntrinsicExtent(
      Axis.horizontal,
          () => super.computeMinIntrinsicWidth(height),
    )!;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    return _computeIntrinsicExtent(
      Axis.horizontal,
          () => super.computeMaxIntrinsicWidth(height),
    )!;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    return _computeIntrinsicExtent(
      Axis.vertical,
          () => super.computeMinIntrinsicHeight(width),
    )!;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    return _computeIntrinsicExtent(
      Axis.vertical,
          () => super.computeMaxIntrinsicHeight(width),
    )!;
  }

  double? _computeIntrinsicExtent(Axis axis, double Function() compute) {
    final Axis? direction = _direction;
    if (direction == axis) {
      return _gap;
    }
    return compute();
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final Axis? direction = _direction;

    if (direction != null) {
      if (direction == Axis.horizontal) {
        return constraints.constrain(Size(gap, 0.0));
      } else {
        return constraints.constrain(Size(0.0, gap));
      }
    } else {
      throw FlutterError(
        'A Gap widget must be placed directly inside a Flex widget ',
      );
    }
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('mainAxisExtent', gap));
  }
}