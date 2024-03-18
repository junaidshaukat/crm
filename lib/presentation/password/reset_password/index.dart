import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'binding/binding.dart';
export 'controller/controller.dart';
export 'models/model.dart';

class OtpScreen extends GetWidget<OtpController> {
  const OtpScreen({super.key});
  void resetPassword() async {
    Rx<UseState> useState = controller.props.useState;
    if (useState.value == UseState.none) {
      if (controller.formKey.currentState!.validate()) {
        Map<String, dynamic> arguments = Get.arguments;
        ResetPasswordReq request = ResetPasswordReq(
          email: arguments['email'],
          resetCode: controller.otpController.value.text,
          newPassword: controller.passwordController.text,
          confirmPassword: controller.confirmPasswordController.text,
        );
        console.log(request.toJson());

        await controller.resetPassword(
          request.toJson(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: CustomAppBar(
        leadingWidth: 47.h,
        leading: AppbarLeadingImage(
          imagePath: "back".icon.svg,
          margin: EdgeInsets.only(
            left: 4.h,
            top: 16.v,
            bottom: 15.v,
          ),
          onTap: () => Get.back(),
        ),
        centerTitle: true,
        title: AppbarTitle(
          text: "verification".tr,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 25.h,
          vertical: 16.v,
        ),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 283.h,
                  margin: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Text(
                    "the_code_has_been".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 18.fSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 24.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.h),
                  child: Obx(
                    () => CustomPinCodeTextField(
                      context: Get.context!,
                      controller: controller.otpController.value,
                      onChanged: (value) {},
                      validator: Validator.otp,
                    ),
                  ),
                ),
                SizedBox(height: 24.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "didn_t_recieve_code".tr,
                        style: CustomTextStyles.bodyLargeff000000,
                      ),
                      Obx(
                        () => SizedBox(
                          width: 140.h,
                          height: 28.v,
                          child: GestureDetector(
                            onTap: controller.resendCode,
                            child: controller.propsResendCode.useState.value ==
                                    UseState.none
                                ? Text(
                                    "resend_code".tr,
                                    style: CustomTextStyles
                                        .titleMediumPoppinsff007c16,
                                  )
                                : CustomProgressButton(
                                    indicator: false,
                                    lable: 'sending'.tr,
                                    style: CustomTextStyles
                                        .titleMediumPoppinsff007c16,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.v),
                SizedBox(height: 36.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.h),
                  child: Obx(
                    () => CustomTextFormField(
                      controller: controller.passwordController,
                      hintText: "new_password".tr,
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
                SizedBox(height: 15.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.h),
                  child: Obx(
                    () => CustomTextFormField(
                      controller: controller.confirmPasswordController,
                      hintText: "confirm_password".tr,
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
                          controller.isShowPassword1.value =
                              !controller.isShowPassword1.value;
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(30.h, 13.v, 20.h, 13.v),
                          child: CustomImageView(
                            imagePath: controller.isShowPassword1.isTrue
                                ? "eye".icon.svg
                                : "eye_slash".icon.svg,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ),
                      ),
                      suffixConstraints: BoxConstraints(maxHeight: 50.v),
                      validator: (input) {
                        return Validator.confirmPassword(
                            input, controller.passwordController.text);
                      },
                      obscureText: controller.isShowPassword1.value,
                      contentPadding: EdgeInsets.symmetric(vertical: 16.v),
                      borderDecoration: TextFormFieldStyleHelper.fillGray,
                      filled: true,
                      fillColor: appTheme.gray10001,
                    ),
                  ),
                ),
                SizedBox(height: 11.v),
                Obx(
                  () => CustomElevatedButton(
                    text: controller.props.useState.value == UseState.none
                        ? "reset_password".tr
                        : "",
                    leftIcon: controller.props.useState.value == UseState.none
                        ? null
                        : CustomProgressButton(
                            lable: 'processing'.tr,
                          ),
                    margin: EdgeInsets.symmetric(horizontal: 0.h),
                    onPressed: resetPassword,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
