import 'package:flutter/material.dart';

import '/core/app_export.dart';

class ConfirmScreen extends StatelessWidget {
  final controller = Get.put(ConfirmController());
  final WalletData wallet;
  final Map<String, dynamic> requestData;
  final String email;
  final String notes;
  final String amount;
  final String? currencySymbol;
  final Frequency frequency;
  final ActiveCampaign campaign;
  final List<WalletData> wallets;

  ConfirmScreen({
    super.key,
    required this.wallet,
    required this.requestData,
    required this.email,
    required this.notes,
    required this.amount,
    required this.campaign,
    required this.frequency,
    required this.wallets,
    required this.currencySymbol,
  }) {
    controller.amount.value = num.parse(amount);
  }

  Future<void> onPressed() async {
    Rx<UseState> useState = controller.props.useState;
    if (useState.value == UseState.none) {
      TransactionReq request = TransactionReq(
        amount: controller.amount.value.toStringAsFixed(2),
        billingPeriod: frequency.value,
        campaignTag: campaign.value,
        cardHolderName: wallet.name,
        cardId: wallet.cardId,
        cardNumber: wallet.number,
        email: email,
        expiryMonth: wallet.expiryMonth,
        expiryYear: wallet.expiryYear,
        fee: controller.fees.value.toStringAsFixed(2),
        function: wallet.function,
        noOfRecurring: frequency.noOfRecurring,
        source: wallet.source,
        userNotes: notes,
        ccv: wallet.ccv,
        saveCard: wallet.saveCard,
      );

      await controller.create(request.toJson());
    }
  }

  Widget input({
    String? label,
    String? hintText,
    String? control,
    bool? value,
    TextEditingController? conn,
    bool dropDown = false,
    List<DropDown>? items,
    String? Function(String?)? validator,
    void Function(DropDown?)? onChanged,
    void Function(bool)? onChange,
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
        if (control == "textbox")
          CustomTextFormField(
            readOnly: true,
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
        if (control == "dropdown")
          SimpleDropDown(
            height: 40.adaptSize,
            hintText: hintText,
            icon: CustomImageView(
              imagePath: "dropdown".icon.svg,
            ),
            items: items,
            onChanged: onChanged,
          ),
        if (control == 'switch')
          CustomSwitch(
            value: value,
            alignment: Alignment.bottomLeft,
            onChange: onChange!,
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
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: AppbarWithBackAndFilter(
              back: true,
              title: "Confirm Transaction".tr,
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
                child: Column(
                  children: [
                    SizedBox(height: 12.v),
                    const CustomDivider(),
                    SizedBox(height: 12.v),
                    Text(
                      "Total",
                      style: CustomTextStyles.titleMediumPoppinsGray80001_1,
                    ),
                    SizedBox(height: 6.v),
                    Obx(
                      () => Text(
                        "$currencySymbol ${controller.amount.value.toStringAsFixed(2)}",
                        style: CustomTextStyles.titleLargeGray80001,
                      ),
                    ),
                    SizedBox(height: 6.v),
                    Divider(indent: 7.h, endIndent: 7.h),
                    SizedBox(height: 6.v),
                    SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        "Other Information",
                        textAlign: TextAlign.left,
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(height: 6.v),
                    input(
                      control: "textbox",
                      label: "Card holder Name",
                      hintText: "${wallet.name}",
                    ),
                    SizedBox(height: 6.v),
                    input(
                      control: "textbox",
                      label: "Card Number",
                      hintText: "${wallet.number}",
                    ),
                    SizedBox(height: 6.v),
                    input(
                      control: "textbox",
                      label: "Donor Email",
                      hintText: email,
                    ),
                    SizedBox(height: 6.v),
                    input(
                      control: "textbox",
                      label: "Campaign",
                      hintText: "${campaign.label}",
                    ),
                    SizedBox(height: 6.v),
                    Row(
                      children: [
                        Expanded(
                          child: input(
                            control: "textbox",
                            label: "Billing Period",
                            hintText: frequency.title,
                          ),
                        ),
                        SizedBox(width: 12.h),
                        Expanded(
                          child: input(
                            control: "textbox",
                            label: "No. Of Recurring",
                            hintText: "${frequency.noOfRecurring}",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.v),
                    if (campaign.fees! > 0)
                      Obx(
                        () => input(
                          control: "textbox",
                          label: "Fee",
                          hintText: controller.fees.value.toStringAsFixed(2),
                        ),
                      ),
                    if (campaign.fees! > 0)
                      Obx(() {
                        return input(
                          control: "switch",
                          hintText: frequency.title,
                          label: "Cover Transaction Costs",
                          value: controller.coverTransactionCosts.value,
                          onChange: (value) {
                            num total = 0.00;
                            controller.coverTransactionCosts.value = value;
                            if (value == true) {
                              num fees = controller.percentage(
                                campaign.fees!,
                                num.parse(amount),
                              );
                              controller.fees.value = fees;
                              controller.amount.value =
                                  fees + num.parse(amount);
                            } else {
                              controller.fees.value = 0.00;
                              total = num.parse(amount);
                              controller.amount.value = total;
                            }
                          },
                        );
                      }),
                    if (campaign.fees! > 0) SizedBox(height: 6.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            text: "Back",
                            buttonStyle: CustomButtonStyles.fillGray,
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                        SizedBox(width: 16.h),
                        Expanded(
                          child: Obx(
                            () => CustomElevatedButton(
                              text: controller.props.useState.value ==
                                      UseState.none
                                  ? "confirm".tr
                                  : "",
                              leftIcon: controller.props.useState.value ==
                                      UseState.none
                                  ? null
                                  : CustomProgressButton(
                                      lable: 'processing'.tr,
                                    ),
                              onPressed: onPressed,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.v)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
