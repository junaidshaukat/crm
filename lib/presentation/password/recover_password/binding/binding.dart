import '/core/app_export.dart';

/// A binding class for the RecoverPasswordScreen.
///
/// This class ensures that the RecoverPasswordController is created when the
/// RecoverPasswordScreen is first loaded.
class RecoverPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecoverPasswordController());
  }
}
