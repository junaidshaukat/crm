import 'package:flutter/material.dart';
import '/core/app_export.dart';

/// A controller class for the OtpScreen.
///
/// This class manages the state of the OtpScreen, including the
/// current otpModelObj
class OtpController extends GetxController {
  Props props = Props();
  Props propsResendCode = Props();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<TextEditingController> otpController = TextEditingController().obs;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Rx<bool> isShowPassword = true.obs;
  Rx<bool> isShowPassword1 = true.obs;
  ResetPasswordRes response = ResetPasswordRes();

  @override
  void onClose() {
    super.onClose();
    otpController.value.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  Future<void> resendCode() async {
    try {
      propsResendCode.useState(UseState.resending);
      Map<String, dynamic> arguments = Get.arguments;
      ForgetPasswordReq request = ForgetPasswordReq(
        email: arguments['email'],
      );
      ForgetPasswordRes response = await Get.find<Api>().public.forgetPassword(
            requestData: request.toJson(),
          );

      if (response.result == true) {
        propsResendCode.useState(UseState.none);
        Toasts.success(message: response.message.toString());
      } else {
        throw response;
      }
    } on ForgetPasswordRes catch (e) {
      propsResendCode.useState(UseState.none);
      propsResendCode.error(UseError(message: e.message));
      Toasts.warning(message: e.message);
    } on DioResponse catch (e) {
      propsResendCode.useState(UseState.none);
      propsResendCode.error(UseError(message: e.message));
      Toasts.warning(message: e.message);
    } on NoInternetException catch (e) {
      propsResendCode.useState(UseState.none);
      propsResendCode.error(UseError(message: e.toString()));
      Toasts.warning(message: e.toString());
    } catch (e) {
      propsResendCode.useState(UseState.none);
      propsResendCode.error(UseError(message: e.toString()));
      Toasts.warning(message: e.toString());
    }
  }

  Future<void> resetPassword(Map req) async {
    try {
      props.useState(UseState.processing);
      response = await Get.find<Api>().public.resetPassword(
            requestData: req,
          );
      if (response.result == true) {
        Toasts.success(message: response.message);
        Get.offAllNamed(AppRoutes.splash);
        props.useState(UseState.none);
      } else {
        throw response;
      }
    } on ResetPasswordRes catch (e) {
      console.log(e, name: 'ResetPasswordRes');
      props.useState(UseState.none);
      props.error(UseError(message: e.message));
      Toasts.warning(message: e.message);
    } on DioResponse catch (e) {
      console.log(e, name: 'DioResponse');
      props.useState(UseState.none);
      props.error(UseError(message: e.message));
      Toasts.warning(message: e.message);
    } on NoInternetException catch (e) {
      console.log(e, name: 'NoInternetException');
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
      Toasts.warning(message: e.toString());
    } catch (e) {
      console.log(e, name: 'catch');
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
      Toasts.error(message: e.toString());
    }
  }
}
