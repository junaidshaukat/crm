import 'package:flutter/material.dart';
import '/core/app_export.dart';

class NoRecordFound extends StatelessWidget {
  const NoRecordFound({
    super.key,
    this.width = double.maxFinite,
    this.height = 144,
    this.size = 32,
    this.imagePath,
    this.boxFit = BoxFit.contain,
    this.fit = BoxFit.contain,
  });

  final double width;
  final double height;
  final double size;
  final String? imagePath;
  final BoxFit fit, boxFit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        fit: fit,
        child: CustomImageView(
          width: size,
          height: size,
          fit: fit,
          imagePath: imagePath ?? "empty".image.png,
        ),
      ),
    );
  }
}
