import 'package:flutter/material.dart';

import '/core/app_export.dart';

class OrganizationContactController extends GetxController {
  Props props = Props();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
  }

  void clear() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    update();
  }

  void setTextEditingController(OrganizationData organization) {
    nameController.text = organization.contactName!;
    phoneController.text = organization.contactPhone!;
    emailController.text = organization.contactEmail!;
  }

  Future save(
    int? tagNumber,
    Map<String, dynamic> requestData, {
    void Function(dynamic)? event,
  }) async {
    try {
      props.useState(UseState.processing);
      OrganizationContactUpdateRes response =
          await Get.find<Api>().organization.organizationContactUpdate(
                requestData: requestData,
                tagNumber: tagNumber,
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
    } on DonorUpdateRes catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on DioResponse catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on NoInternetException catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    } catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    }
  }
}
