import 'package:flutter/material.dart';
import '/core/app_export.dart';

/// A controller class for the RecoverPasswordScreen.
///
/// This class manages the state of the RecoverPasswordScreen, including the
/// current recoverPasswordModelObj
class RecoverPasswordController extends GetxController {
  Props props = Props();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }

  Future<void> forgetPassword(Map req) async {
    try {
      props.useState(UseState.processing);
      ForgetPasswordRes response = await Get.find<Api>().public.forgetPassword(
            requestData: req,
          );
      if (response.result == true) {
        Get.toNamed(
          AppRoutes.otp,
          arguments: {
            'response': response.toJson(),
            'email': emailController.text,
          },
        );
        props.useState(UseState.none);
      } else {
        throw response;
      }
    } on ForgetPasswordRes catch (e) {
      console.log(e, name: 'ForgetPasswordRes');
      props.useState(UseState.none);
      props.error(UseError(message: e.message));
      Toasts.warning(message: e.message);
    } on DioResponse catch (e) {
      console.log(e, name: 'ForgetPasswordRes');

      props.useState(UseState.none);
      props.error(UseError(message: e.message));
      Toasts.warning(message: e.message);
    } on NoInternetException catch (e) {
      console.log(e, name: 'ForgetPasswordRes');

      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
      Toasts.warning(message: e.toString());
    } catch (e) {
      console.log(e, name: 'ForgetPasswordRes');

      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
      Toasts.warning(message: e.toString());
    }
  }
}
