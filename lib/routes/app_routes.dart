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
      page: () => SplashScreen(),
      bindings: const [],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: const [],
    ),
    GetPage(
      name: signin,
      page: () => SigninScreen(),
      bindings: const [],
    ),
    GetPage(
      name: recoverPassword,
      page: () => RecoverPasswordScreen(),
      bindings: const [],
    ),
    GetPage(
      name: resetPassword,
      page: () => ResetPasswordScreen(),
      bindings: const [],
    ),
    GetPage(
      name: dashboard,
      page: () => DashboardScreen(),
      bindings: const [],
    ),
  ];
}
