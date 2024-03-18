import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.width,
    this.height,
    this.color,
    this.borderRadius,
    this.radius,
  });

  final double? width;
  final double? height;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 3.v,
      width: width ?? 60.h,
      decoration: BoxDecoration(
        color: color ?? const Color(0xff007c16),
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 100),
      ),
    );
  }
}
