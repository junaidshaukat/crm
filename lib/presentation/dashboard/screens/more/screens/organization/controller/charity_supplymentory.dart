import 'package:flutter/material.dart';

import '/core/app_export.dart';

class OrganizationSupplementaryDataCharityController extends GetxController {
  Props props = Props();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController taxReceiptStartDateController = TextEditingController();
  TextEditingController taxReceiptFooterController = TextEditingController();

  Rx<DateTime?> taxReceiptStartDate = Rx(null);

  void setTextEditingController(OrganizationData organization) {
    console.log(organization.toJson());
    taxReceiptStartDateController.text = organization.taxReceiptStartDate ?? '';
    taxReceiptFooterController.text = organization.taxReceiptFooter ?? '';
  }

  @override
  void onClose() {
    super.onClose();
    taxReceiptStartDateController.dispose();
    taxReceiptFooterController.dispose();
  }

  void clear() {
    taxReceiptStartDateController.clear();
    taxReceiptFooterController.clear();

    update();
  }

  Future save(
    int? tagNumber,
    Map<String, dynamic> requestData, {
    void Function(dynamic)? event,
  }) async {
    try {
      props.useState(UseState.processing);
      OrganizationSupplementaryCharityDataUpdateRes response =
          await Get.find<Api>().organization.charitySupplementaryUpdate(
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
