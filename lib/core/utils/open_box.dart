import '/core/app_export.dart';

class HiveBox {
  static String appLanguage = 'AppLanguage';
  static String environment = 'Environment';
  static String user = 'User';

  static Future<void> initHive() async {
    await Hive.openBox(appLanguage);
    await Hive.openBox(environment);
    await Hive.openBox(user);
  }
}
