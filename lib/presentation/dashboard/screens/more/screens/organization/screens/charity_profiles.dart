import 'dart:convert';

import 'package:flutter/material.dart';
import '/core/app_export.dart';

class OrganizationCharityProfileScreen extends StatelessWidget {
  final controller = Get.put(OrganizationCharityProfileController());
  final void Function(dynamic)? event;
  final OrganizationData organization;

  OrganizationCharityProfileScreen(
    this.event, {
    super.key,
    required this.organization,
  }) {
    controller.setTextEditingController(organization);
  }

  Future<void> save() async {
    if (controller.formKey.currentState!.validate()) {
      OrganizationCharityProfileUpdateReq request =
          OrganizationCharityProfileUpdateReq(
        charityOrganization: controller.charityOrganizationController.text,
        charityRegistrationNumber:
            controller.registerationNumberController.text,
      );
      await controller.save(
        organization.tagNumber,
        request.toJson(organization.toJson()),
        event,
      );
    }
  }

  Widget input({
    String? label,
    String? hintText,
    TextEditingController? conn,
    bool dropDown = false,
    List<DropDown>? items,
    String? Function(String?)? validator,
    void Function(DropDown?)? onChanged,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4.adaptSize),
        Text(
          "$label".tr,
          style: TextStyle(
            color: appTheme.gray80001,
            fontSize: 14.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 2.adaptSize),
        if (!dropDown)
          CustomTextFormField(
            controller: conn,
            hintText: "$hintText".tr,
            validator: validator,
            fillColor: appTheme.gray10001,
            borderDecoration: OutlineInputBorder(
              borderSide: BorderSide(
                color: appTheme.gray400,
              ),
            ),
          ),
        if (dropDown)
          SimpleDropDown(
            height: 40.adaptSize,
            hintText: hintText,
            icon: CustomImageView(
              imagePath: "dropdown".icon.svg,
              height: 23.v,
              width: 34.h,
            ),
            items: items,
            onChanged: onChanged,
          ),
        SizedBox(height: 4.adaptSize),
      ],
    );
  }

  void onPressedUpdateSignature() {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.only(bottom: 0.v),
        content: Container(
          decoration: AppDecoration.fillPrimary.copyWith(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.adaptSize),
              topRight: Radius.circular(8.adaptSize),
            ),
          ),
          width: 260.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(6.h),
                decoration: AppDecoration.fillPrimary.copyWith(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.adaptSize),
                    topRight: Radius.circular(8.adaptSize),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "update_signature".tr,
                      style: TextStyle(
                        color: appTheme.whiteA700,
                        fontSize: 12.fSize,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    CustomImageView(
                      imagePath: "close".icon.svg,
                      height: 15.adaptSize,
                      width: 15.adaptSize,
                      onTap: () {
                        if (controller.propsUpdateSignature.useState.value !=
                            UseState.processing) {
                          Get.back();
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 13.v),
              Padding(
                padding: EdgeInsets.only(left: 8.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomOutlinedButton(
                      height: 24.v,
                      width: 94.h,
                      text: "choose_file".tr,
                      buttonStyle: CustomButtonStyles.outlineGray,
                      onPressed: () {
                        Pickers.file().then((file) {
                          if (file != null) {
                            controller.signature.value = file;
                          }
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 7.h,
                        bottom: 4.v,
                      ),
                      child: Obx(() {
                        return Text(
                          controller.filename,
                          style: TextStyle(
                            color: appTheme.gray600,
                            fontSize: 12.fSize,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
              SizedBox(height: 13.v),
              Padding(
                padding: EdgeInsets.only(left: 13.h),
                child: GestureDetector(
                  onTap: () {
                    Launcher.https(
                        "https://www.signwell.com/online-signature/type/");
                  },
                  child: Text(
                    "need_to_generate".tr,
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontSize: 11.fSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 13.v),
              Padding(
                padding: EdgeInsets.only(right: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomElevatedButton(
                      height: 32.v,
                      width: 80.h,
                      text: "cancel".tr,
                      buttonStyle: CustomButtonStyles.fillGray,
                      onPressed: () {
                        if (controller.propsUpdateSignature.useState.value !=
                            UseState.processing) {
                          Get.back();
                        }
                      },
                    ),
                    SizedBox(width: 8.v),
                    Obx(
                      () => CustomElevatedButton(
                        height: 32.v,
                        width: 100.h,
                        text: controller.propsUpdateSignature.useState.value ==
                                UseState.none
                            ? "update".tr
                            : "",
                        leftIcon:
                            controller.propsUpdateSignature.useState.value ==
                                    UseState.none
                                ? null
                                : CustomProgressButton(
                                    indicator: false,
                                    lable: 'processing'.tr,
                                  ),
                        margin: EdgeInsets.symmetric(horizontal: 0.h),
                        onPressed: () async {
                          await controller.updateSignature(event);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.v),
            ],
          ),
        ),
      ),
    );
  }

  Widget updateSignature({
    TextEditingController? con,
    String? Function(String?)? validator,
    String? imagePath,
  }) {
    return TextFormField(
      validator: validator,
      controller: con,
      decoration: InputDecoration(
        prefixIconConstraints: BoxConstraints(
          maxWidth: 150.h,
          minWidth: 150.h,
          maxHeight: 50,
          minHeight: 50,
        ),
        prefixIcon: SizedBox(
          child: Image.memory(
            base64Decode(imagePath!),
          ),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.all(4.adaptSize),
          child: CustomElevatedButton(
            width: 150.h,
            height: 44,
            text: 'update_signature'.tr,
            margin: EdgeInsets.all(2.adaptSize),
            onPressed: onPressedUpdateSignature,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 64.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: AppbarWithBackAndFilter(
              title: "profile".tr,
            ),
          ),
          SizedBox(height: 16.v),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
              decoration: AppDecoration.outlinePrimary.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL28,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 14.v),
                      const Center(child: CustomDivider()),
                      SizedBox(height: 19.v),
                      input(
                        label: 'charity_organization'.tr,
                        hintText: 'charity_organization'.tr,
                        conn: controller.charityOrganizationController,
                        validator: ValidatorOrganization.name,
                      ),
                      input(
                        label: 'registeration_number'.tr,
                        hintText: 'registeration_number'.tr,
                        conn: controller.registerationNumberController,
                        validator: ValidatorOrganization.registerationNumber,
                      ),
                      Obx(() => updateSignature(
                            imagePath: controller.signatureImageBytes.value,
                          )),
                      SizedBox(height: 16.v),
                      Obx(
                        () => CustomElevatedButton(
                          text: controller.props.useState.value == UseState.none
                              ? "save".tr
                              : "",
                          leftIcon:
                              controller.props.useState.value == UseState.none
                                  ? null
                                  : CustomProgressButton(
                                      lable: 'processing'.tr,
                                    ),
                          margin: EdgeInsets.symmetric(horizontal: 0.h),
                          onPressed: save,
                        ),
                      ),
                      SizedBox(height: 16.v),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
