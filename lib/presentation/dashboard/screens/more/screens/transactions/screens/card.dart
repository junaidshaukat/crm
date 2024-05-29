import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CardScreen extends StatelessWidget {
  final controller = Get.put(CardController());
  final TransactionReq request;
  final List<WalletData> wallets;

  CardScreen({
    super.key,
    required this.request,
    required this.wallets,
  }) {
    controller.cardHolderNameController.text = request.cardHolderName ?? '';
    controller.cardNumberController.text = request.cardNumber ?? '';
    controller.ccvController.text = request.ccv ?? '';
    controller.saveCard.value = request.saveCard;
    controller.expiryMonth.value = request.expiryMonth ?? '01';
    controller.expiryYear.value =
        request.expiryYear ?? '${DateTime.now().year + 5}';
  }

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

      request.cardId = wallet.cardId;
      request.source = "CARD";
      request.cardHolderName = wallet.name;
      request.cardNumber = wallet.number;
      request.ccv = wallet.ccv;
      request.expiryMonth = wallet.expiryMonth;
      request.expiryYear = wallet.expiryYear;
      request.saveCard = wallet.saveCard ?? false;
      request.function = wallet.function;

      Get.to(
        () => ConfirmScreen(request: request),
      );
    }
  }

  void onAddCard() {
    controller.addCard.value = true;
  }

  void onPressedBack() {
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
    TextInputAction? textInputAction = TextInputAction.next,
    String? Function(String?)? validator,
    void Function(DropDown?)? onChanged,
    dynamic Function(bool)? onChange,
    EdgeInsets? contentPadding,
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
                contentPadding: contentPadding,
              ),
            if (control == "textarea")
              CustomTextFormField(
                maxLines: 4,
                hintText: hintText,
                validator: validator,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                controller: textEditingController,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 16.v,
                ),
              ),
            if (control == "dropdown")
              SimpleDropDown(
                height: 260,
                width: 164.h,
                hintText: hintText,
                items: items,
                onSelected: onChanged,
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
              child: Column(
                children: [
                  SizedBox(height: 14.v),
                  const CustomDivider(),
                  SizedBox(height: 14.v),
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
                                "use_new_card".tr,
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
                  SizedBox(height: 14.v),
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Obx(
                        () {
                          bool addCard = controller.addCard.value;

                          if (wallets.isEmpty) {
                            return CreditCarForm(
                              request: request,
                              wallets: wallets,
                              onPressedBack: onPressedBack,
                              onPressed: onPressed,
                            );
                          }

                          if (wallets.isNotEmpty && addCard == true) {
                            return CreditCarForm(
                              request: request,
                              wallets: wallets,
                              onPressedBack: onPressedBack,
                              onPressed: onPressed,
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
                                    request.cardId = wallet.cardId;
                                    request.source = "WALLET";
                                    request.cardHolderName = wallet.name;
                                    request.cardNumber = wallet.number;
                                    request.ccv = wallet.ccv;
                                    request.expiryMonth = wallet.expiryMonth;
                                    request.expiryYear = wallet.expiryYear;
                                    request.saveCard = wallet.saveCard ?? false;
                                    request.function = wallet.function;

                                    Get.to(
                                      () => ConfirmScreen(request: request),
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
        color: card.isExpired == true
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
                    "valid_thru".tr,
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

class CreditCarForm extends StatelessWidget {
  final controller = Get.put(CardController());
  final TransactionReq request;
  final List<WalletData> wallets;
  final void Function() onPressedBack;
  final void Function() onPressed;

  CreditCarForm({
    super.key,
    required this.request,
    required this.wallets,
    required this.onPressedBack,
    required this.onPressed,
  });

  Widget listTile({
    required String label,
    bool? value,
    String? hintText,
    String? control,
    List<DropDown>? items,
    TextEditingController? textEditingController,
    TextInputType? keyboardType = TextInputType.text,
    TextInputAction? textInputAction = TextInputAction.next,
    String? Function(String?)? validator,
    void Function(DropDown?)? onChanged,
    void Function(bool)? onChange,
    void Function(String)? change,
    EdgeInsets? contentPadding,
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
                onChanged: change,
                contentPadding: contentPadding,
              ),
            if (control == "textarea")
              CustomTextFormField(
                maxLines: 4,
                hintText: hintText,
                validator: validator,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                controller: textEditingController,
                onChanged: change,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 16.v,
                ),
              ),
            if (control == "dropdown")
              SimpleDropDown(
                height: 260,
                width: 164.h,
                hintText: hintText,
                items: items,
                onSelected: onChanged,
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

  void scanCard() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            InkWell(
              onTap: scanCard,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 15.h,
                  vertical: 12.v,
                ),
                decoration: AppDecoration.outlineBluegray50.copyWith(
                  border: Border.all(color: appTheme.gray400),
                  borderRadius: BorderRadiusStyle.roundedBorder8,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: "scan_card".image.png,
                      height: 80.v,
                    ),
                    SizedBox(height: 8.v),
                    Text(
                      "scan_card".tr,
                      style: CustomTextStyles.bodyMediumGray80001,
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
              label: "card_holder_name".tr,
              hintText: request.cardHolderName ?? "card_holder_name".tr,
              textInputAction: TextInputAction.next,
              textEditingController: controller.cardHolderNameController,
              keyboardType: TextInputType.text,
              validator: ValidatorNewTransaction.cardHolderName,
              change: (input) {
                if (ValidatorNewTransaction.cardHolderName(input) == null) {
                  request.cardHolderName = input;
                } else {
                  request.cardHolderName = null;
                }
              },
            ),
            listTile(
              control: "textbox",
              label: "card_number".tr,
              hintText: request.cardNumber ?? "card_number".tr,
              textInputAction: TextInputAction.next,
              textEditingController: controller.cardNumberController,
              keyboardType: TextInputType.number,
              validator: ValidatorNewTransaction.cardNumber,
              change: (input) {
                if (ValidatorNewTransaction.cardNumber(input) == null) {
                  request.cardNumber = input;
                } else {
                  request.cardNumber = null;
                }
              },
            ),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => listTile(
                      label: "expiry_month".tr,
                      control: "dropdown",
                      hintText: controller.expiryMonth.value,
                      items:
                          DateTime.now().monthList(inNumber: true).map((month) {
                        return DropDown(
                          id: month,
                          title: month,
                          value: month,
                        );
                      }).toList(),
                      onChanged: (option) {
                        controller.expiryMonth.value = option?.value;
                        request.expiryMonth = option?.value;
                      },
                    ),
                  ),
                ),
                SizedBox(width: 12.h),
                Expanded(
                  child: Obx(
                    () => listTile(
                      label: "expiry_year".tr,
                      control: "dropdown",
                      hintText: controller.expiryYear.value,
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
                        controller.expiryYear.value = option?.value;
                        request.expiryYear = option?.value;
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
                    label: "ccv".tr,
                    hintText: request.ccv ?? "ccv".tr,
                    textInputAction: TextInputAction.next,
                    textEditingController: controller.ccvController,
                    keyboardType: TextInputType.number,
                    validator: ValidatorNewTransaction.ccv,
                    change: (input) {
                      if (ValidatorNewTransaction.ccv(input) == null) {
                        request.ccv = input;
                      } else {
                        request.ccv = null;
                      }
                    },
                  ),
                ),
                SizedBox(width: 12.h),
                Expanded(
                  child: Obx(
                    () => listTile(
                      control: "switch",
                      label: "save_card".tr,
                      hintText: "save_card".tr,
                      onChange: (value) {
                        request.saveCard = value;
                        controller.saveCard.value = value;
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
                    buttonStyle: CustomButtonStyles.fillGray,
                    onPressed: onPressedBack,
                  ),
                ),
                SizedBox(width: 12.h),
                Expanded(
                  child: Obx(
                    () => CustomElevatedButton(
                      text: controller.props.useState.value == UseState.none
                          ? "next".tr
                          : "",
                      leftIcon: controller.props.useState.value == UseState.none
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
}
