import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'en_us.dart';

class AppLocalization extends Translations {
  static Locale? onInit() {
    return Get.deviceLocale;
  }

  static Locale get fallbackLocale {
    return const Locale('en', 'US');
  }

  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en_US': enUs,
    };
  }
}
