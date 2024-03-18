import 'package:flutter/material.dart';
import '/core/app_export.dart';

class UpdateUsersController extends GetxController {
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

  bool? getStatus(Users user) {
    Organization org = user.organizations!
        .singleWhere((org) => org.tagNumber == user.organizationTag);
    return org.status;
  }

  Future updateUser(
    String? tagNumber,
    Map<String, dynamic> requestData, {
    void Function(dynamic)? event,
  }) async {
    try {
      props.useState(UseState.processing);

      UsersUpdateRes response = await Get.find<Api>().users.update(
            tagNumber: tagNumber,
            requestData: requestData,
          );

      if (response.result == true) {
        props.useState(UseState.none);
        event!("update");
        Get.back();
        Toasts.success(message: response.message.toString());
      } else {
        throw response;
      }
    } on UsersUpdateRes catch (e) {
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

  void setTextEditingController(Users user) {
    firstNameController.text = user.firstName ?? '';
    lastNameController.text = user.lastName ?? '';
    emailController.text = user.email ?? '';
    accountPasswordController.text = user.accountPassword ?? '';
    status.value = getStatus(user)!;
  }
}
