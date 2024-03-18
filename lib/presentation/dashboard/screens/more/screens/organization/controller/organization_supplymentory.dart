import 'dart:typed_data';

import 'package:flutter/material.dart';
import '/core/app_export.dart';

class OrganizationSupplymentoryDataController extends GetxController {
  EnvConfig env = EnvConfig();
  Props props = Props();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController locationNameController = TextEditingController();
  TextEditingController timeZoneController = TextEditingController();
  TextEditingController shortNameController = TextEditingController();
  TextEditingController receiptAlertEmailController = TextEditingController();
  TextEditingController signUpDateController = TextEditingController();
  TextEditingController updateDateTimeController = TextEditingController();
  TextEditingController portalUrlController = TextEditingController();
  TextEditingController forceRegistrationController = TextEditingController();

  RxBool forceRegistration = RxBool(false);

  void setTextEditingController(OrganizationData organization) {
    locationNameController.text = organization.locationName ?? '';
    timeZoneController.text = organization.timezone ?? '';
    shortNameController.text = organization.shortName ?? '';
    receiptAlertEmailController.text = organization.receiptAlertEmail ?? '';
    signUpDateController.text = organization.signupDate ?? '';
    updateDateTimeController.text = organization.updateDateTime ?? '';
    portalUrlController.text = organization.portalUrl ?? '';
    forceRegistrationController.text = organization.forceRegistration ?? '';
    if (organization.forceRegistration?.toLowerCase() == 'n') {
      forceRegistration.value = false;
    } else {
      forceRegistration.value = true;
    }
  }

  @override
  void onClose() {
    super.onClose();
    locationNameController.dispose();
    timeZoneController.dispose();
    shortNameController.dispose();
    receiptAlertEmailController.dispose();
    signUpDateController.dispose();
    updateDateTimeController.dispose();
    portalUrlController.dispose();
    forceRegistrationController.dispose();
  }

  void clear() {
    locationNameController.clear();
    timeZoneController.clear();
    shortNameController.clear();
    receiptAlertEmailController.clear();
    signUpDateController.clear();
    updateDateTimeController.clear();
    portalUrlController.clear();

    update();
  }

  Future save(
    int? tagNumber,
    Map<String, dynamic> requestData, {
    void Function(dynamic)? event,
  }) async {
    try {
      props.useState(UseState.processing);
      OrganizationSupplementaryDataUpdateRes response = await Get.find<Api>()
          .organization
          .organizationSupplementaryDataUpdate(
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

  String extractFilename(String contentDisposition) {
    final regex = RegExp('filename=(".*")');
    final match = regex.firstMatch(contentDisposition);
    if (match != null) {
      return match.group(1)!.replaceAll('"', '');
    }
    return '';
  }

  Future<void> download(
      Uint8List data, String fileName, String mimeType) async {
    await DocumentFileSavePlus().saveFile(data, fileName, mimeType);
    Toasts.success(message: "qrcode_saved".tr);
  }

  Future<bool> qrCode(String? qrCode) async {
    try {
      QrReadReq request = QrReadReq(
        data: qrCode,
        name: '',
      );

      QrReadRes response = await Get.find<Api>().qr.read(
            requestData: request.toJson(),
          );
      if (response.result == true) {
        await download(response.data!, extractFilename(response.fileName!),
            response.mimeType!);
        return true;
      } else {
        return false;
      }
    } on QrReadRes catch (e) {
      Toasts.error(
        message: e.message.toString(),
      );
      return false;
    } on DioResponse catch (e) {
      Toasts.error(
        message: e.message.toString(),
      );
      return false;
    } on NoInternetException catch (e) {
      Toasts.error(
        message: e.toString(),
      );
      return false;
    } catch (e) {
      Toasts.error(
        message: e.toString(),
      );
      return false;
    }
  }
}
