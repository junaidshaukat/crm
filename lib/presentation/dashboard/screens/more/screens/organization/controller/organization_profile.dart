import 'package:flutter/material.dart';

import '/core/app_export.dart';

class OrganizationProfilesController extends GetxController {
  Props props = Props();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    websiteController.dispose();
  }

  void clear() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    websiteController.clear();
    update();
  }

  void setTextEditingController(OrganizationData organization) {
    nameController.text = organization.name!;
    phoneController.text = organization.phone!;
    emailController.text = organization.email!;
    websiteController.text = organization.website!;
  }

  Future save(
    int? tagNumber,
    Map<String, dynamic> requestData,
    void Function(String)? event,
  ) async {
    try {
      props.useState(UseState.processing);
      OrganizationProfileUpdateRes response =
          await Get.find<Api>().organization.organizationProfileUpdate(
                tagNumber: tagNumber,
                requestData: requestData,
              );

      if (response.result == true) {
        props.useState(UseState.done);
        event!("update");
        Get.back();
        Toasts.success(
          message: response.message.toString(),
        );
      } else {
        throw response;
      }
    } on DonorCreateRes catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on DioResponse catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on NoInternetException catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    } catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    }
  }
}
