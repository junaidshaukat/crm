import '/core/app_export.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Api());
    Get.put(Internet());
    Get.put(PrefUtils());
    Get.put(StatusBar());
    Get.put(Google());
  }
}
