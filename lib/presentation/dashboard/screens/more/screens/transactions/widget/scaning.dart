import 'package:flutter/material.dart';

class ScannerScreen extends StatefulWidget {
  final double? width;
  final double? height;

  const ScannerScreen({super.key, this.width, this.height});

  @override
  State<StatefulWidget> createState() {
    return ScannerScreenState();
  }
}

class ScannerScreenState extends State<ScannerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  String scanText = "Scan";
  bool scanning = false;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animateScanAnimation(true);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animateScanAnimation(true);
      } else if (status == AnimationStatus.dismissed) {
        animateScanAnimation(false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          ScannerAnimation(
            animation: _animationController as Animation<double>,
            height: widget.height ?? 500,
            barSize: 8,
          )
        ],
      ),
    );
  }

  void animateScanAnimation(bool reverse) {
    if (reverse) {
      _animationController.reverse(from: 1.0);
    } else {
      _animationController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class ScannerAnimation extends AnimatedWidget {
  final bool stopped;
  final double barSize;
  final double height;

  const ScannerAnimation({
    super.key,
    this.barSize = 60,
    this.stopped = false,
    required this.height,
    required Animation<double> animation,
  }) : super(
          listenable: animation,
        );

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    final scorePosition = (animation.value * height);

    Color color1 = const Color(0x5532CD32);
    Color color2 = const Color(0x0032CD32);

    if (animation.status == AnimationStatus.reverse) {
      color1 = const Color(0x0032CD32);
      color2 = const Color(0x5532CD32);
    }

    return Positioned(
      top: scorePosition,
      left: 16.0,
      right: 16.0,
      child: Opacity(
        opacity: (stopped) ? 0.0 : 1.0,
        child: Container(
          height: barSize,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.1, 0.9],
              colors: [color1, color2],
            ),
          ),
        ),
      ),
    );
  }
}
