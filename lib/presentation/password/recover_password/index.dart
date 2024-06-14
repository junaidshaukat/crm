import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'controller/controller.dart';

class RecoverPasswordScreen extends StatelessWidget {
  final controller = Get.put(RecoverPasswordController());
  RecoverPasswordScreen({super.key});

  Future<void> forgetPassword() async {
    Rx<UseState> useState = controller.props.useState;
    if (useState.value == UseState.none) {
      if (controller.formKey.currentState!.validate()) {
        ForgetPasswordReq request = ForgetPasswordReq(
          email: controller.emailController.text,
        );
        await controller.forgetPassword(
          request.toJson(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appTheme.whiteA700,
      appBar: CustomAppBar(
        leadingWidth: 47.h,
        leading: AppbarLeadingImage(
          imagePath: "back".icon.svg,
          margin: EdgeInsets.only(left: 23.h, top: 14.v, bottom: 17.v),
          onTap: () => Get.back(),
        ),
        centerTitle: true,
        title: AppbarTitle(text: "recover_password".tr),
      ),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 37.v),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Container(
                width: 321.h,
                margin: EdgeInsets.symmetric(horizontal: 26.h),
                child: Text(
                  "enter_the_email".tr,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: appTheme.black900,
                    fontSize: 16.fSize,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 40.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.h),
                child: CustomTextFormField(
                  controller: controller.emailController,
                  hintText: "email_address".tr,
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
              SizedBox(height: 16.v),
              Obx(
                () => CustomElevatedButton(
                  text: controller.props.useState.value == UseState.none
                      ? "send_instructions".tr
                      : "",
                  leftIcon: controller.props.useState.value == UseState.none
                      ? null
                      : CustomProgressButton(
                          lable: 'processing'.tr,
                        ),
                  margin: EdgeInsets.symmetric(horizontal: 25.h),
                  onPressed: forgetPassword,
                ),
              ),
              SizedBox(height: 49.v),
            ],
          ),
        ),
      ),
    );
  }
}
