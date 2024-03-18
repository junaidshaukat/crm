import '/core/app_export.dart';

class CompaignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompaignController());
    Get.lazyPut(() => CreateCampaignController());
    Get.lazyPut(() => UpdateCampaignController());
  }
}
