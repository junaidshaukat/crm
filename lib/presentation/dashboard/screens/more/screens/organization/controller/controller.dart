import '/core/app_export.dart';

export 'organization_address.dart';
export 'charity_address.dart';
export 'charity_profile.dart';
export 'contact.dart';
export 'organization_profile.dart';
export 'charity_supplymentory.dart';
export 'organization_supplymentory.dart';

class OrganizationController extends GetxController {
  Props props = Props();
  Rx<OrganizationData> organization = Rx(OrganizationData());

  @override
  void onReady() async {
    super.onReady();
    await Future.wait([getOrganization()]);
  }

  Future getOrganization() async {
    try {
      props.useState(UseState.loading);
      OrganizationRes response =
          await Get.find<Api>().organization.organization();
      if (response.result == true) {
        organization(response.data);
        props.useState(UseState.done);
      } else {
        throw response;
      }
    } on DioResponse catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.toString()));
    } catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.toString()));
    }
  }
}
