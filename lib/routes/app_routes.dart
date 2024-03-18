import '/core/app_export.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String splash = initialRoute;
  static const String signin = '/signin';
  static const String biometrci = '/biometrci';
  static const String faceId = '/face_id';
  static const String recoverPassword = '/recover_password';
  static const String otp = '/otp_screen';
  static const String newPassword = '/new_password';
  static const String dashboard = '/dashboard';
  static const String home = '/home';
  static const String homeCompaigns = '/home/compaigns';
  static const String homeRecurring = '/home/recurring';

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
      name: otp,
      page: () => const OtpScreen(),
      bindings: [
        OtpBinding(),
      ],
    ),
    GetPage(
      name: dashboard,
      page: () => const DashboardScreen(),
      bindings: [
        DashboardBinding(),
        HomeBinding(),
      ],
    ),
    GetPage(
      name: homeCompaigns,
      page: () => const HomeCompaignsScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: homeRecurring,
      page: () => const HomeRecurringScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
  ];
}
