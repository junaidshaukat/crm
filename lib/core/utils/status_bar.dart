import 'package:flutter/services.dart';
import '/core/app_export.dart';

class StatusBar {
  static void set(bool green) {
    setSystemUIOverlayStyle(green);
  }

  static void setSystemUIOverlayStyle(bool green) {
    if (getPlaform == PlatformType.android) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: appTheme.gray,
          systemNavigationBarDividerColor: appTheme.gray,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: green ? appTheme.green : appTheme.gray,
          statusBarBrightness: green ? Brightness.light : Brightness.dark,
          statusBarIconBrightness: green ? Brightness.light : Brightness.dark,
        ),
      );
    }

    if (getPlaform == PlatformType.ios) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: green ? Brightness.light : Brightness.dark,
        ),
      );
    }
  }
}
