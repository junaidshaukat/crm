import '/core/app_export.dart';

/// A binding class for the SigninScreen.
///
/// This class ensures that the SigninController is created when the
/// SigninScreen is first loaded.
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => HomeCompaignsController());
    Get.lazyPut(() => HomeRecurringController());
  }
}
