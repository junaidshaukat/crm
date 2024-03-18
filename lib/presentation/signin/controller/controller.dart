import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/core/app_export.dart';

String emailText = "shahzad.khan@mervice.ca";
String passwordText = "Donatenow123\$";

class SigninController extends GetxController {
  Props props = Props();

  User user = User.init();
  EnvConfig env = EnvConfig();

  LocalAuthentication auth = LocalAuthentication();
  RxList<BiometricType> biometricType = <BiometricType>[].obs;

  RxBool capable = false.obs;
  RxBool canCheckBiometrics = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<SigninModel> signinModelObj = SigninModel().obs;

  Rx<bool> isShowPassword = true.obs;

  LoginRes response = LoginRes();

  @override
  Future<void> onInit() async {
    capable.value = await auth.canCheckBiometrics;
    biometricType.value = await auth.getAvailableBiometrics();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> silentLogin({String? email, String? password}) async {
    try {
      LoginReq request = LoginReq(
        email: email,
        password: password,
      );
      response = await Get.find<Api>().public.authLogin(
            requestData: request.toJson(),
          );
      if (response.result == true) {
        await env.putAll({
          "adminToken": response.data?.token,
        });
        Get.offAllNamed(AppRoutes.dashboard);
      } else {
        throw response;
      }
    } on LoginRes catch (e) {
      Toasts.error(message: e.message.toString());
    } on DioResponse catch (e) {
      Toasts.error(message: e.message.toString());
    } on NoInternetException catch (e) {
      Toasts.error(message: e.toString());
    } catch (e) {
      Toasts.error(message: e.toString());
    }
  }

  Future<void> login(Map<dynamic, dynamic> requestData) async {
    try {
      props.useState(UseState.processing);
      response = await Get.find<Api>().public.authLogin(
            requestData: requestData,
          );
      if (response.result == true) {
        await env.putAll({
          "adminToken": response.data?.token,
          'email': requestData['email'],
          'password': requestData['password'],
        });
        props.useState(UseState.none);
        Get.offAllNamed(AppRoutes.dashboard);
      } else {
        throw response;
      }
    } on LoginRes catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.message));
      Toasts.error(message: e.message.toString());
    } on DioResponse catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.message));
      Toasts.error(message: e.message.toString());
    } on NoInternetException catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
      Toasts.error(message: e.toString());
    } catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
      Toasts.error(message: e.toString());
    }
  }

  Future authBiometric() async {
    try {
      if (capable.isTrue) {
        if (biometricType.isNotEmpty) {
          bool authenticated = await auth.authenticate(
            localizedReason: 'Authenticate to access the app',
            options: const AuthenticationOptions(
              useErrorDialogs: true,
              stickyAuth: true,
              sensitiveTransaction: true,
              biometricOnly: true,
            ),
          );
          if (authenticated) {
            if (env.password != null && env.email != null) {
              await silentLogin(email: env.email, password: env.password);
            } else {
              Toasts.error(
                message: "Please login first with your email and password"
                    .toString(),
              );
            }
          }
        } else {
          Toasts.error(
            message: "Sorry your device not enrolled biometrics".toString(),
          );
        }
      } else {
        Toasts.error(
          message:
              "Sorry your device not capable of checking biometrics".toString(),
        );
      }
    } on PlatformException catch (e) {
      Toasts.error(message: e.toString());
    } catch (e) {
      Toasts.error(message: e.toString());
    }
  }
}
