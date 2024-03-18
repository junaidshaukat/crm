import 'package:flutter/material.dart';

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.8348275);
    path.cubicTo(
        size.width,
        size.height * 0.8348275,
        size.width * 0.7475120,
        size.height * 0.9991514,
        size.width * 0.4975120,
        size.height * 0.9999973);
    path.cubicTo(size.width * 0.2475120, size.height * 1.000843, 0,
        size.height * 0.8382140, 0, size.height * 0.8382140);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
