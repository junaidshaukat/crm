import '/core/app_export.dart';

class MoreController extends GetxController {
  Props props = Props();
  EnvConfig env = EnvConfig();
  Rx<ProfileData?> profile = Rx(null);
  RxString version = RxString('');

  @override
  void onReady() async {
    super.onReady();
    Future.wait([getProfile(), getAppVersion()]);
  }

  Future<void> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version.value = packageInfo.version;
  }

  Future getProfile() async {
    try {
      props.useState(UseState.loading);
      UserProfileRes request = UserProfileRes();
      ProfileRes response =
          await Get.find<Api>().users.profile(requestData: request.toJson());

      if (response.result == true) {
        props.useState(UseState.done);
        profile(response.data);
      } else {
        throw response;
      }
    } on ReportRes catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
    } catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
    }
  }

  Future logout() async {
    try {
      props.useState(UseState.processing);
      UsersLogoutRes response = await Get.find<Api>().users.logout();

      if (response.result == true) {
        props.useState(UseState.done);
        await env.clear();
        Get.offAllNamed(AppRoutes.splash);
      } else {
        throw response;
      }
    } on ReportRes catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
    } catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
    }
  }
}
