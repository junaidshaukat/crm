import '/core/app_export.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String splash = initialRoute;
  static const String signin = '/signin';
  static const String biometrci = '/biometrci';
  static const String faceId = '/face_id';
  static const String recoverPassword = '/recover_password';
  static const String resetPassword = '/reset_password';
  static const String newPassword = '/new_password';
  static const String dashboard = '/dashboard';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => const SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => const SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: signin,
      page: () => const SigninScreen(),
      bindings: [
        SigninBinding(),
      ],
    ),
    GetPage(
      name: recoverPassword,
      page: () => const RecoverPasswordScreen(),
      bindings: [
        RecoverPasswordBinding(),
      ],
    ),
    GetPage(
      name: resetPassword,
      page: () => const ResetPasswordScreen(),
      bindings: [
        ResetPasswordBinding(),
      ],
    ),
    GetPage(
      name: dashboard,
      page: () => const DashboardScreen(),
      bindings: [
        DashboardBinding(),
      ],
    ),
  ];
}
