import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }

enum PlatformType { android, ios, fuchsia, linux, macos, windows, other, web }

/// FIGMA DESIGN WIDTH 375
const num fdw = 375;

/// FIGMA DESIGN HEIGHT 812
const num fdh = 812;

/// FIGMA DESIGN STATUS BAR 0
const num fdsb = 0;

typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
  DeviceType deviceType,
);

PlatformType get getPlaform {
  if (Platform.isAndroid) {
    return PlatformType.android;
  } else if (Platform.isIOS) {
    return PlatformType.ios;
  } else if (Platform.isFuchsia) {
    return PlatformType.fuchsia;
  } else if (Platform.isLinux) {
    return PlatformType.linux;
  } else if (Platform.isMacOS) {
    return PlatformType.macos;
  } else if (Platform.isWindows) {
    return PlatformType.windows;
  } else {
    if (kIsWeb) {
      return PlatformType.web;
    }
    return PlatformType.other;
  }
}

DeviceType get getDeviceType {
  final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
  final shortestSide =
      firstView.physicalSize.shortestSide / firstView.devicePixelRatio;
  if (shortestSide < 600) {
    return DeviceType.mobile;
  } else if (shortestSide >= 600 && shortestSide < 1200) {
    return DeviceType.tablet;
  } else {
    return DeviceType.desktop;
  }
}

class Sizer extends StatelessWidget {
  const Sizer({
    super.key,
    required this.builder,
  });

  /// Builds the widget whenever the orientation changes.
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeUtils.setScreenSize(constraints, orientation);
        return builder(context, orientation, SizeUtils.deviceType);
      });
    });
  }
}

class SizeUtils {
  /// Device's BoxConstraints
  static late BoxConstraints boxConstraints;

  /// Device's Orientation
  static late Orientation orientation;

  /// Type of Device
  ///
  /// This can either be mobile or tablet
  static late DeviceType deviceType;

  /// Device's Height
  static late double height;

  /// Device's Width
  static late double width;

  static void setScreenSize(
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    // Sets boxConstraints and orientation
    boxConstraints = constraints;
    orientation = currentOrientation;

    // Sets screen width and height
    if (orientation == Orientation.portrait) {
      width = boxConstraints.maxWidth.isNonZero(defaultValue: fdw);
      height = boxConstraints.maxHeight.isNonZero();
    } else {
      width = boxConstraints.maxHeight.isNonZero(defaultValue: fdw);
      height = boxConstraints.maxWidth.isNonZero();
    }
    deviceType = getDeviceType;
  }
}

/// This extension is used to set padding/margin (for the top and bottom side) &
/// height of the screen or widget according to the Viewport height.
extension ResponsiveExtension on num {
  /// This method is used to get device viewport width.
  double get _width => SizeUtils.width;

  /// This method is used to get device viewport height.
  double get _height => SizeUtils.height;

  /// This method is used to set padding/margin (for the left and Right side) &
  /// width of the screen or widget according to the Viewport width.
  double get h => ((this * _width) / fdw);

  /// This method is used to set padding/margin (for the top and bottom side) &
  /// height of the screen or widget according to the Viewport height.
  double get v => (this * _height) / (fdh - fdsb);

  /// This method is used to set smallest px in image height and width
  double get adaptSize {
    var height = v;
    var width = h;
    return height < width ? height.toDoubleValue() : width.toDoubleValue();
  }

  /// This method is used to set text font size according to Viewport
  double get fSize => adaptSize;
}

extension FormatExtension on double {
  /// Return a [double] value with formatted according to provided fractionDigits
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(toStringAsFixed(fractionDigits));
  }

  double isNonZero({num defaultValue = 0.0}) {
    return this > 0 ? this : defaultValue.toDouble();
  }
}
