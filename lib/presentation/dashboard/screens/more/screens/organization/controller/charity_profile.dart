import 'dart:io';
import 'package:flutter/material.dart';
import '/core/app_export.dart';

class OrganizationCharityProfileController extends GetxController {
  Props props = Props();
  Props propsUpdateSignature = Props();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController charityOrganizationController = TextEditingController();
  TextEditingController registerationNumberController = TextEditingController();
  RxString signatureImageBytes = "".obs;

  Rx<File?> signature = Rx(null);

  @override
  void onClose() {
    super.onClose();
    charityOrganizationController.dispose();
    registerationNumberController.dispose();
  }

  void clear() {
    charityOrganizationController.clear();
    registerationNumberController.clear();
    signature.value = null;
    update();
  }

  void setTextEditingController(OrganizationData organization) {
    charityOrganizationController.text = organization.charityOrganization!;
    registerationNumberController.text =
        organization.charityRegistrationNumber!;
    signatureImageBytes.value = organization.signatureImageBytes!;
  }

  String get filename {
    if (signature.value != null) {
      return signature.value!.path.filename;
    }
    return "no_file_chosen".tr;
  }

  Future<void> updateSignature(
    void Function(String)? event,
  ) async {
    try {
      if (signature.value != null) {
        propsUpdateSignature.useState(UseState.processing);
        FormData requestData = FormData.fromMap({
          'signatureFile': await MultipartFile.fromFile(
            signature.value!.path,
            filename: signature.value!.path.filename,
          ),
        });
        OrganizationSignatureUpdateRes response =
            await Get.find<Api>().organization.signatureUpdate(
                  requestData: requestData,
                );

        if (response.result == true) {
          event!("update");
          propsUpdateSignature.useState(UseState.none);
          OrganizationSignatureUpdateData? data = response.data;
          signatureImageBytes.value = data!.signatureImageBytes!;
          Get.back();
        } else {
          throw response;
        }
      }
    } on DonorCreateRes catch (e) {
      propsUpdateSignature.useState(UseState.none);
      Toasts.error(
        message: e.message.toString(),
      );
    } on DioResponse catch (e) {
      propsUpdateSignature.useState(UseState.none);
      Toasts.error(
        message: e.message.toString(),
      );
    } on NoInternetException catch (e) {
      propsUpdateSignature.useState(UseState.none);
      Toasts.error(
        message: e.toString(),
      );
    } catch (e) {
      propsUpdateSignature.useState(UseState.none);
      Toasts.error(
        message: e.toString(),
      );
    }
  }

  Future save(
    int? tagNumber,
    Map<String, dynamic> requestData,
    void Function(String)? event,
  ) async {
    try {
      props.useState(UseState.processing);
      OrganizationCharityProfileUpdateRes response =
          await Get.find<Api>().organization.charityProfileUpdate(
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
