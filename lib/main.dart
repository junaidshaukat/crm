import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'core/app_export.dart';

void main() async {
  await Hive.initFlutter();
  await HiveBox.initHive();
  await EnvConfig().initHive();
  await pickers.clearCache();

  WidgetsFlutterBinding.ensureInitialized();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) {
    EnvConfig env = EnvConfig();
    env.putAll({
      'appName': packageInfo.appName,
      'buildNumber': packageInfo.buildNumber,
      'buildSignature': packageInfo.buildSignature,
      'installerStore': packageInfo.installerStore,
      'packageName': packageInfo.packageName,
      'version': packageInfo.version,
    });
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);

    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          theme: theme,
          getPages: AppRoutes.pages,
          translations: AppLocalization(),
          title: 'donor_choice_manager'.tr,
          locale: AppLocalization.onInit(),
          debugShowCheckedModeBanner: false,
          initialBinding: InitialBindings(),
          initialRoute: AppRoutes.initialRoute,
          fallbackLocale: AppLocalization.fallbackLocale,
        );
      },
    );
  }
}
