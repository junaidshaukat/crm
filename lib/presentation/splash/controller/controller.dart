import '/core/app_export.dart';

class SplashController extends GetxController {
  EnvConfig env = EnvConfig();

  @override
  void onReady() {
    super.onReady();
    StatusBar.set(true);
    Future.delayed(const Duration(milliseconds: 3000), () {
      isLogin();
    });
  }

  isLogin() {
    if (env.adminToken == null) {
      return Get.offNamed(AppRoutes.signin, arguments: {
        'biometric': false,
      });
    } else {
      dynamic arguments = Get.arguments;

      if (arguments != null) {
        Map<String, dynamic> event = arguments as Map<String, dynamic>;
        if (event.containsKey('setOrganization')) {
          return Get.offNamed(AppRoutes.dashboard);
        }

        if (event.containsKey('authenticated')) {
          return Get.offNamed(AppRoutes.dashboard);
        }
      }

      return Get.offNamed(AppRoutes.signin, arguments: {
        'biometric ': true,
      });
    }
  }
}
