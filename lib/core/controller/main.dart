import '/core/app_export.dart';

/// A controller class for the BiometrciScreen.
///
/// This class manages the state of the BiometrciScreen, including the
/// current biometrciModelObj
class MainController extends GetxController {
  Rx<ProfileRes> profile = ProfileRes().obs;

  Future dependencies() async {
    await getProfile();
  }

  Future getProfile() async {
    try {
      profile.value = await Get.find<Api>().dashboard.getProfile();
      update();
    } on ProfileRes {
      rethrow;
    }
  }
}
