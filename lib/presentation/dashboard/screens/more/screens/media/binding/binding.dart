import '/core/app_export.dart';

class MediaCentreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MediaCentreController());
  }
}
