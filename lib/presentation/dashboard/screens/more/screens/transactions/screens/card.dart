import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CardScreen extends StatelessWidget {
  final controller = Get.put(CardController());
  final Map<String, dynamic> requestData;
  final String email;
  final String notes;
  final String amount;
  final String? currencySymbol;
  final ActiveCampaign campaign;
  final Frequency frequency;
  final List<WalletData> wallets;

  CardScreen({
    super.key,
    required this.requestData,
    required this.email,
    required this.notes,
    required this.amount,
    required this.campaign,
    required this.frequency,
    required this.wallets,
    required this.currencySymbol,
  });

  String extractLastTwoDigits(String year) {
    return year.substring(year.length - 2);
  }

  void onPressed() {
    if (controller.formKey.currentState!.validate()) {
      WalletData wallet = WalletData(
        source: 'CARD',
        name: controller.cardHolderNameController.text,
        number: controller.cardNumberController.text,
        ccv: controller.ccvController.text,
        expiryMonth: controller.expiryMonth.value,
        expiryYear: extractLastTwoDigits(controller.expiryYear.value),
        saveCard: controller.saveCard.value,
      );

      Get.to(
        () => ConfirmScreen(
          wallet: wallet,
          requestData: requestData,
          currencySymbol: currencySymbol,
          email: email,
          notes: notes,
          amount: amount,
          campaign: campaign,
          frequency: frequency,
          wallets: wallets,
        ),
      );
    }
  }

  void onAddCard() {
    controller.addCard.value = true;
  }

  void onPressedBack() {
    console.log(controller.addCard.value);
    controller.addCard.value = false;
    if (wallets.isEmpty) {
      Get.back();
    }
  }

  Widget listTile({
    required String label,
    bool? value,
    String? hintText,
    String? control,
    List<DropDown>? items,
    TextEditingController? textEditingController,
    TextInputType? keyboardType = TextInputType.text,
    TextInputAction? textInputAction = TextInputAction.none,
    String? Function(String?)? validator,
    void Function(DropDown?)? onChanged,
    dynamic Function(bool)? onChange,
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
              ),
            if (control == "textarea")
              CustomTextFormField(
                maxLines: 4,
                hintText: hintText,
                validator: validator,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                controller: textEditingController,
              ),
            if (control == "dropdown")
              SimpleDropDown(
                hintText: hintText,
                icon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.h),
                  child: CustomImageView(
                    imagePath: "dropdown".icon.svg,
                  ),
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
              title: "New Transaction".tr,
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
              child: Column(
                children: [
                  SizedBox(height: 14.v),
                  const CustomDivider(),
                  SizedBox(height: 19.v),
                  Obx(() {
                    bool addCard = controller.addCard.value;
                    if (wallets.isNotEmpty && addCard == false) {
                      return InkWell(
                        onTap: onAddCard,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              imagePath: "plus_circle".icon.svg,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 7.h,
                                top: 2.v,
                                bottom: 3.v,
                              ),
                              child: Text(
                                "Use New Card".tr,
                                style: TextStyle(
                                  color: theme.colorScheme.primary,
                                  fontSize: 12.fSize,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
                  SizedBox(height: 19.v),
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Obx(
                        () {
                          bool addCard = controller.addCard.value;

                          if (wallets.isEmpty) {
                            return SingleChildScrollView(
                              child: Form(
                                key: controller.formKey,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: controller.scanCard,
                                      child: Container(
                                        width: double.maxFinite,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15.h,
                                          vertical: 12.v,
                                        ),
                                        decoration: AppDecoration
                                            .outlineBluegray50
                                            .copyWith(
                                          border: Border.all(
                                              color: appTheme.gray400),
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder8,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CustomImageView(
                                              imagePath: "scan_card".image.png,
                                              height: 80.v,
                                            ),
                                            SizedBox(height: 8.v),
                                            Text(
                                              "Scan Card",
                                              style: CustomTextStyles
                                                  .bodyMediumGray80001,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12.v),
                                    Divider(height: 4.v),
                                    SizedBox(height: 12.v),
                                    listTile(
                                      control: "textbox",
                                      label: "Card Holder Name",
                                      hintText: "Card Holder Name",
                                      textInputAction: TextInputAction.none,
                                      textEditingController:
                                          controller.cardHolderNameController,
                                      keyboardType: TextInputType.text,
                                      validator: ValidatorNewTransaction
                                          .cardHolderName,
                                    ),
                                    listTile(
                                      control: "textbox",
                                      label: "Card Number",
                                      hintText: "Card Number",
                                      textInputAction: TextInputAction.none,
                                      textEditingController:
                                          controller.cardNumberController,
                                      keyboardType: TextInputType.number,
                                      validator:
                                          ValidatorNewTransaction.cardNumber,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Obx(
                                            () => listTile(
                                              label: "Expiry Month",
                                              control: "dropdown",
                                              hintText:
                                                  controller.expiryMonth.value,
                                              validator: ValidatorNewTransaction
                                                  .campaign,
                                              items: DateTime.now()
                                                  .monthList(inNumber: true)
                                                  .map((month) {
                                                return DropDown(
                                                  id: month,
                                                  title: month,
                                                  value: month,
                                                );
                                              }).toList(),
                                              onChanged: (option) {
                                                controller.expiryMonth.value =
                                                    option?.value;
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12.h),
                                        Expanded(
                                          child: Obx(
                                            () => listTile(
                                              label: "Expiry Year",
                                              control: "dropdown",
                                              hintText:
                                                  controller.expiryYear.value,
                                              validator: ValidatorNewTransaction
                                                  .campaign,
                                              items: DateTime.now()
                                                  .yearList(
                                                numberOfYears: 15,
                                                reverse: false,
                                              )
                                                  .map((month) {
                                                return DropDown(
                                                  id: month,
                                                  title: month,
                                                  value: month,
                                                );
                                              }).toList(),
                                              onChanged: (option) {
                                                controller.expiryYear.value =
                                                    option?.value;
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: listTile(
                                            control: "textbox",
                                            label: "CVC",
                                            hintText: "CVC",
                                            textInputAction:
                                                TextInputAction.none,
                                            textEditingController:
                                                controller.ccvController,
                                            keyboardType: TextInputType.number,
                                            validator:
                                                ValidatorNewTransaction.ccv,
                                          ),
                                        ),
                                        SizedBox(width: 12.h),
                                        Expanded(
                                          child: Obx(
                                            () => listTile(
                                              control: "switch",
                                              label: "Save Card",
                                              hintText: "Save Card",
                                              onChange: (value) {
                                                controller.saveCard.value =
                                                    value;
                                              },
                                              value: controller.saveCard.value,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 40.v),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomElevatedButton(
                                            text: "back".tr,
                                            buttonStyle:
                                                CustomButtonStyles.fillGray,
                                            onPressed: onPressedBack,
                                          ),
                                        ),
                                        SizedBox(width: 12.h),
                                        Expanded(
                                          child: Obx(
                                            () => CustomElevatedButton(
                                              text: controller.props.useState
                                                          .value ==
                                                      UseState.none
                                                  ? "next".tr
                                                  : "",
                                              leftIcon: controller.props
                                                          .useState.value ==
                                                      UseState.none
                                                  ? null
                                                  : CustomProgressButton(
                                                      lable: 'processing'.tr,
                                                    ),
                                              onPressed: onPressed,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 80.v)
                                  ],
                                ),
                              ),
                            );
                          }

                          if (wallets.isNotEmpty && addCard == true) {
                            return SingleChildScrollView(
                              child: Form(
                                key: controller.formKey,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: controller.scanCard,
                                      child: Container(
                                        width: double.maxFinite,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15.h,
                                          vertical: 12.v,
                                        ),
                                        decoration: AppDecoration
                                            .outlineBluegray50
                                            .copyWith(
                                          border: Border.all(
                                              color: appTheme.gray400),
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder8,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CustomImageView(
                                              imagePath: "scan_card".image.png,
                                              height: 80.v,
                                            ),
                                            SizedBox(height: 8.v),
                                            Text(
                                              "Scan Card",
                                              style: CustomTextStyles
                                                  .bodyMediumGray80001,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12.v),
                                    Divider(height: 4.v),
                                    SizedBox(height: 12.v),
                                    listTile(
                                      control: "textbox",
                                      label: "Card Holder Name",
                                      hintText: "Card Holder Name",
                                      textInputAction: TextInputAction.none,
                                      textEditingController:
                                          controller.cardHolderNameController,
                                      keyboardType: TextInputType.text,
                                      validator: ValidatorNewTransaction
                                          .cardHolderName,
                                    ),
                                    listTile(
                                      control: "textbox",
                                      label: "Card Number",
                                      hintText: "Card Number",
                                      textInputAction: TextInputAction.none,
                                      textEditingController:
                                          controller.cardNumberController,
                                      keyboardType: TextInputType.number,
                                      validator:
                                          ValidatorNewTransaction.cardNumber,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Obx(
                                            () => listTile(
                                              label: "Expiry Month",
                                              control: "dropdown",
                                              hintText:
                                                  controller.expiryMonth.value,
                                              items: DateTime.now()
                                                  .monthList(inNumber: true)
                                                  .map((month) {
                                                return DropDown(
                                                  id: month,
                                                  title: month,
                                                  value: month,
                                                );
                                              }).toList(),
                                              onChanged: (option) {
                                                controller.expiryMonth.value =
                                                    option?.value;
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12.h),
                                        Expanded(
                                          child: Obx(
                                            () => listTile(
                                              label: "Expiry Year",
                                              control: "dropdown",
                                              hintText:
                                                  controller.expiryYear.value,
                                              items: DateTime.now()
                                                  .yearList(
                                                numberOfYears: 15,
                                                reverse: false,
                                              )
                                                  .map((month) {
                                                return DropDown(
                                                  id: month,
                                                  title: month,
                                                  value: month,
                                                );
                                              }).toList(),
                                              onChanged: (option) {
                                                controller.expiryYear.value =
                                                    option?.value;
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: listTile(
                                            control: "textbox",
                                            label: "CVC",
                                            hintText: "CVC",
                                            textInputAction:
                                                TextInputAction.none,
                                            textEditingController:
                                                controller.ccvController,
                                            keyboardType: TextInputType.number,
                                            validator:
                                                ValidatorNewTransaction.ccv,
                                          ),
                                        ),
                                        SizedBox(width: 12.h),
                                        Expanded(
                                          child: Obx(
                                            () => listTile(
                                              control: "switch",
                                              label: "Save Card",
                                              hintText: "Save Card",
                                              onChange: (value) {
                                                controller.saveCard.value =
                                                    value;
                                              },
                                              value: controller.saveCard.value,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 40.v),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomElevatedButton(
                                            text: "back".tr,
                                            buttonStyle:
                                                CustomButtonStyles.fillGray,
                                            onPressed: onPressedBack,
                                          ),
                                        ),
                                        SizedBox(width: 12.h),
                                        Expanded(
                                          child: Obx(
                                            () => CustomElevatedButton(
                                              text: controller.props.useState
                                                          .value ==
                                                      UseState.none
                                                  ? "next".tr
                                                  : "",
                                              leftIcon: controller.props
                                                          .useState.value ==
                                                      UseState.none
                                                  ? null
                                                  : CustomProgressButton(
                                                      lable: 'processing'.tr,
                                                    ),
                                              onPressed: onPressed,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 80.v)
                                  ],
                                ),
                              ),
                            );
                          }

                          return ListView.separated(
                            itemCount: wallets.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  if (wallets[index].isExpired != true) {
                                    WalletData wallet = wallets[index];
                                    wallet.source = "WALLET";
                                    Get.to(
                                      () => ConfirmScreen(
                                        wallet: wallet,
                                        requestData: requestData,
                                        currencySymbol: currencySymbol,
                                        email: email,
                                        notes: notes,
                                        amount: amount,
                                        campaign: campaign,
                                        frequency: frequency,
                                        wallets: wallets,
                                      ),
                                    );
                                  }
                                },
                                child: MasterCard(
                                  card: wallets[index],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 12.v);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 24.v),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MasterCard extends StatelessWidget {
  final WalletData card;
  const MasterCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 12.v,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        color: card.cardType == "AMEX"
            ? appTheme.gray100.withOpacity(0.5)
            : appTheme.gray80001.withOpacity(0.1),
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomImageView(
                width: 24.h,
                height: 24.v,
                imagePath: "chip".icon.svg,
                svgColor: appTheme.green900,
              ),
              CustomImageView(
                width: 24.h,
                height: 24.v,
                imagePath: "signal".icon.svg,
                svgColor: appTheme.green900,
              ),
            ],
          ),
          SizedBox(height: 8.v),
          Text(
            "${card.number}",
            style: TextStyle(
              fontSize: 20.fSize,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8.v),
          Text(
            "${card.name}",
            style: TextStyle(
              fontSize: 14.fSize,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8.v),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "VALID THRU",
                    style: TextStyle(
                      fontSize: 13.fSize,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 2.v),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "${card.expiryDate}",
                      style: TextStyle(
                        fontSize: 12.fSize,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CustomImageView(
                      height: 24,
                      imagePath: card.cardImage,
                    ),
                  ),
                  SizedBox(height: 5.v),
                  Text(
                    "${card.cardType}",
                    style: TextStyle(
                      fontSize: 12.fSize,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
