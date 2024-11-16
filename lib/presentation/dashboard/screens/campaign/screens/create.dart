import 'package:flutter/material.dart';

import '/core/app_export.dart';

class CreateCampaignScreen extends StatelessWidget {
  CreateCampaignScreen(this.event, {super.key});
  final controller = Get.put(CreateCampaignController());
  final void Function(dynamic)? event;

  Future<void> create() async {
    if (controller.formKey.currentState!.validate()) {
      CampaignCreateReq request = CampaignCreateReq(
        amounts: controller.amounts,
        nodes: controller.nodes.value,
        frequency: controller.frequency,
        name: controller.nameController.text,
        fees: controller.feesController.text,
        status: controller.statusController.value,
        hidden: controller.hiddenController.value,
        endDate: controller.endDateController.text,
        recurringDay: controller.recurringDay.value,
        startDate: controller.startDateController.text,
        sortOrder: controller.sortOrderController.text,
        description: controller.descriptionController.text,
        iconTag: controller.icon.value.tagNumber.toString(),
        targetAmount: controller.targetAmountController.text,
        minimumAmount: controller.minimumAmountController.text,
        enableQuantity: controller.enableQuantityController.value,
        taxReceiptRatio: controller.taxReceiptRatioController.text,
        issueTaxReceipt: controller.issueTaxReceiptController.value,
        donationCampaign: controller.donationCampaignController.value,
        allowRecurringModification:
            controller.allowRecurringModificationController.value,
      );
      await controller.create(request.toJson(), event);
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
            fontSize: 13.fSize,
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
            textStyle: TextStyle(
              color: appTheme.gray80001,
              fontSize: 13.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
            ),
            hintStyle: TextStyle(
              color: appTheme.gray80001,
              fontSize: 13.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
            ),
            borderDecoration: OutlineInputBorder(
              borderSide: BorderSide(
                color: appTheme.gray400,
              ),
            ),
          ),
        if (dropDown)
          SimpleDropDown2(
            height: 45.v,
            hintText: hintText,
            icon: CustomImageView(
              imagePath: "dropdown".icon.svg,
              height: 23.v,
              width: 34.h,
            ),
            items: items,
            onSelected: onChanged,
          ),
        SizedBox(height: 4.adaptSize),
      ],
    );
  }

  Widget browse({
    TextEditingController? conn,
    required Rx<IconsData> icon,
    String? Function(String?)? validator,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4.v),
        Padding(
          padding: EdgeInsets.only(left: 4.h),
          child: Text(
            "icon".tr,
            style: TextStyle(
              color: appTheme.gray80001,
              fontSize: 14.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 2.v),
        TextFormField(
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: true,
          controller: conn,
          obscureText: true,
          obscuringCharacter: " ",
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
                    height: 40.v,
                    fit: BoxFit.contain,
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
                        contentPadding: EdgeInsets.all(12.h),
                        backgroundColor: Colors.transparent,
                        insetPadding: EdgeInsets.only(bottom: 0.v),
                        content: Container(
                          width: double.maxFinite,
                          decoration: AppDecoration.fillPrimary.copyWith(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.h),
                              topRight: Radius.circular(12.h),
                            ),
                          ),
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
                                    topLeft: Radius.circular(12.h),
                                    topRight: Radius.circular(12.h),
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
                                      width: 15.h,
                                      height: 15.v,
                                      imagePath: "close".icon.svg,
                                      svgColor: appTheme.whiteA700,
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
                                height: 400.v,
                                width: double.maxFinite,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Center(
                                    child: Obx(
                                      () {
                                        if (controller
                                                .propsIcons.useState.value ==
                                            UseState.loading) {
                                          return SizedBox(
                                            height: 400.v,
                                            width: double.maxFinite,
                                            child: CircularProgress(
                                              width: 24.adaptSize,
                                              height: 24.adaptSize,
                                            ),
                                          );
                                        } else if (controller
                                            .icons.value.isEmpty) {
                                          return Text("no_records_found".tr);
                                        } else {
                                          return Wrap(
                                            spacing: 8.h,
                                            runSpacing: 8.v,
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
                                                    width: 44.h,
                                                    height: 44.v,
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
                                      width: 100.h,
                                      height: 32.v,
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
                        topRight: Radius.circular(4.h),
                        bottomRight: Radius.circular(4.h),
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
    bool? value,
    num width = 160,
    required String label,
    required dynamic Function(bool) onChange,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.v),
        SizedBox(
          width: width.h,
          child: Text(
            label,
            style: TextStyle(
              color: appTheme.gray80001,
              fontSize: 12.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 2.v),
        SizedBox(
          width: 50.h,
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
              title: "add_campaign".tr,
            ),
          ),
          SizedBox(height: 16.v),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.v),
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
                            conn: controller.iconController,
                            validator: ValidatorCampaign.icon,
                          )),
                      Obx(
                        () => input(
                          readOnly: true,
                          label: "start_date_and_time".tr,
                          hintText: controller.startDate.value ??
                              'start_date_and_time'.tr,
                          conn: controller.startDateController,
                          suffix: IconButton(
                            onPressed: controller.clearStartDateController,
                            icon: const Icon(Icons.clear),
                          ),
                          onTap: () async {
                            DateTime? date = await pickers.date(Get.context!);
                            TimeOfDay? time = await pickers.time(Get.context!);
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
                          suffix: IconButton(
                            onPressed: controller.clearEndDateController,
                            icon: const Icon(Icons.clear),
                          ),
                          onTap: () async {
                            DateTime? date = await pickers.date(Get.context!);
                            TimeOfDay? time = await pickers.time(Get.context!);
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
                      input(
                        readOnly: true,
                        label: "amounts".tr,
                        hintText: 'configure_amounts'.tr,
                        onTap: () {
                          Rx<List<String>> temp =
                              Rx<List<String>>(List.from(controller.amounts));
                          final TextEditingController amount =
                              TextEditingController();

                          Get.bottomSheet(
                            persistent: false,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.adaptSize),
                                topRight: Radius.circular(20.adaptSize),
                              ),
                            ),
                            Container(
                              width: double.maxFinite,
                              height: (fdh * 0.9).adaptSize,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.h, vertical: 5.v),
                              decoration: AppDecoration.outlineBluegray100011,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 8.v),
                                    // Header
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                          svgColor: Colors.black,
                                          imagePath: "back".icon.svg,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize,
                                          onTap: () {
                                            Get.back();
                                          },
                                        ),
                                        SizedBox(width: 24.h),
                                        Text(
                                          "add_amounts".tr,
                                          style: TextStyle(
                                            color: appTheme.black900,
                                            fontSize: 20.fSize,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 11.v),
                                    // Input Row
                                    Text(
                                      "amount".tr,
                                      style: TextStyle(
                                        color: appTheme.black900,
                                        fontSize: 15.fSize,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            height: 48.v,
                                            child: Input(
                                              controller: amount,
                                              hintText: "enter_amount".tr,
                                              keyboardType: const TextInputType
                                                  .numberWithOptions(
                                                  decimal: true),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8.h),
                                        SizedBox(
                                          height: 48.v,
                                          child: InkWell(
                                            onTap: () {
                                              if (amount.text.isNotEmpty) {
                                                temp.value = [
                                                  ...temp.value,
                                                  amount.text
                                                ];
                                                amount.clear();
                                              } else {
                                                Get.snackbar(
                                                  "Error",
                                                  "Amount cannot be empty",
                                                  snackPosition:
                                                      SnackPosition.BOTTOM,
                                                );
                                              }
                                            },
                                            child: CustomImageView(
                                              height: 48.v,
                                              imagePath: 'plus'.icon.svg,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16.v),
                                    // List of Amounts
                                    Obx(() => temp.value.isNotEmpty
                                        ? Column(
                                            children: temp.value
                                                .map(
                                                  (amount) => ListTile(
                                                    title: Text(amount),
                                                    trailing: IconButton(
                                                      icon: Icon(Icons.delete),
                                                      onPressed: () {
                                                        temp.value = List.from(
                                                            temp.value)
                                                          ..remove(amount);
                                                      },
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          )
                                        : Text("No amounts added yet")),
                                    SizedBox(height: 16.v),
                                    // Buttons
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 6.h),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: CustomElevatedButton(
                                              text: "cancel".tr,
                                              margin:
                                                  EdgeInsets.only(right: 4.h),
                                              buttonStyle:
                                                  CustomButtonStyles.fillGray,
                                              onPressed: () {
                                                Get.back();
                                                Get.snackbar(
                                                  "Canceled",
                                                  "Changes were not saved",
                                                  snackPosition:
                                                      SnackPosition.BOTTOM,
                                                );
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: CustomElevatedButton(
                                              text: "done".tr,
                                              margin:
                                                  EdgeInsets.only(left: 4.h),
                                              onPressed: () {
                                                controller.amounts.value =
                                                    temp.value;
                                                Get.back();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 175.h,
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
                            width: 175.h,
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
                            width: 175.h,
                            child: input(
                              label: 'fee'.tr,
                              hintText: 'fee'.tr,
                              conn: controller.feesController,
                              validator: ValidatorCampaign.fee,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 175.h,
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
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 175.h,
                            child: input(
                              label: 'tax_receipt_ratio'.tr,
                              hintText: 'tax_receipt_ratio'.tr,
                              conn: controller.taxReceiptRatioController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
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
                              validator: ValidatorCampaign.taxReceiptRatio,
                            ),
                          ),
                          Obx(() {
                            bool isEnable =
                                controller.frequency.contains('WEEKLY');
                            return SizedBox(
                              width: 175.h,
                              child: input(
                                dropDown: true,
                                label: 'recurring_day'.tr,
                                hintText: controller.recurringDay.value ??
                                    'recurring_day'.tr,
                                onChanged: isEnable
                                    ? (option) {
                                        controller.recurringDay.value =
                                            option?.value;
                                      }
                                    : null,
                                items: DateTime.now()
                                    .dayOfWeekNames
                                    .map((e) => DropDown(
                                          id: e,
                                          title: e,
                                          value: e,
                                        ))
                                    .toList(),
                              ),
                            );
                          }),
                        ],
                      ),
                      Wrap(
                        spacing: 8.h,
                        runSpacing: 2.v,
                        crossAxisAlignment: WrapCrossAlignment.end,
                        children: [
                          SizedBox(
                            width: 175.h,
                            child: Obx(
                              () => customSwitch(
                                width: 175.h,
                                label: "status".tr,
                                value: controller.statusController.value,
                                onChange: (value) {
                                  controller.statusController.value = value;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 175.h,
                            child: Obx(
                              () => customSwitch(
                                width: 175.h,
                                label: "hidden".tr,
                                value: controller.hiddenController.value,
                                onChange: (value) {
                                  controller.hiddenController.value = value;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 175.h,
                            child: Obx(
                              () => customSwitch(
                                width: 175.h,
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
                            width: 175.h,
                            child: Obx(
                              () => customSwitch(
                                width: 175.h,
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
                          SizedBox(
                            width: 175.h,
                            child: Obx(
                              () => customSwitch(
                                width: 175.h,
                                label: "allow_recurring_changes".tr,
                                value: controller
                                    .allowRecurringModificationController.value,
                                onChange: (value) {
                                  controller
                                      .allowRecurringModificationController
                                      .value = value;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 175.h,
                            child: Obx(
                              () => customSwitch(
                                width: 175.h,
                                label: "enable_quantity".tr,
                                value:
                                    controller.enableQuantityController.value,
                                onChange: (value) {
                                  controller.enableQuantityController.value =
                                      value;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14.v),
                      Text(
                        'frequency'.tr,
                        style: TextStyle(
                          color: appTheme.gray80001,
                          fontSize: 13.fSize,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 2.adaptSize),
                      Wrap(
                        alignment: WrapAlignment.start,
                        children: List.generate(
                          controller.frequencies.length,
                          (index) {
                            String frequency = controller.frequencies[index];
                            return Obx(() {
                              bool isSelected =
                                  controller.frequency.contains(frequency);
                              return InkWell(
                                onTap: () {
                                  if (isSelected) {
                                    controller.frequency.remove(frequency);
                                  } else {
                                    controller.frequency.add(frequency);
                                  }
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      value: isSelected,
                                      onChanged: (checked) {
                                        if (isSelected) {
                                          controller.frequency
                                              .remove(frequency);
                                        } else {
                                          controller.frequency.add(frequency);
                                        }
                                      },
                                    ),
                                    Text(frequency),
                                  ],
                                ),
                              );
                            });
                          },
                        ),
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
                        if (controller.propsNodes.useState.value ==
                            UseState.loading) {
                          return SizedBox(
                            height: 100.v,
                            child: const Center(
                              child: CircularProgress(),
                            ),
                          );
                        } else {
                          if (controller.propsNodes.useState.value ==
                              UseState.error) {
                            return SizedBox(
                              height: 100.adaptSize,
                              child: const Center(
                                child: CircularProgress(),
                              ),
                            );
                          }
                          return Wrap(
                            spacing: 8.h,
                            runSpacing: 2.v,
                            crossAxisAlignment: WrapCrossAlignment.end,
                            children: List.generate(
                              controller.nodes.value.length,
                              (index) {
                                NodeData node = controller.nodes.value[index];
                                Rx<bool?> status = Rx(node.status);
                                return Obx(
                                  () => SizedBox(
                                    width: 175.h,
                                    child: customSwitch(
                                      width: 175.h,
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
                          text: controller.props.useState.value == UseState.none
                              ? "create".tr
                              : "",
                          leftIcon:
                              controller.props.useState.value == UseState.none
                                  ? null
                                  : CustomProgressButton(
                                      lable: 'processing'.tr,
                                    ),
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
