import 'package:flutter/material.dart';

class WidgetContainerGradient extends StatelessWidget {
  const WidgetContainerGradient({
    Key? key,
    this.width,
    required this.colors,
    required this.child,
    this.borderRadius,
    this.padding,
    this.boxShadow,
    this.begin,
    this.end,
    this.height,
  }) : super(key: key);
  final double? width;
  final List<Color> colors;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final Widget child;
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: boxShadow,
          gradient: LinearGradient(
            begin: begin ?? Alignment.centerLeft,
            end: end ?? Alignment.centerRight,
            colors: colors,
          ),
        ),
        child: child);
  }
}
