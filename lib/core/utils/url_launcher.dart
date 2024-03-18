import '/core/app_export.dart';

class Launcher {
  /// Method to launch a general URL
  /// @param uri "https://www.example.com"
  static void https(uri) async {
    Uri url = Uri.parse(uri);
    canLaunchUrl(url).then((value) async {
      await launchUrl(url);
    }, onError: (err) {
      throw Exception('Could not launch $url');
    });
  }

  /// Method to launch a general URL
  /// @param mail info@example.com
  static void mailto(String mail) async {
    Uri url = Uri(scheme: 'mailto', path: mail);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// Method to launch a general URL
  /// @param phone +123456789
  static void tel(String phone) async {
    Uri url = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// Method to launch a general URL
  /// @param phone +123456789
  static void sms(String phone) async {
    Uri url = Uri(scheme: 'sms', path: phone);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
