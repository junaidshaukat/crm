import 'dart:io';

import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CreateMediaController extends GetxController {
  Props props = Props();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController sortOrderController = TextEditingController();
  TextEditingController mediaFileController = TextEditingController();

  RxBool fullScreen = RxBool(false);
  RxBool status = RxBool(false);
  RxBool isMuted = RxBool(false);
  Rx<File?> mediaFile = Rx(null);

  Future create(
    Map<String, dynamic> requestData,
    void Function(String)? event,
  ) async {
    try {
      props.useState(UseState.processing);
      CreateMediaRes response = await Get.find<Api>().media.create(
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
    } on CreateMediaRes catch (e) {
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
