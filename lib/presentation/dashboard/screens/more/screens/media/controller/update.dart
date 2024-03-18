import 'dart:io';

import 'package:flutter/material.dart';
import '/core/app_export.dart';

class UpdateMediaController extends GetxController {
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

  void setTextEditingController(MediaData media) {
    nameController.text = media.name ?? "";
    descriptionController.text = media.description ?? "";
    durationController.text = media.duration.toString();
    sortOrderController.text = media.sortOrder.toString();
    mediaFileController.text = media.url ?? "";
    fullScreen.value = media.fullScreen ?? false;
    status.value = media.status ?? false;
    isMuted.value = media.isMuted ?? false;
  }

  Future create(
    int? tagNumber,
    Map<String, dynamic> requestData,
    void Function(String)? event,
  ) async {
    try {
      props.useState(UseState.processing);
      UpdateMediaRes response = await Get.find<Api>().media.update(
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
