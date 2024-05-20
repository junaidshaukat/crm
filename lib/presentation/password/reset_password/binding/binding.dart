import '/core/app_export.dart';

/// A binding class for the OtpScreen.
///
/// This class ensures that the OtpController is created when the
/// OtpScreen is first loaded.
class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordController());
  }
}
