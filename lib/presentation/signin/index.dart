import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'binding/binding.dart';
export 'controller/controller.dart';
export 'models/model.dart';

class SigninScreen extends GetWidget<SigninController> {
  const SigninScreen({super.key});

  Future<void> login() async {
    Rx<UseState> useState = controller.props.useState;
    if (useState.value == UseState.none) {
      if (controller.formKey.currentState!.validate()) {
        LoginReq request = LoginReq(
          email: controller.emailController.text,
          password: controller.passwordController.text,
        );
        await controller.login(request.toJson());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              ClipPath(
                clipper: Clipper(),
                child: Container(
                  height: 370.v,
                  width: double.maxFinite,
                  color: appTheme.green800,
                  child: Container(
                    height: 370.v,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("bg@1".image.png),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: "logo@1".icon.svg,
                          height: 102.v,
                          width: 248.h,
                        ),
                        SizedBox(height: 30.v),
                        Text(
                          "sign_in".tr,
                          style: TextStyle(
                            color: appTheme.whiteA700,
                            fontSize: 34.fSize,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.h),
                child: CustomTextFormField(
                  controller: controller.emailController,
                  hintText: "email".tr,
                  keyboardType: TextInputType.emailAddress,
                  prefix: Container(
                    margin: EdgeInsets.fromLTRB(
                      20.h,
                      13.v,
                      10.h,
                      13.v,
                    ),
                    child: CustomImageView(
                      imagePath: "email".icon.svg,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                    ),
                  ),
                  prefixConstraints: BoxConstraints(maxHeight: 50.v),
                  validator: Validator.email,
                  contentPadding: EdgeInsets.only(
                    top: 16.v,
                    right: 30.h,
                    bottom: 16.v,
                  ),
                  borderDecoration: TextFormFieldStyleHelper.fillGray,
                  filled: true,
                  fillColor: appTheme.gray10001,
                ),
              ),
              SizedBox(height: 24.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.h),
                child: Obx(
                  () => CustomTextFormField(
                    controller: controller.passwordController,
                    hintText: "password".tr,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    prefix: Container(
                      margin: EdgeInsets.fromLTRB(
                        20.h,
                        13.v,
                        10.h,
                        13.v,
                      ),
                      child: CustomImageView(
                        imagePath: "password".icon.svg,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(maxHeight: 50.v),
                    suffix: InkWell(
                      onTap: () {
                        controller.isShowPassword.value =
                            !controller.isShowPassword.value;
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 13.v, 20.h, 13.v),
                        child: CustomImageView(
                          imagePath: controller.isShowPassword.isTrue
                              ? "eye".icon.svg
                              : "eye_slash".icon.svg,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                        ),
                      ),
                    ),
                    suffixConstraints: BoxConstraints(maxHeight: 50.v),
                    validator: Validator.password,
                    obscureText: controller.isShowPassword.value,
                    contentPadding: EdgeInsets.symmetric(vertical: 16.v),
                    borderDecoration: TextFormFieldStyleHelper.fillGray,
                    filled: true,
                    fillColor: appTheme.gray10001,
                  ),
                ),
              ),
              SizedBox(height: 24.v),
              Obx(
                () => CustomElevatedButton(
                  text: controller.props.useState.value == UseState.none
                      ? "sign_in".tr
                      : "",
                  leftIcon: controller.props.useState.value == UseState.none
                      ? null
                      : CustomProgressButton(
                          lable: 'processing'.tr,
                        ),
                  margin: EdgeInsets.symmetric(horizontal: 25.h),
                  onPressed: login,
                ),
              ),
              SizedBox(height: 16.v),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.recoverPassword);
                },
                child: Text(
                  "fogot_password".tr,
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 12.fSize,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 16.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 7.v, bottom: 6.v),
                      child: SizedBox(
                        width: 127.h,
                        child: Divider(color: appTheme.gray80001),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7.h),
                      child: Text(
                        "login_with".tr,
                        style: TextStyle(
                          color: appTheme.black900,
                          fontSize: 12.fSize,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7.v, bottom: 6.v),
                      child: SizedBox(
                        width: 130.h,
                        child: Divider(
                          color: appTheme.gray80001,
                          indent: 7.h,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 11.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    height: 49.adaptSize,
                    width: 49.adaptSize,
                    onTap: () => controller.authBiometric(),
                    child: CustomImageView(
                      imagePath: "face_id".icon.svg,
                    ),
                  ),
                  SizedBox(width: 12.h),
                  CustomIconButton(
                    height: 49.adaptSize,
                    width: 49.adaptSize,
                    onTap: () => controller.authBiometric(),
                    child: CustomImageView(
                      imagePath: "finger_print".icon.svg,
                    ),
                  )
                ],
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }
}
