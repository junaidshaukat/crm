import 'dart:io';

import '/core/app_export.dart';

class Launcher {
  /// Method to launch a general URL
  /// @param uri "https://www.example.com"
  static void https(uri) async {
    Uri url = Uri.parse(uri);
    canLaunchUrl(url).then((value) async {
      await launchUrl(url);
    }, onError: (err) {
      throw Exception('${"could_not_launch".tr} $url');
    });
  }

  static void mailto(String mail) async {
    Uri url = Uri(scheme: 'mailto', path: mail);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw Exception('${"could_not_launch".tr} $url');
    }
  }

  static void tel(String phone) async {
    Uri url = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw Exception('${"could_not_launch".tr} $url');
    }
  }

  static void sms(String phone) async {
    Uri url = Uri(scheme: 'sms', path: phone);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw Exception('${"could_not_launch".tr} $url');
    }
  }

  static void maps(String address) async {
    String encodedAddress = Uri.encodeComponent(address);
    String url = Platform.isIOS
        ? 'maps:0,0?q=$encodedAddress'
        : 'geo:0,0?q=$encodedAddress';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw Exception('${"could_not_launch".tr} $url');
    }
  }
}
