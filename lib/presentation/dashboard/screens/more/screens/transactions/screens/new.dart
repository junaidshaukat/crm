import 'package:flutter/material.dart';
import '/core/app_export.dart';

class NewTransactionScreen extends StatelessWidget {
  final controller = Get.put(NewTransactionController());
  final String? currencySymbol;
  final TransactionRouteName routeValues;

  NewTransactionScreen({
    super.key,
    this.currencySymbol,
    required this.routeValues,
  }) {
    controller.campaign.value = routeValues.activeCampaigns!.first;
  }

  Future<void> onPressed() async {
    Rx<UseState> useState = controller.props.useState;
    if (useState.value == UseState.none) {
      if (controller.formKey.currentState!.validate()) {
        WalletReq request = WalletReq(
          email: controller.emailController.text,
        );
        console.log(request.toJson(), force: true);

        await controller.wallet(request.toJson(), currencySymbol);
      }
    }
  }

  Widget listTile({
    Widget? suffix,
    String? control,
    String? hintText,
    List<DropDown>? items,
    bool readOnly = false,
    required String label,
    void Function()? onTap,
    EdgeInsets? contentPadding,
    void Function(String)? onChange,
    void Function(DropDown?)? onChanged,
    String? Function(String?)? validator,
    TextEditingController? textEditingController,
    TextInputType? keyboardType = TextInputType.text,
    TextInputAction? textInputAction = TextInputAction.next,
  }) {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: EdgeInsets.only(left: 3.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: appTheme.gray80001,
                fontSize: 14.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            if (control == "textbox")
              CustomTextFormField(
                onTap: onTap,
                suffix: suffix,
                readOnly: readOnly,
                hintText: hintText,
                onChanged: onChange,
                validator: validator,
                keyboardType: keyboardType,
                contentPadding: contentPadding,
                textInputAction: textInputAction,
                controller: textEditingController,
              ),
            if (control == "textarea")
              CustomTextFormField(
                maxLines: 4,
                suffix: suffix,
                readOnly: readOnly,
                hintText: hintText,
                onChanged: onChange,
                validator: validator,
                keyboardType: keyboardType,
                contentPadding: contentPadding,
                textInputAction: textInputAction,
                controller: textEditingController,
              ),
            if (control == "dropdown")
              SimpleDropDown(
                width: 340.h,
                height: 300,
                hintText: hintText,
                items: items,
                onSelected: onChanged,
              ),
            SizedBox(height: 13.v),
          ],
        ),
      ),
    );
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
          SimpleDropDown(
            height: 40,
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

  @override
  Widget build(BuildContext context) {
    console.log({
      'groupValue': controller.groupValue.value,
      'frequency': controller.frequency.value.value,
    }, force: true);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 64.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: AppbarWithBackAndFilter(
              back: true,
              title: "new_transaction".tr,
            ),
          ),
          SizedBox(height: 12.v),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              decoration: AppDecoration.outlinePrimary.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL28,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 14.v),
                      const CustomDivider(),
                      SizedBox(height: 19.v),
                      listTile(
                        control: "textbox",
                        label: "email_address".tr,
                        hintText: "enter_your_email_address".tr,
                        textInputAction: TextInputAction.done,
                        textEditingController: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: ValidatorNewTransaction.email,
                      ),
                      listTile(
                        label: "campaign".tr,
                        control: "dropdown",
                        hintText:
                            controller.campaign.value.label ?? "select...".tr,
                        validator: ValidatorNewTransaction.campaign,
                        items: routeValues.activeCampaigns?.map((campaign) {
                          return DropDown(
                            id: campaign.campaignTag,
                            title: campaign.label ?? '',
                            value: campaign,
                          );
                        }).toList(),
                        onChanged: (option) {
                          controller.campaign.value = option?.value;
                          controller.amountController.text =
                              "${option?.value.minimumAmount}";
                        },
                      ),
                      listTile(
                        label: "frequency".tr,
                        control: "dropdown",
                        hintText: controller.frequency.value.title,
                        validator: ValidatorNewTransaction.frequency,
                        items: controller.frequencies.map((frequency) {
                          return DropDown(
                            id: frequency.id,
                            title: frequency.title,
                            value: frequency,
                          );
                        }).toList(),
                        onChanged: (option) {
                          console.log(option?.value.value);
                          if (option?.value.value == "ONETIME") {
                            controller.startDate.value = null;
                          } else {
                            controller.startDate.value =
                                DateTime.now().format('yyyy-MM-dd');
                          }
                          controller.frequency.value = option?.value;
                        },
                      ),
                      Obx(() {
                        return listTile(
                          control: "textbox",
                          label:
                              "${"minimum_amount".tr}: $currencySymbol ${controller.campaign.value.minimumAmount ?? 0.00}",
                          hintText: "0.00",
                          textInputAction: TextInputAction.done,
                          textEditingController: controller.amountController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          validator: (input) {
                            num minimum =
                                controller.campaign.value.minimumAmount ?? 0;
                            num amount = 0;

                            if (input != null) {
                              amount = num.tryParse(input) ?? 0;
                              if (amount < minimum) {
                                return "${"amount_cannot_be_less_then".tr} $minimum";
                              }
                            }
                            return ValidatorNewTransaction.amount(input);
                          },
                        );
                      }),
                      Obx(() {
                        bool variation = controller.frequency.value.variation;
                        if (variation) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "no_of_donations".tr,
                                style: TextStyle(
                                  color: appTheme.gray80001,
                                  fontSize: 14.fSize,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              RadioListTile(
                                value: 'static',
                                groupValue: controller.groupValue.value,
                                title: Text(
                                  'make_this_a_recurring_transaction'.tr,
                                  style: TextStyle(
                                    color: appTheme.gray80001,
                                    fontSize: 14.fSize,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                onChanged: (value) {
                                  controller.groupValue.value = value!;
                                  if (controller.frequency.value.value ==
                                      "ONETIME") {
                                    controller.noOfRecurringController.text =
                                        '1';
                                    controller.frequency.value.noOfRecurring =
                                        1;
                                  }
                                  if (controller.frequency.value.value ==
                                      "DAILY") {
                                    controller.noOfRecurringController.text =
                                        '1';
                                    controller.frequency.value.noOfRecurring =
                                        1;
                                  }
                                  if (controller.frequency.value.value ==
                                      "WEEKLY") {
                                    controller.noOfRecurringController.text =
                                        '1';
                                    controller.frequency.value.noOfRecurring =
                                        1;
                                  }
                                  if (controller.frequency.value.value ==
                                      "BIWEEKLY") {
                                    controller.noOfRecurringController.text =
                                        '1';
                                    controller.frequency.value.noOfRecurring =
                                        1;
                                  }
                                  if (controller.frequency.value.value ==
                                      "MONTHLY") {
                                    controller.noOfRecurringController.text =
                                        '1';
                                    controller.frequency.value.noOfRecurring =
                                        1;
                                  }
                                },
                                fillColor:
                                    WidgetStateProperty.resolveWith<Color>(
                                  (Set<WidgetState> states) {
                                    if (states.contains(WidgetState.selected)) {
                                      return appTheme.primary;
                                    }
                                    return appTheme.gray500;
                                  },
                                ),
                              ),
                              RadioListTile(
                                title: Text(
                                  'specify_number_of_recurring'.tr,
                                  style: TextStyle(
                                    color: appTheme.gray80001,
                                    fontSize: 14.fSize,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                value: 'variation',
                                groupValue: controller.groupValue.value,
                                onChanged: (value) {
                                  controller.groupValue.value = value!;
                                  if (controller.frequency.value.value ==
                                      "ONETIME") {
                                    controller.noOfRecurringController.text =
                                        '1';
                                    controller.frequency.value.noOfRecurring =
                                        1;
                                  }
                                  if (controller.frequency.value.value ==
                                      "DAILY") {
                                    controller.noOfRecurringController.text =
                                        '30';
                                    controller.frequency.value.noOfRecurring =
                                        30;
                                  }
                                  if (controller.frequency.value.value ==
                                      "WEEKLY") {
                                    controller.noOfRecurringController.text =
                                        '52';
                                    controller.frequency.value.noOfRecurring =
                                        52;
                                  }
                                  if (controller.frequency.value.value ==
                                      "BIWEEKLY") {
                                    controller.noOfRecurringController.text =
                                        '26';
                                    controller.frequency.value.noOfRecurring =
                                        26;
                                  }
                                  if (controller.frequency.value.value ==
                                      "MONTHLY") {
                                    controller.noOfRecurringController.text =
                                        '12';
                                    controller.frequency.value.noOfRecurring =
                                        12;
                                  }
                                },
                                fillColor:
                                    WidgetStateProperty.resolveWith<Color>(
                                  (Set<WidgetState> states) {
                                    if (states.contains(WidgetState.selected)) {
                                      return appTheme.primary;
                                    }
                                    return appTheme.gray500;
                                  },
                                ),
                              ),
                              Obx(
                                () => Visibility(
                                  visible:
                                      controller.groupValue.value == "variation"
                                          ? true
                                          : false,
                                  child: listTile(
                                    control: "textbox",
                                    label: 'minimum_recurrings_02'.tr,
                                    hintText: "times",
                                    textInputAction: TextInputAction.done,
                                    textEditingController:
                                        controller.noOfRecurringController,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                      decimal: false,
                                      signed: false,
                                    ),
                                    onChange: (input) {
                                      controller.frequency.value.noOfRecurring =
                                          num.tryParse(input) ?? 1;
                                    },
                                    validator:
                                        ValidatorNewTransaction.noOfRecurring,
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox();
                        }
                      }),
                      Obx(() {
                        String frequency = controller.frequency.value.value;
                        if (frequency != 'ONETIME') {
                          return listTile(
                            readOnly: true,
                            control: "textbox",
                            label: "start_date".tr,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              return ValidatorNewTransaction.startDate(
                                value,
                                isRequired: true,
                              );
                            },
                            hintText:
                                controller.startDate.value ?? 'start_date'.tr,
                            textEditingController:
                                controller.startDateController,
                            suffix: IconButton(
                              onPressed: controller.clearStartDateController,
                              icon: const Icon(Icons.clear),
                            ),
                            onTap: () {
                              pickers
                                  .date(Get.context!, firstDate: DateTime.now())
                                  .then((date) {
                                if (date != null) {
                                  controller.startDate.value =
                                      date.format('yyyy-MM-dd');
                                  controller.startDateController.text =
                                      date.format('yyyy-MM-dd');
                                }
                              });
                            },
                          );
                        }
                        return const SizedBox.shrink();
                      }),
                      listTile(
                        label: "note".tr,
                        control: "textarea",
                        hintText: "write_here...".tr,
                        textInputAction: TextInputAction.done,
                        textEditingController: controller.userNotesController,
                        keyboardType: TextInputType.text,
                        validator: ValidatorNewTransaction.notes,
                      ),
                      Obx(() {
                        return CustomElevatedButton(
                          text: controller.props.useState.value == UseState.none
                              ? "next".tr
                              : "",
                          leftIcon:
                              controller.props.useState.value == UseState.none
                                  ? null
                                  : CustomProgressButton(
                                      lable: 'processing'.tr,
                                    ),
                          onPressed: onPressed,
                        );
                      }),
                      SizedBox(height: 80.v)
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
