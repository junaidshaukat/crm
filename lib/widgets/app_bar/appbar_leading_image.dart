import '/core/app_export.dart';
import 'package:flutter/material.dart';

class AppbarLeadingImage extends StatelessWidget {
  const AppbarLeadingImage({
    super.key,
    this.imagePath,
    this.margin,
    this.onTap,
    this.svgColor,
    this.color,
  });

  final String? imagePath;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Color? svgColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath,
          height: 22.adaptSize,
          width: 22.adaptSize,
          fit: BoxFit.contain,
          color: color ?? Colors.black,
          svgColor: svgColor ?? Colors.black,
        ),
      ),
    );
  }
}
