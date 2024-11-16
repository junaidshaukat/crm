import 'package:flutter/material.dart';

import '/core/app_export.dart';

class OrganizationCharitySupplementaryDataScreen extends StatelessWidget {
  final controller = Get.put(OrganizationSupplementaryDataCharityController());
  final void Function(dynamic)? event;
  final OrganizationData organization;

  OrganizationCharitySupplementaryDataScreen(
    this.event, {
    super.key,
    required this.organization,
  }) {
    controller.setTextEditingController(organization);
  }

  Future<void> save() async {
    if (controller.formKey.currentState!.validate()) {
      OrganizationSupplementaryCharityDataUpdateReq request =
          OrganizationSupplementaryCharityDataUpdateReq(
        taxReceiptStartDate: controller.taxReceiptStartDateController.text,
        taxReceiptFooter: controller.taxReceiptFooterController.text,
      );
      await controller.save(
          organization.tagNumber, request.toJson(organization.toJson()),
          event: event);
    }
  }

  Widget input({
    String? label,
    double? height,
    Widget? suffix,
    String? hintText,
    double? maxHeight,
    bool readOnly = true,
    bool dropDown = false,
    List<DropDown>? items,
    void Function()? onTap,
    EdgeInsets? contentPadding,
    TextEditingController? conn,
    BoxConstraints? suffixConstraints,
    void Function(DropDown?)? onChanged,
    String? Function(String?)? validator,
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
            onTap: onTap,
            contentPadding: contentPadding,
            borderDecoration: OutlineInputBorder(
              borderSide: BorderSide(
                color: appTheme.gray400,
              ),
            ),
          ),
        if (dropDown)
          SimpleDropDown(
            items: items,
            height: height,
            hintText: hintText,
            maxHeight: maxHeight,
            onSelected: onChanged,
            icon: CustomImageView(
              imagePath: "dropdown".icon.svg,
              height: 23.v,
              width: 34.h,
            ),
          ),
        SizedBox(height: 4.adaptSize),
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
                        label: 'tax_receipt_start_date'.tr,
                        hintText: 'tax_receipt_start_date'.tr,
                        conn: controller.taxReceiptStartDateController,
                        validator: ValidatorOrganization.taxReceiptStartDate,
                        onTap: () {
                          pickers.date(Get.context!).then((date) {
                            if (date != null) {
                              controller.taxReceiptStartDateController.text =
                                  date.format('yyyy-MM-dd');
                            }
                          });
                        },
                      ),
                      input(
                        readOnly: false,
                        label: 'tax_receipt_footer'.tr,
                        hintText: 'tax_receipt_footer'.tr,
                        conn: controller.taxReceiptFooterController,
                        validator: ValidatorOrganization.taxReceiptFooter,
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
