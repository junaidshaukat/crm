import 'dart:io';

import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CreateMediaController extends GetxController {
  Props props = Props();
  Props propsPicking = Props();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController sortOrderController = TextEditingController();
  TextEditingController mediaFileController = TextEditingController();

  RxBool fullScreen = RxBool(false);
  RxBool status = RxBool(false);
  RxBool isMuted = RxBool(false);
  Rx<Media?> media = Rx(null);
  Rx<String> mediaType = Rx("image");
  Rx<String?> mediaFileErr = Rx(null);

  Future select() async {
    try {
      propsPicking.useState(UseState.processing);
      File? file = await pickers.media(mediaType: mediaType.value);
      if (file != null) {
        Media selected = await Media.factory(file);
        durationController.text = selected.duration.toString();
        mediaFileController.text = selected.name;
        media.value = selected;
        propsPicking.useState(UseState.none);
      } else {
        media.value = null;
        mediaFileController.clear();
        propsPicking.useState(UseState.none);
      }
    } catch (e) {
      media.value = null;
      mediaFileController.clear();
      propsPicking.useState(UseState.none);
    }
  }

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
        refresh();
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
