import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'expression/expression.dart';

import '../extensions.dart';
import 'expression/numeric_expression.dart';
import 'expression/text_expression.dart';
import 'paint_factory.dart';

typedef ColorZoomFunction = Color? Function(double zoom);
typedef TextHaloFunction = List<Shadow>? Function(EvaluationContext context);
typedef TextTransformFunction = String? Function(String? text);

class Style {
  final PaintStyle? fillPaint;
  final PaintStyle? linePaint;
  final PaintStyle? textPaint;
  final TextLayout? textLayout;
  final TextHaloFunction? textHalo;
  final PaintStyle? outlinePaint;

  Style(
      {this.fillPaint,
      this.outlinePaint,
      this.linePaint,
      this.textPaint,
      this.textLayout,
      this.textHalo});
}

class LayoutPlacement {
  final String name;
  const LayoutPlacement._(this.name);
  static const point = LayoutPlacement._('point');
  static const line = LayoutPlacement._('line');
  static const line_center = LayoutPlacement._('line-center');
  static const DEFAULT = point;

  static List<LayoutPlacement> values() => [point, line, line_center];
  static LayoutPlacement fromName(String? name) =>
      values().where((v) => v.name == name).firstOrNull() ?? DEFAULT;
}

class LayoutAnchor {
  final String name;
  const LayoutAnchor._(this.name);
  static const center = LayoutAnchor._('center');
  static const top = LayoutAnchor._('top');
  static const DEFAULT = center;

  static List<LayoutAnchor> values() => [center, top];
  static LayoutAnchor fromName(String? name) =>
      values().where((v) => v.name == name).firstOrNull() ?? DEFAULT;
}

class LayoutJustify {
  final String name;
  const LayoutJustify._(this.name);
  static const center = LayoutJustify._('center');
  static const left = LayoutJustify._('left');
  static const right = LayoutJustify._('right');
  static const auto = LayoutJustify._('auto');
  static const DEFAULT = center;

  static List<LayoutJustify> values() => [center, left, right, auto];
  static LayoutJustify fromName(String? name) =>
      values().where((v) => v.name == name).firstOrNull() ?? DEFAULT;
}

class TextLayout {
  final LayoutPlacementExpression placement;
  final LayoutAnchorExpression anchor;
  final LayoutJustifyExpression justify;
  final Expression text;
  final DoubleExpression textSize;
  final DoubleExpression? textLetterSpacing;
  final DoubleExpression? maxWidth;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final TextTransformFunction? textTransform;

  TextLayout(
      {required this.placement,
      required this.anchor,
      required this.justify,
      required this.text,
      required this.textSize,
      required this.textLetterSpacing,
      required this.maxWidth,
      required this.fontFamily,
      required this.fontStyle,
      required this.textTransform});
}
