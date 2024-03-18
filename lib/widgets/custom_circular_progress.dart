import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({
    super.key,
    this.height = 24.0,
    this.width = 24.0,
    this.colorAnimation = const Color(0XFF007C16),
    this.strokeWidth = 2,
    this.value,
    this.backgroundColor,
    this.valueColor,
    this.strokeAlign = 0,
    this.semanticsLabel,
    this.semanticsValue,
    this.strokeCap,
  });

  final double height;
  final double width;
  final Color colorAnimation;
  final double strokeWidth;
  final double? value;
  final Color? backgroundColor;
  final Animation<Color?>? valueColor;
  final double strokeAlign;
  final String? semanticsLabel;
  final String? semanticsValue;
  final StrokeCap? strokeCap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: CircularProgressIndicator.adaptive(
          value: value,
          backgroundColor: backgroundColor,
          valueColor:
              valueColor ?? AlwaysStoppedAnimation<Color>(colorAnimation),
          strokeWidth: strokeWidth,
          strokeAlign: strokeAlign,
          semanticsLabel: semanticsLabel,
          semanticsValue: semanticsValue,
          strokeCap: strokeCap,
        ),
      ),
    );
  }
}
