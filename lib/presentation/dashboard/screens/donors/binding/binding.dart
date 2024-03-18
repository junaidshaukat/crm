import '/core/app_export.dart';

class DonorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DonorsController());
    Get.lazyPut(() => CreateDonorsController());
    Get.lazyPut(() => UpdateDonorsController());
  }
}
