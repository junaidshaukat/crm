import 'package:flutter/services.dart';
import '/core/app_export.dart';

class StatusBar {
  static void setSystemUIOverlayStyle(bool green) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: green ? appTheme.green : appTheme.gray,
        systemNavigationBarColor: appTheme.gray,
        systemNavigationBarDividerColor: appTheme.gray,
        statusBarBrightness: green ? Brightness.light : Brightness.dark,
        statusBarIconBrightness: green ? Brightness.light : Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemStatusBarContrastEnforced: true,
        systemNavigationBarContrastEnforced: true,
      ),
    );
  }
}
