import 'package:flutter/material.dart';

import '/core/app_export.dart';

String? a = "shahzad.khan@mervice.ca";
String? b = "Donatenow123\$";

class SigninController extends GetxController {
  Props props = Props();
  EnvConfig env = EnvConfig();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController(text: a);
  TextEditingController passwordController = TextEditingController(text: b);

  Rx<bool> isShowPassword = true.obs;

  LoginRes response = LoginRes();

  @override
  void onReady() {
    super.onReady();
    StatusBar.set(true);
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> login(Map<dynamic, dynamic> requestData,
      {bool viaRequest = true}) async {
    try {
      if (viaRequest) props.useState(UseState.processing);
      response = await Get.find<Api>().public.authLogin(
            requestData: requestData,
          );
      if (response.result == true) {
        for (var org in response.data!.organizations!) {
          if (org.tagNumber == response.data?.organizationTag) {
            await env.putAll({
              'eCheckNodeTag': org.eCheckNodeTag,
              'gatewayNodeTag': org.gatewayNodeTag,
              'currencySymbol': org.currencySymbol,
            });
          }
        }

        await env.putAll({
          "adminToken": response.data?.token,
          'email': requestData['email'],
          'password': requestData['password'],
        });
        if (viaRequest) props.useState(UseState.none);
        Get.offAllNamed(AppRoutes.dashboard);
      } else {
        throw response;
      }
    } on LoginRes catch (e) {
      if (viaRequest) props.useState(UseState.none);
      if (viaRequest) props.error(UseError(message: e.message));
      Toasts.error(message: e.message.toString());
    } on DioResponse catch (e) {
      if (viaRequest) props.useState(UseState.none);
      if (viaRequest) props.error(UseError(message: e.message));
      Toasts.error(message: e.message.toString());
    } on NoInternetException catch (e) {
      if (viaRequest) props.useState(UseState.none);
      if (viaRequest) props.error(UseError(message: e.toString()));
      Toasts.error(message: e.toString());
    } catch (e) {
      if (viaRequest) props.useState(UseState.none);
      if (viaRequest) props.error(UseError(message: e.toString()));
      Toasts.error(message: e.toString());
    }
  }

  Future biometrics() async {
    try {
      final LocalAuthentication auth = LocalAuthentication();

      if (env.password == null || env.email == null) {
        return Toasts.error(message: "login_first".tr);
      }

      bool capable = await auth.isDeviceSupported();
      if (!capable) {
        return Toasts.error(message: "capable".tr);
      }

      bool checking = await auth.canCheckBiometrics;
      if (!checking) {
        return Toasts.error(message: "checking_biometrics".tr);
      }

      List<BiometricType> enrolled = await auth.getAvailableBiometrics();
      if (enrolled.isEmpty) {
        return Toasts.error(message: "enrolled_biometric".tr);
      }

      bool authenticated = await auth.authenticate(
        localizedReason: 'localized_reason'.tr,
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          sensitiveTransaction: true,
          biometricOnly: true,
        ),
      );
      if (!authenticated) {
        return Toasts.error(message: "login_via_email_password".tr);
      }

      LoginReq request = LoginReq(
        email: env.email,
        password: env.password,
      );

      return await login(request.toJson(), viaRequest: false);
    } catch (e) {
      return Toasts.error(message: "capable".tr);
    }
  }
}
