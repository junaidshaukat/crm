import '/core/app_export.dart';

class ChannelsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChannelsController());
  }
}
