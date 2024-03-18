import '/core/app_export.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(Api());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
    Get.put(MainController());

    // User user = User.init();
    // if (user.accountType != null && user.id != null && user.token != null) {}
  }
}
