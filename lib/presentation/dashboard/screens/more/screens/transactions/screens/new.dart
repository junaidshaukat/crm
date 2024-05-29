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
        await controller.wallet(request.toJson(), currencySymbol);
      }
    }
  }

  Widget listTile({
    required String label,
    String? hintText,
    String? control,
    List<DropDown>? items,
    TextEditingController? textEditingController,
    TextInputType? keyboardType = TextInputType.text,
    TextInputAction? textInputAction = TextInputAction.next,
    String? Function(String?)? validator,
    void Function(DropDown?)? onChanged,
    void Function(String)? onChange,
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
                hintText: hintText,
                validator: validator,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                controller: textEditingController,
                onChanged: onChange,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 16.v,
                ),
              ),
            if (control == "textarea")
              CustomTextFormField(
                maxLines: 4,
                hintText: hintText,
                validator: validator,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                controller: textEditingController,
                onChanged: onChange,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 16.v,
                ),
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

  @override
  Widget build(BuildContext context) {
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
                          controller.frequency.value = option?.value;
                        },
                      ),
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
                      Obx(
                        () => listTile(
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
                        ),
                      ),
                      listTile(
                        label: "note".tr,
                        control: "textarea",
                        hintText: "write_here...".tr,
                        textInputAction: TextInputAction.done,
                        textEditingController: controller.userNotesController,
                        keyboardType: TextInputType.text,
                        validator: ValidatorNewTransaction.notes,
                      ),
                      SizedBox(height: 16.v),
                      Obx(
                        () => CustomElevatedButton(
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
                        ),
                      ),
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
