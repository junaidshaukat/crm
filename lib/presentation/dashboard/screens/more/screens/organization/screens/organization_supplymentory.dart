import 'package:flutter/material.dart';
import '/core/app_export.dart';

class OrganizationSupplementaryDataScreen extends StatelessWidget {
  final controller = Get.put(OrganizationSupplymentoryDataController());
  final void Function(dynamic)? event;
  final OrganizationData organization;

  OrganizationSupplementaryDataScreen(
    this.event, {
    super.key,
    required this.organization,
  }) {
    controller.setTextEditingController(organization);
  }

  Future<void> save() async {
    if (controller.formKey.currentState!.validate()) {
      OrganizationSupplementaryDataUpdateReq request =
          OrganizationSupplementaryDataUpdateReq(
        locationName: controller.locationNameController.text,
        receiptAlertEmail: controller.receiptAlertEmailController.text,
        forceRegistration: controller.forceRegistrationController.text,
      );
      console.log(request.toJson(organization.toJson()));
      await controller.save(
          organization.tagNumber, request.toJson(organization.toJson()),
          event: event);
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
    bool readOnly = true,
    Widget? suffix,
    BoxConstraints? suffixConstraints,
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
            readOnly: readOnly,
            controller: conn,
            hintText: "$hintText".tr,
            validator: validator,
            fillColor: appTheme.gray10001,
            suffix: suffix,
            suffixConstraints: suffixConstraints,
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

  Widget customSwitch({
    required String label,
    num width = 50,
    bool? value,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
    required dynamic Function(bool) onChange,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        SizedBox(height: 14.v),
        Text(
          label,
          overflow: TextOverflow.clip,
          maxLines: 2,
          style: TextStyle(
            color: appTheme.gray80001,
            fontSize: 14.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 2.v),
        SizedBox(
          width: width.h,
          child: FittedBox(
            fit: BoxFit.cover,
            child: CustomSwitch(
              value: value,
              onChange: onChange,
            ),
          ),
        ),
      ],
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
              title: "supplementary_data".tr,
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
                        readOnly: false,
                        label: 'location_name'.tr,
                        hintText: 'location_name'.tr,
                        conn: controller.locationNameController,
                        validator: ValidatorOrganization.name,
                      ),
                      input(
                        label: 'time_zone'.tr,
                        hintText: 'time_zone'.tr,
                        conn: controller.timeZoneController,
                      ),
                      input(
                        label: 'short_name'.tr,
                        hintText: 'short_name'.tr,
                        conn: controller.shortNameController,
                      ),
                      input(
                        readOnly: false,
                        label: 'receipt_alert_email'.tr,
                        hintText: 'receipt_alert_email'.tr,
                        conn: controller.receiptAlertEmailController,
                        validator: (input) {
                          return ValidatorOrganization.email(
                            input,
                            isRequired: false,
                          );
                        },
                      ),
                      input(
                        label: 'sign_up_date'.tr,
                        hintText: 'sign_up_date'.tr,
                        conn: controller.signUpDateController,
                      ),
                      input(
                        label: 'last_update'.tr,
                        hintText: 'last_update'.tr,
                        conn: controller.updateDateTimeController,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 2,
                            child: input(
                              label: 'portal_url'.tr,
                              hintText: 'portal_url'.tr,
                              conn: controller.portalUrlController,
                            ),
                          ),
                          SizedBox(width: 4.h),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                QrCodeDownload(
                                  controller: controller,
                                  qrCode: organization.portalUrl,
                                ),
                                SizedBox(height: 4.h),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Obx(
                        () => customSwitch(
                          label: "force_registration".tr,
                          value: controller.forceRegistration.value,
                          onChange: (value) {
                            if (value == true) {
                              controller.forceRegistration.value = value;
                              controller.forceRegistrationController.text = 'Y';
                            } else {
                              controller.forceRegistration.value = value;
                              controller.forceRegistrationController.text = 'N';
                            }
                          },
                        ),
                      ),
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

class QrCodeDownload extends StatelessWidget {
  final String? qrCode;
  final OrganizationSupplymentoryDataController? controller;

  const QrCodeDownload({
    super.key,
    this.qrCode,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    Rx<bool> downloading = Rx(false);

    return Obx(() {
      if (downloading.isFalse) {
        return CustomElevatedButton(
          height: 38,
          text: "qr_code".tr,
          isDisabled: controller!.env.gatewayNodeTag > 0 ? false : true,
          leftIcon: Container(
            margin: EdgeInsets.only(right: 6.h),
            child: CustomImageView(
              imagePath: "download".icon.svg,
              height: 16.adaptSize,
              width: 16.adaptSize,
            ),
          ),
          buttonStyle: CustomButtonStyles.fillGrayTL4,
          onPressed: () async {
            downloading(true);
            await controller?.qrCode(qrCode);
            downloading(false);
          },
        );
      } else {
        return CustomElevatedButton(
          height: 38,
          text: "".tr,
          isDisabled: qrCode != null ? false : true,
          leftIcon: Container(
            padding: EdgeInsets.all(6.adaptSize),
            child: Center(
              child: CircularProgress(
                width: 12,
                height: 12,
                colorAnimation: appTheme.whiteA700,
              ),
            ),
          ),
          buttonStyle: CustomButtonStyles.fillGrayTL4,
          onPressed: () async {},
        );
      }
    });
  }
}
