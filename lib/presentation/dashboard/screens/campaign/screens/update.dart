import 'package:flutter/material.dart';
import '/core/app_export.dart';

class UpdateCampaignScreen extends StatelessWidget {
  final controller = Get.put(UpdateCampaignController());
  final CampaignData campaign;
  final void Function(dynamic)? event;

  UpdateCampaignScreen(this.campaign, this.event, {super.key}) {
    controller.setTextEditingController(campaign);
  }

  Future<void> create() async {
    if (controller.formKey.currentState!.validate()) {
      CampaignUpdateReq request = CampaignUpdateReq(
        name: controller.nameController.text,
        description: controller.descriptionController.text,
        startDate: controller.startDateController.text,
        endDate: controller.endDateController.text,
        targetAmount: controller.targetAmountController.text,
        minimumAmount: controller.minimumAmountController.text,
        sortOrder: controller.sortOrderController.text,
        fees: controller.feesController.text,
        issueTaxReceipt: controller.issueTaxReceiptController.value,
        donationCampaign: controller.donationCampaignController.value,
        status: controller.statusController.value,
        iconTag: controller.icon.value.tagNumber.toString(),
        nodes: controller.nodes.value,
      );

      await controller.updateCampaign(
        campaign.tagNumber,
        request.toJson(),
        event,
      );
    }
  }

