import '/core/app_export.dart';

/// A controller class for the SplashScreen.
///
/// This class manages the state of the SplashScreen, including the
/// current splashModelObj
class SplashController extends GetxController {
  User user = User();
  EnvConfig env = EnvConfig();

  @override
  void onInit() {
    super.onInit();
    user = User.init();
  }

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      isLogin();
    });
  }

  isLogin() {
    if (env.adminToken == null) {
      return Get.offNamed(AppRoutes.signin, arguments: {
        'biometric ': false,
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

      // if (event['auth']) {}
      return Get.offNamed(AppRoutes.signin, arguments: {
        'biometric ': true,
      });
    }
  }
}
