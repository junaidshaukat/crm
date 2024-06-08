import 'package:flutter/services.dart';
import '/core/app_export.dart';

class DashboardController extends GetxController {
  RxInt currentPage = 2.obs;
  Rx<bool> isGreen = Rx(false);
  Rx<bool> forceGreen = Rx(false);

  @override
  void onReady() {
    super.onReady();

    if (currentPage.value == 2) {
      setSystemUIOverlayStyle(false);
    }

    ever(currentPage, (page) {
      onChangePage(page, forceGreen.value);
    });

    ever(forceGreen, (green) {
      onChangePage(currentPage.value, green);
    });

    ever(isGreen, (green) {
      setSystemUIOverlayStyle(green);
    });
  }

  void onChangePage(int page, bool green) {
    console.log({'page': page, 'green': green}, force: true, name: 'page');
    if (page == 0) {
      if (forceGreen.value) {
        isGreen.value = true;
      } else {
        isGreen.value = true;
      }
    } else if (page == 1) {
      if (forceGreen.value) {
        isGreen.value = true;
      } else {
        isGreen.value = true;
      }
    } else if (page == 2) {
      if (forceGreen.value) {
        isGreen.value = true;
      } else {
        isGreen.value = false;
      }
    } else if (page == 3) {
      if (forceGreen.value) {
        isGreen.value = true;
      } else {
        isGreen.value = true;
      }
    } else if (page == 4) {
      if (forceGreen.value) {
        isGreen.value = true;
      } else {
        isGreen.value = true;
      }
    } else {
      if (forceGreen.value) {
        isGreen.value = true;
      } else {
        isGreen.value = false;
      }
    }
  }

  void setSystemUIOverlayStyle(bool green) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        /// Sets the background color of the status bar.
        statusBarColor: green ? appTheme.green : appTheme.gray,

        /// Sets the background color of the system navigation bar.
        systemNavigationBarColor: appTheme.gray,

        /// Sets the color of the divider between the navigation bar and the app content.
        systemNavigationBarDividerColor: appTheme.gray,

        /// For iOS: Sets the brightness of the status bar (text and icons) for dark/light background.
        statusBarBrightness: green ? Brightness.dark : Brightness.light,

        /// For Android: Sets the brightness of the status bar icons for dark/light background.
        statusBarIconBrightness: green ? Brightness.light : Brightness.dark,

        /// For Android: Sets the brightness of the navigation bar icons for dark/light background.
        systemNavigationBarIconBrightness: Brightness.dark,

        /// Enforces a contrast between the status bar content and the status bar background.
        systemStatusBarContrastEnforced: true,

        /// Enforces a contrast between the navigation bar content and the navigation bar background.
        systemNavigationBarContrastEnforced: true,
      ),
    );
  }
}
