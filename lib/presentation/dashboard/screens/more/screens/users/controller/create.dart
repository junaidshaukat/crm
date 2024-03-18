import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CreateUsersController extends GetxController {
  Props props = Props();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController accountPasswordController = TextEditingController();

  RxBool status = RxBool(false);

  @override
  void onClose() {
    super.onClose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    accountPasswordController.dispose();
  }

  void clear() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    accountPasswordController.clear();
    status.value = false;
    update();
  }

  Future create(
    Map<String, dynamic> requestData,
    void Function(String)? event,
  ) async {
    try {
      props.useState(UseState.processing);
      UsersCreateRes response =
          await Get.find<Api>().users.create(requestData: requestData);
      if (response.result == true) {
        event!("update");
        props.useState(UseState.none);
        Get.back();
        Toasts.success(message: response.message.toString());
        clear();
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