  Widget input({
    String? label,
    String? hintText,
    Widget? prefix,
    Widget? suffix,
    BoxConstraints? prefixConstraints,
    BoxConstraints? suffixConstraints,
    TextEditingController? conn,
    bool dropDown = false,
    List<DropDown>? items,
    void Function()? onTap,
    String? Function(String?)? validator,
    void Function(DropDown?)? onChanged,
    TextInputType? keyboardType,
    int? maxLines,
    bool readOnly = false,
    EdgeInsets? contentPadding,
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
            prefix: prefix,
            suffix: suffix,
            maxLines: maxLines,
            contentPadding: contentPadding,
            keyboardType: keyboardType,
            prefixConstraints: prefixConstraints,
            suffixConstraints: suffixConstraints,
            onTap: onTap,
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

  Widget browse({
    required Rx<IconsData> icon,
    String? Function(String?)? validator,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4.adaptSize),
        Padding(
          padding: EdgeInsets.only(left: 4.h),
          child: Text(
            "icons".tr,
            style: TextStyle(
              color: appTheme.gray80001,
              fontSize: 14.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 2.adaptSize),
        TextFormField(
          validator: validator,
          readOnly: true,
          obscureText: true,
          obscuringCharacter: " ",
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              border: InputBorder.none,
              errorMaxLines: 2,
              errorStyle: const TextStyle(
                overflow: TextOverflow.clip,
              ),
              prefixIcon: SizedBox(
                width: 150.h,
                height: 50.v,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomImageView(
                    fit: BoxFit.contain,
                    height: 40.adaptSize,
                    imagePath: icon.value.filename ?? "icon".icon.svg,
                  ),
                ),
              ),
              suffixIcon: SizedBox(
                width: 150.h,
                height: 50.v,
                child: ElevatedButton(
                  onPressed: () {
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
                          width: 360.h,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "create_campaign".tr,
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
                                        if (controller.props.useState.value !=
                                            UseState.deleting) {
                                          Get.back();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16.v),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.h),
                                child: Text(
                                  "select_icon".tr,
                                  style: TextStyle(
                                    color: appTheme.redA700,
                                    fontSize: 12.fSize,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4.v),
                              const Divider(),
                              SizedBox(height: 16.v),
                              SizedBox(
                                height: 400.adaptSize,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Center(
                                    child: Obx(
                                      () {
                                        if (controller
                                                .propsIcons.useState.value ==
                                            UseState.loading) {
                                          return const CircularProgress(
                                            width: 12,
                                            height: 12,
                                          );
                                        } else if (controller
                                            .icons.value.isEmpty) {
                                          return const Text('No Record Found');
                                        } else {
                                          return Wrap(
                                            spacing: 8.adaptSize,
                                            runSpacing: 8.adaptSize,
                                            children: List.generate(
                                              controller.icons.value.length,
                                              (index) {
                                                return InkWell(
                                                  onTap: () {
                                                    controller.selectIcon(
                                                      controller
                                                          .icons.value[index],
                                                    );
                                                  },
                                                  child: CustomImageView(
                                                    imagePath: controller.icons
                                                        .value[index].filename,
                                                    width: 44.adaptSize,
                                                    height: 44.adaptSize,
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.v),
                              Padding(
                                padding: EdgeInsets.only(right: 8.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomElevatedButton(
                                      height: 32.v,
                                      width: 100.adaptSize,
                                      text: "cancel".tr,
                                      buttonStyle: CustomButtonStyles.fillGray,
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                    SizedBox(width: 8.v),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16.v),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4.adaptSize),
                        bottomRight: Radius.circular(4.adaptSize),
                      ),
                    ),
                  ),
                  child: Text('browse'.tr),
                ),
              )),
        ),
      ],
    );
  }

  Widget customSwitch({
    required String label,
    num width = 50,
    bool? value,
    required dynamic Function(bool) onChange,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.v),
        Text(
          label,
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
            fit: BoxFit.fill,
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
              title: "update_campaign".tr,
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
                        label: "name".tr,
                        hintText: 'name'.tr,
                        conn: controller.nameController,
                        validator: ValidatorCampaign.name,
                      ),
                      input(
                        maxLines: 4,
                        label: "campaign_description".tr,
                        hintText: 'campaign_description'.tr,
                        keyboardType: TextInputType.multiline,
                        conn: controller.descriptionController,
                        validator: ValidatorCampaign.description,
                      ),
                      Obx(() => browse(
                            icon: controller.icon,
                            //  validator: ValidatorCampaign.icon,
                          )),
                      Obx(
                        () => input(
                          readOnly: true,
                          label: "start_date_and_time".tr,
                          hintText: controller.startDate.value ??
                              'start_date_and_time'.tr,
                          conn: controller.startDateController,
                          onTap: () async {
                            DateTime? date = await Pickers.date(Get.context!);
                            TimeOfDay? time = await Pickers.time(Get.context!);
                            if (date != null && time == null) {
                              controller.startDate.value =
                                  '${date.format('yyyy-MM-dd')} 00:00:00';
                              controller.startDateController.text =
                                  '${date.format('yyyy-MM-dd')} 00:00:00';
                            }
                            if (date != null && time != null) {
                              controller.startDate.value =
                                  '${date.format('yyyy-MM-dd')} ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';
                              controller.startDateController.text =
                                  '${date.format('yyyy-MM-dd')} ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';
                            }
                          },
                          validator: ValidatorCampaign.startDateAndTime,
                        ),
                      ),
                      Obx(
                        () => input(
                          readOnly: true,
                          label: "end_date_and_time".tr,
                          hintText: controller.endDate.value ??
                              'end_date_and_time'.tr,
                          conn: controller.endDateController,
                          onTap: () async {
                            DateTime? date = await Pickers.date(Get.context!);
                            TimeOfDay? time = await Pickers.time(Get.context!);
                            if (date != null && time == null) {
                              controller.endDate.value =
                                  '${date.format('yyyy-MM-dd')} 00:00:00';
                              controller.endDateController.text =
                                  '${date.format('yyyy-MM-dd')} 00:00:00';
                            }
                            if (date != null && time != null) {
                              controller.endDate.value =
                                  '${date.format('yyyy-MM-dd')} ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';
                              controller.endDateController.text =
                                  '${date.format('yyyy-MM-dd')} ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';
                            }
                          },
                          validator: (input) {
                            return ValidatorCampaign.endDateAndTime(
                              input,
                              controller.startDateController.text,
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: (FIGMA_DESIGN_WIDTH * 0.42).h,
                            child: input(
                              label: 'target_amount'.tr,
                              hintText: 'target_amount'.tr,
                              conn: controller.targetAmountController,
                              validator: ValidatorCampaign.targetAmount,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: (FIGMA_DESIGN_WIDTH * 0.42).h,
                            child: input(
                              label: 'minimum_amount'.tr,
                              hintText: 'minimum_amount'.tr,
                              conn: controller.minimumAmountController,
                              validator: ValidatorCampaign.minimumAmount,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: (FIGMA_DESIGN_WIDTH * 0.42).h,
                            child: input(
                              label: 'fee'.tr,
                              hintText: 'fee'.tr,
                              conn: controller.feesController,
                              validator: ValidatorCampaign.fee,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(
                            width: (FIGMA_DESIGN_WIDTH * 0.42).h,
                            child: input(
                              label: 'sort_order'.tr,
                              hintText: 'sort_order'.tr,
                              conn: controller.sortOrderController,
                              keyboardType: TextInputType.number,
                              suffixConstraints: BoxConstraints(
                                minHeight: 39.adaptSize,
                                minWidth: 35.adaptSize,
                                maxHeight: 39.adaptSize,
                                maxWidth: 35.adaptSize,
                              ),
                              suffix: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12.adaptSize,
                                ),
                                child: CustomImageView(
                                  imagePath: "caret_up_down".icon.svg,
                                ),
                              ),
                              validator: ValidatorCampaign.sortOrder,
                            ),
                          )
                        ],
                      ),
                      Wrap(
                        spacing: 12.adaptSize,
                        runAlignment: WrapAlignment.spaceBetween,
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.end,
                        children: [
                          SizedBox(
                            width: (FIGMA_DESIGN_WIDTH * 0.45).h,
                            child: Obx(
                              () => customSwitch(
                                label: "status".tr,
                                value: controller.statusController.value,
                                onChange: (value) {
                                  controller.statusController.value = value;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: (FIGMA_DESIGN_WIDTH * 0.45).adaptSize,
                            child: Obx(
                              () => customSwitch(
                                label: "donation_campaign".tr,
                                value:
                                    controller.donationCampaignController.value,
                                onChange: (value) {
                                  controller.donationCampaignController.value =
                                      value;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: (FIGMA_DESIGN_WIDTH * 0.45).h,
                            child: Obx(
                              () => customSwitch(
                                label: "issue_tax_receipt".tr,
                                value:
                                    controller.issueTaxReceiptController.value,
                                onChange: (value) {
                                  controller.issueTaxReceiptController.value =
                                      value;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14.v),
                      Text(
                        "devices".tr,
                        style: TextStyle(
                          color: appTheme.gray80001,
                          fontSize: 16.fSize,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Obx(() {
                        if (controller.props.useState.value ==
                            UseState.loading) {
                          return SizedBox(
                            height: 100.v,
                            child: const Center(
                              child: CircularProgress(),
                            ),
                          );
                        } else {
                          if (controller.props.useState.value ==
                              UseState.error) {
                            return SizedBox(
                              height: 100.v,
                              child: const Center(
                                child: CircularProgress(),
                              ),
                            );
                          }

                          return Wrap(
                            spacing: 8.h,
                            alignment: WrapAlignment.spaceBetween,
                            runAlignment: WrapAlignment.spaceBetween,
                            children: List.generate(
                              controller.nodes.value.length,
                              (index) {
                                NodeData node = controller.nodes.value[index];
                                Rx<bool?> status = Rx(node.status);

                                return Obx(
                                  () => SizedBox(
                                    width: (FIGMA_DESIGN_WIDTH * 0.44).h,
                                    child: customSwitch(
                                      label: node.organizationDefinedName
                                          .toString(),
                                      value: status.value,
                                      onChange: (value) {
                                        status.value = value;
                                        controller.nodes.value[index].status =
                                            value;
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      }),
                      SizedBox(height: 14.v),
                      Obx(
                        () => CustomElevatedButton(
                          text: controller.props.useState.value ==
                                  UseState.updating
                              ? "".tr
                              : "update".tr,
                          leftIcon: controller.props.useState.value ==
                                  UseState.updating
                              ? CustomProgressButton(
                                  lable: 'processing'.tr,
                                )
                              : null,
                          onPressed: create,
                        ),
                      ),
                      SizedBox(height: 14.v),
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
