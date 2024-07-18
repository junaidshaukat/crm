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

  Widget listTile2({
    String? label1,
    String? label2,
    String? value1,
    String? value2,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: fdw * 0.45,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$label1:',
                    style: CustomTextStyles.labelLargePoppinsGray900.copyWith(
                      color: appTheme.gray900,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 12.h),
                  Expanded(
                    child: Text(
                      '$value1',
                      textAlign: TextAlign.right,
                      style: CustomTextStyles.labelLargePoppinsGray900.copyWith(
                        color: appTheme.gray900,
                      ),
                    ),
                  )
                ],
              ),
            ),
            if (label2 != null) ...[
              SizedBox(
                width: fdw * 0.30,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$label2: ',
                      style: CustomTextStyles.labelLargePoppinsGray900.copyWith(
                        color: appTheme.gray900,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '$value2',
                        textAlign: TextAlign.right,
                        style:
                            CustomTextStyles.labelLargePoppinsGray900.copyWith(
                          color: appTheme.gray900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]
          ],
        ),
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

  Future<void> sendInvoice({int? tagNumber}) async {
    await controller.sendInvoice(
      tagNumber: tagNumber,
    );
  }

  String get amount {
    double total = transaction.approvedAmount?.toDouble() ?? 0.00;
    double fee = transaction.fee?.toDouble() ?? 0.00;

    return (total - fee).toStringAsFixed(2);
  }

  Future<void> onRefund(
    BuildContext context,
    Transaction transaction, {
    required void Function(Transaction res) update,
  }) async {
    controller.refunds(transaction.transactionTag);
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
        margin: EdgeInsets.only(bottom: 0.v),
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.v),
        decoration: AppDecoration.outlineBluegray100011,
        child: Obx(() {
          Rx<UseState> props = controller.propsRefund.useState;
          Rx<UseError> error = controller.propsRefund.error;
          num max = controller.eligibleRefundAmount.value;

          if (props.value == UseState.loading) {
            return const CircularProgress();
          } else if (error.value.message != null) {
            return TryAgain(
              message: error.value.message,
              tryAgain: controller.tryAgain,
            );
          } else {
            List<Refund> refunds = controller.refund.value.data;

            return SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.v),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        const Spacer(flex: 1),
                        Text(
                          "refund_transaction".tr,
                          style: TextStyle(
                            color: appTheme.black900,
                            fontSize: 20.fSize,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Spacer(flex: 2),
                      ],
                    ),
                    SizedBox(height: 11.v),
                    input(
                      conn: controller.maxAmount,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      label: "${"max_amount".tr}: \$$max",
                      hintText: "max_amount".tr,
                      validator: (val) {
                        return ValidatorTransaction.maxAmount(val, max);
                      },
                    ),
                    SizedBox(height: 6.v),
                    input(
                      label: "notes".tr,
                      hintText: "notes".tr,
                      conn: controller.notes,
                      validator: (val) {
                        return ValidatorTransaction.notes(val);
                      },
                    ),
                    SizedBox(height: 8.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                              text: "cancel".tr,
                              margin: EdgeInsets.only(right: 4.h),
                              buttonStyle: CustomButtonStyles.fillGray,
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ),
                          Expanded(
                            child: Obx(
                              () => CustomElevatedButton(
                                margin: EdgeInsets.only(left: 4.h),
                                text: props.value == UseState.none
                                    ? "refund".tr
                                    : "",
                                leftIcon: props.value == UseState.none
                                    ? null
                                    : CustomProgressButton(
                                        lable: 'processing'.tr,
                                      ),
                                onPressed: () {
                                  if (props.value != UseState.processing) {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      controller.onRefund(
                                        tagNumber: transaction.transactionTag,
                                        amount: num.parse(
                                            controller.maxAmount.text),
                                        userNotes: controller.notes.text,
                                        callback: () {
                                          update(transaction);
                                          controller.refunds(
                                              transaction.transactionTag);
                                        },
                                      );
                                    }
                                  }
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 8.v),
                    if (refunds.isEmpty) ...[
                      SizedBox(
                        height: 400.v,
                        child: const Center(
                          child: NoRecordFound(),
                        ),
                      ),
                    ],
                    if (refunds.isNotEmpty) ...[
                      SizedBox(
                        height: 400.v,
                        child: ListView.separated(
                          itemCount: refunds.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            Refund refund = refunds[index];
                            return CustomCard(
                              child: Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 4.v),
                                    decoration: AppDecoration.fillLightGreen,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        listTile2(
                                          label1: "invoice".tr,
                                          label2: "amount".tr,
                                          value1: refund.invoice ?? "None",
                                          value2:
                                              "\$${refund.approvedAmount?.toFixed ?? "0.00"}",
                                        ),
                                        SizedBox(height: 4.v),
                                        Divider(
                                          color:
                                              appTheme.gray600.withOpacity(0.4),
                                          indent: 0.h,
                                        ),
                                        SizedBox(height: 3.v),
                                        listTile2(
                                          label1: "approval_code".tr,
                                          label2: "fee".tr,
                                          value1: refund.approvalCode ?? "None",
                                          value2:
                                              "\$${refund.fee?.toFixed ?? "0.00"}",
                                        ),
                                        SizedBox(height: 4.v),
                                        Divider(
                                          color:
                                              appTheme.gray600.withOpacity(0.4),
                                          indent: 0.h,
                                        ),
                                        SizedBox(height: 3.v),
                                        listTile2(
                                          label1: "date".tr,
                                          value1:
                                              refund.transactionDate ?? "None",
                                        ),
                                        SizedBox(height: 4.v),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 12.v),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      OutlineIconButton(
                                        width: 28.h,
                                        height: 28.h,
                                        color: appTheme.green800,
                                        child: Padding(
                                          padding: EdgeInsets.all(4.adaptSize),
                                          child: CustomImageView(
                                            imagePath: "notes".icon.svg,
                                            svgColor: appTheme.green800,
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.dialog(
                                            AlertDialog(
                                              contentPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              insetPadding:
                                                  EdgeInsets.only(bottom: 0.v),
                                              content: Container(
                                                decoration: AppDecoration
                                                    .fillPrimary
                                                    .copyWith(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                        8.adaptSize),
                                                    topRight: Radius.circular(
                                                        8.adaptSize),
                                                  ),
                                                ),
                                                width: 260.h,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: double.maxFinite,
                                                      padding:
                                                          EdgeInsets.all(6.h),
                                                      decoration: AppDecoration
                                                          .fillPrimary
                                                          .copyWith(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8.adaptSize),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.adaptSize),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "notes".tr,
                                                            style: TextStyle(
                                                              color: appTheme
                                                                  .whiteA700,
                                                              fontSize:
                                                                  12.fSize,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                          CustomImageView(
                                                            svgColor:
                                                                appTheme.white,
                                                            imagePath: "close"
                                                                .icon
                                                                .svg,
                                                            height:
                                                                15.adaptSize,
                                                            width: 15.adaptSize,
                                                            onTap: () {
                                                              Get.back();
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 8.v),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.h),
                                                      child: Text(
                                                        refund.userNotes ?? "",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          color:
                                                              appTheme.gray600,
                                                          fontSize: 12.fSize,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 8.v),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(width: 8.h),
                                      OutlineIconButton(
                                        width: 28.h,
                                        height: 28.h,
                                        color: appTheme.green800,
                                        onPressed: enable == false
                                            ? null
                                            : () => sendInvoice(
                                                  tagNumber: refund.tagNumber,
                                                ),
                                        child: Padding(
                                          padding: EdgeInsets.all(2.adaptSize),
                                          child: CustomImageView(
                                            imagePath: "send".icon.svg,
                                            svgColor: appTheme.green800,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 16.v);
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                            onTap: enable == false
                                ? null
                                : () => sendInvoice(
                                      tagNumber: transaction.transactionTag,
                                    ),
                            child: CustomImageView(
                              imagePath: "send".icon.svg,
                              svgColor: appTheme.whiteA700,
                            ),
                          ),
                          if (data.value.canRefund == true) ...[
                            SizedBox(width: 12.h),
                            CustomIconButton(
                              height: 48.adaptSize,
                              width: 48.adaptSize,
                              padding: EdgeInsets.all(12.h),
                              decoration: IconButtonStyleHelper.fillPrimary,
                              onTap: () {
                                onRefund(
                                  context,
                                  data.value,
                                  update: (res) {
                                    data.value = res;
                                  },
                                );
                              },
                              child: CustomImageView(
                                imagePath: "refund".icon.svg,
                                svgColor: appTheme.whiteA700,
                              ),
                            ),
                          ],
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

class TooltipWidget extends StatelessWidget {
  const TooltipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Tooltip(
      message: 'This is a tooltip',
    );
  }
}
