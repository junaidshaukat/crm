import 'package:flutter/material.dart';
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
      set(false);
    }

    ever(currentPage, (page) {
      onChangePage(page, forceGreen.value);
    });

    ever(forceGreen, (green) {
      onChangePage(currentPage.value, green);
    });

    ever(isGreen, (green) {
      set(green);
    });
  }

  void onChangePage(int page, bool green) {
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

  void set(bool green) {
    setSystemUIOverlayStyle(green);
  }

  void setSystemUIOverlayStyle(bool green) {
    if (getPlaform == PlatformType.android) {
      console.log({'green': green}, force: true, name: 'android');
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: appTheme.gray,
          systemNavigationBarDividerColor: appTheme.gray,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: green ? appTheme.green : Colors.transparent,
          statusBarBrightness: green ? Brightness.light : Brightness.dark,
          statusBarIconBrightness: green ? Brightness.light : Brightness.dark,
        ),
      );
    }

    if (getPlaform == PlatformType.ios) {
      console.log({'green': green}, force: true, name: 'ios');
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: green ? Brightness.light : Brightness.dark,
        ),
      );
    }
  }
}
