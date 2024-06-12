import 'package:flutter/material.dart';
import '/core/app_export.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final Transaction transaction;
  final String currencySymbol;
  final controller = Get.put(TransactionsController());

  TransactionDetailsScreen({
    super.key,
    required this.transaction,
    required this.currencySymbol,
  }) {
    controller.email.text = transaction.email ?? '';
  }

  void onUpdateEmail({required void Function(Transaction res) update}) {
    controller.email.text = transaction.email ?? '';
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
          child: Form(
            key: controller.formKey,
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
                        "update_email".tr,
                        style: TextStyle(
                          color: appTheme.whiteA700,
                          fontSize: 12.fSize,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CustomImageView(
                        imagePath: "close".icon.svg,
                        svgColor: appTheme.whiteA700,
                        onTap: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 0.v),
                  child: CustomTextFormField(
                    hintText: "email_address".tr,
                    keyboardType: TextInputType.emailAddress,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.h,
                      vertical: 16.v,
                    ),
                    validator: (input) {
                      return Validator.email(input, isRequired: false);
                    },
                    controller: controller.email,
                  ),
                ),
                SizedBox(height: 4.v),
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
                          if (controller.props.useState.value !=
                              UseState.updating) {
                            Get.back();
                          }
                        },
                      ),
                      SizedBox(width: 8.v),
                      CustomElevatedButton(
                        height: 32.v,
                        width: 100.h,
                        text: "update".tr,
                        buttonStyle: CustomButtonStyles.fillRedA.copyWith(
                          backgroundColor: WidgetStateProperty.resolveWith(
                            (states) => appTheme.primary,
                          ),
                        ),
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.updateEmail(
                              email: controller.email.text,
                              tagNumber: transaction.transactionTag,
                              callback: () {
                                transaction.email = controller.email.text;
                                update(transaction);
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listTile({required String label, required String value}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: CustomTextStyles.labelLargePoppinsGray900.copyWith(
                color: appTheme.gray900,
              ),
            ),
            SizedBox(width: 12.h),
            Expanded(
              // width: 200.h,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  value,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: CustomTextStyles.bodySmallGray900.copyWith(
                    color: appTheme.gray900,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.v),
        const Divider(),
        SizedBox(height: 12.v),
      ],
    );
  }

  bool get enable {
    if (transaction.email != null) {
      const pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(pattern);
      if (!regExp.hasMatch(transaction.email ?? '')) {
        return false;
      } else {
        return true;
      }
    }
    return false;
  }

  String isEmail(input) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(input ?? '')) {
      return '';
    } else {
      return input;
    }
  }

  Future<void> sendInvoice() async {
    await controller.sendInvoice(
      tagNumber: transaction.transactionTag,
    );
  }

  String get amount {
    double total = transaction.approvedAmount?.toDouble() ?? 0.00;
    double fee = transaction.fee?.toDouble() ?? 0.00;

    return (total - fee).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    console.log(transaction.toJson());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 64.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: AppbarWithBackAndFilter(
              back: true,
              title: "transaction_details".tr,
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
                child: Obx(() {
                  Rx<Transaction> data = Rx(transaction);
                  UseState useState = controller.props.useState.value;
                  UseError error = controller.props.error.value;

                  if (useState == UseState.none ||
                      useState == UseState.loading) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [CircularProgress()],
                    );
                  }

                  if (error.message != null) {
                    return TryAgain(
                      message: error.message,
                      tryAgain: controller.tryAgain,
                    );
                  }

                  return Column(
                    children: [
                      SizedBox(height: 14.v),
                      const CustomDivider(),
                      SizedBox(height: 24.v),
                      SizedBox(height: 12.v),
                      Text(
                        "total".tr,
                        style: CustomTextStyles.titleMediumPoppinsGray80001_1,
                      ),
                      SizedBox(height: 6.v),
                      Text(
                        "$currencySymbol ${data.value.approvedAmount?.toStringAsFixed(2)}",
                        style: CustomTextStyles.titleLargeGray80001,
                      ),
                      SizedBox(height: 6.v),
                      Divider(indent: 7.h, endIndent: 7.h),
                      SizedBox(height: 6.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: listTile(
                          label: "email_address".tr,
                          value: isEmail(data.value.email),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: listTile(
                          label: "campaign".tr,
                          value: data.value.campaign ?? '',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: listTile(
                          label: "amount".tr,
                          value: "$currencySymbol$amount",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: listTile(
                          label: "fee".tr,
                          value:
                              "$currencySymbol${data.value.fee?.toStringAsFixed(2)}",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: listTile(
                          label: "invoice".tr,
                          value: "${data.value.invoice}",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: listTile(
                          label: "date".tr,
                          value: "${data.value.createDatetime}",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: listTile(
                          label: "channel_name".tr,
                          value: "${data.value.nodeName}",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: listTile(
                          label: "account".tr,
                          value: "${data.value.cardAccount}",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: listTile(
                          label: "tender_type".tr,
                          value: "${data.value.cardType}",
                        ),
                      ),
                      if (data.value.startDate != null)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: listTile(
                            label: "start_date".tr,
                            value: "${data.value.startDate}",
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 8.v, bottom: 7.v),
                              child: SizedBox(
                                width: 115.h,
                                child: Divider(
                                  color: appTheme.blueGray90002,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 13.h),
                              child: Text(
                                "actions".tr,
                                style: CustomTextStyles
                                    .labelLargePoppinsPrimarySemiBold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.v, bottom: 7.v),
                              child: SizedBox(
                                width: 128.h,
                                child: Divider(
                                  color: appTheme.blueGray90002,
                                  indent: 13.h,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIconButton(
                            height: 48.adaptSize,
                            width: 48.adaptSize,
                            padding: EdgeInsets.all(12.h),
                            decoration: IconButtonStyleHelper.fillPrimary,
                            onTap: () {
                              onUpdateEmail(
                                update: (res) {
                                  data.value = res;
                                },
                              );
                            },
                            child: CustomImageView(
                              imagePath: "email".icon.svg,
                              svgColor: appTheme.whiteA700,
                            ),
                          ),
                          SizedBox(width: 12.h),
                          CustomIconButton(
                            height: 48.adaptSize,
                            width: 48.adaptSize,
                            padding: EdgeInsets.all(12.h),
                            decoration: IconButtonStyleHelper.fillPrimary,
                            onTap: enable == false ? null : sendInvoice,
                            child: CustomImageView(
                              imagePath: "send".icon.svg,
                              svgColor: appTheme.whiteA700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.v)
                    ],
                  );
                })),
          ),
        ],
      ),
    );
  }
}
