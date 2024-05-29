import 'package:flutter/material.dart';

import '/core/app_export.dart';

class ConfirmScreen extends StatelessWidget {
  final controller = Get.put(ConfirmController());
  final TransactionReq request;

  ConfirmScreen({
    super.key,
    required this.request,
  }) {
    controller.amount.value = num.parse(request.amount);
  }

  String get total {
    double amount = double.parse(request.amount);
    double fees = double.parse(controller.fees.value);

    return (amount + fees).toStringAsFixed(2);
  }

  Future<void> onPressed() async {
    Rx<UseState> useState = controller.props.useState;
    if (useState.value == UseState.none) {
      request.amount = total;

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
        if (control == "textbox")
          CustomTextFormField(
            readOnly: true,
            controller: conn,
            hintText: "$hintText".tr,
            validator: validator,
            fillColor: appTheme.gray10001,
            contentPadding: contentPadding,
            borderDecoration: OutlineInputBorder(
              borderSide: BorderSide(
                color: appTheme.gray400,
              ),
            ),
          ),
        if (control == "dropdown")
          SimpleDropDown(
            //height: 40.adaptSize,
            hintText: hintText,
            icon: CustomImageView(
              imagePath: "dropdown".icon.svg,
            ),
            items: items,
            onSelected: onChanged,
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
              title: "confirm_transaction".tr,
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
                      "total".tr,
                      style: CustomTextStyles.titleMediumPoppinsGray80001_1,
                    ),
                    SizedBox(height: 6.v),
                    Obx(
                      () {
                        return Text(
                          "${request.currencySymbol} $total",
                          style: CustomTextStyles.titleLargeGray80001,
                        );
                      },
                    ),
                    SizedBox(height: 6.v),
                    Divider(indent: 7.h, endIndent: 7.h),
                    SizedBox(height: 6.v),
                    SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        "other_information".tr,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(height: 6.v),
                    input(
                      control: "textbox",
                      label: "card_holder_name".tr,
                      hintText: "${request.cardHolderName}",
                    ),
                    SizedBox(height: 6.v),
                    input(
                      control: "textbox",
                      label: "card_number".tr,
                      hintText: "${request.cardNumber}",
                    ),
                    SizedBox(height: 6.v),
                    input(
                      control: "textbox",
                      label: "donor_email".tr,
                      hintText: request.email,
                    ),
                    SizedBox(height: 6.v),
                    input(
                      control: "textbox",
                      label: "campaign".tr,
                      hintText: "${request.campaign}",
                    ),
                    SizedBox(height: 6.v),
                    Row(
                      children: [
                        Expanded(
                          child: input(
                            control: "textbox",
                            label: "billing_period".tr,
                            hintText: request.billingPeriod,
                          ),
                        ),
                        if (request.noOfRecurring > 1) SizedBox(width: 12.h),
                        if (request.noOfRecurring > 1)
                          Expanded(
                            child: input(
                              control: "textbox",
                              label: "no_of_recurring".tr,
                              hintText: "${request.noOfRecurring}",
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 6.v),
                    Row(
                      children: [
                        Expanded(
                          child: input(
                            control: "textbox",
                            label: "${"amount".tr} ${request.currencySymbol}",
                            hintText: request.amount,
                          ),
                        ),
                        if (request.fees > 0) SizedBox(width: 12.h),
                        if (request.fees > 0)
                          Expanded(
                            child: Obx(
                              () => input(
                                control: "textbox",
                                label: "${"fee".tr} ${request.currencySymbol}",
                                hintText: controller.fees.value,
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 6.v),
                    if (request.fees > 0)
                      Obx(() {
                        return input(
                          control: "switch",
                          label: "cover_transaction_costs".tr,
                          value: controller.coverTransactionCosts.value,
                          onChange: (value) {
                            controller.coverTransactionCosts.value = value;
                            if (value == true) {
                              String fees = controller.percentage(
                                request.fees,
                                num.parse(request.amount),
                              );
                              controller.fees.value = fees;
                              request.fee = fees;
                            } else {
                              controller.fees.value = '0.00';
                              request.fee = '0.00';
                            }
                          },
                        );
                      }),
                    if (request.fees > 0) SizedBox(height: 6.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            text: "back".tr,
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
