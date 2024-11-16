import 'package:flutter/material.dart';

import '/core/app_export.dart';

class ChannelDetailsScreen extends StatelessWidget {
  final ChannelsData channel;
  ChannelDetailsScreen({super.key, required this.channel});
  final controller = Get.put(ChannelsController());

  Widget visibility({
    required bool visible,
    required String label,
    required String control,
    TextEditingController? controller,
    dynamic hintText,
    void Function(dynamic)? onChanged,
    required void Function()? onRemove,
    void Function()? onTap,
  }) {
    Rx<String?> date = Rx(null);
    Rx<bool?> switchs = Rx(hintText == 1 ? true : false);

    return Visibility(
      visible: visible,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4.v),
          Text(
            label,
            style: TextStyle(
              color: appTheme.black900,
              fontSize: 15.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 4.v),
          if (control == 'datetime' || control == 'date')
            Obx(() {
              return Input(
                readOnly: true,
                controller: controller,
                hintText: date.value ?? hintText,
                onChanged: onChanged,
                onTap: () {
                  pickers.date(Get.context!).then((val) {
                    if (val != null) {
                      date.value = val.formatYYYYMMDD;
                      onChanged!(val.formatYYYYMMDD);
                    }
                  });
                },
                suffixIcon: IconButton(
                  onPressed: onRemove,
                  icon: Icon(
                    Icons.close,
                    color: appTheme.gray400,
                  ),
                ),
              );
            }),
          if (control == 'switch')
            Obx(() {
              onChanged!(switchs.value == true ? 1 : 0);
              return CustomSwitch(
                value: switchs.value,
                alignment: Alignment.bottomLeft,
                onChange: (option) {
                  switchs(option);
                  onChanged(option == true ? 1 : 0);
                },
              );
            }),
          if (control == 'textbox')
            Input(
              controller: controller,
              hintText: hintText,
              onChanged: onChanged,
              suffixIcon: IconButton(
                onPressed: onRemove,
                icon: Icon(
                  Icons.close,
                  color: appTheme.gray400,
                ),
              ),
            )
        ],
      ),
    );
  }

  void onTapFilter() {
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
        child: SingleChildScrollView(
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
                    "filter_channel".tr,
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
              Text(
                "year".tr,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 15.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2.v),
              SimpleDropDown(
                width: 353.h,
                maxHeight: 300.v,
                hintText: controller.year.value ?? "year".tr,
                items: DateTime.now().yearList().map((e) {
                  return DropDown(
                    id: e,
                    title: e.toString(),
                    value: e,
                  );
                }).toList(),
                onSelected: (option) {
                  controller.year.value = option?.value;
                },
              ),
              SizedBox(height: 8.v),
              Text(
                "month".tr,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 15.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2.v),
              SimpleDropDown(
                width: 352.h,
                maxHeight: 300.v,
                hintText: controller.month.value ?? "month".tr,
                items: DateTime.now().monthsList(12).map((e) {
                  return DropDown(
                    id: e,
                    title: e.toString(),
                    value: e,
                  );
                }).toList(),
                onSelected: (option) {
                  controller.month.value = option?.value;
                },
              ),
              SizedBox(height: 8.v),
              Text(
                "day".tr,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 15.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2.v),
              SimpleDropDown(
                width: 352.h,
                maxHeight: 300.v,
                hintText: controller.day.value ?? "day".tr,
                items: DateTime.now().monthsList(31).map((e) {
                  return DropDown(
                    id: e,
                    title: e.toString(),
                    value: e,
                  );
                }).toList(),
                onSelected: (option) {
                  controller.day.value = option?.value;
                },
              ),
              SizedBox(height: 16.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        text: "reset".tr,
                        margin: EdgeInsets.only(right: 4.h),
                        buttonStyle: CustomButtonStyles.fillGray,
                        onPressed: () {
                          controller.year.value = null;
                          controller.month.value = null;
                          controller.day.value = null;

                          controller.getChannelDetails();
                          Get.back();
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomElevatedButton(
                        text: "filter".tr,
                        margin: EdgeInsets.only(left: 4.h),
                        onPressed: () {
                          controller.getChannelDetails();
                          Get.back();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
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
              title: "channel_details".tr,
              onTapFilter: onTapFilter,
            ),
          ),
          SizedBox(height: 16.v),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              decoration: AppDecoration.outlinePrimary.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL28,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.v),
                  const Center(
                    child: CustomDivider(),
                  ),
                  SizedBox(height: 16.v),
                  Text(
                    channel.type ?? "",
                    style: TextStyle(
                      color: appTheme.gray80001,
                      fontSize: 14.fSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.v),
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Obx(
                        () {
                          UseState useState =
                              controller.propsChannelDetails.useState.value;
                          UseError error =
                              controller.propsChannelDetails.error.value;

                          if (useState == UseState.none ||
                              useState == UseState.loading) {
                            return const CircularProgress();
                          } else {
                            if (error.message != null) {
                              return TryAgain(
                                message: error.message,
                                tryAgain: () async {
                                  return controller.getChannelDetails();
                                },
                              );
                            }

                            List<ChannelDetails> channels =
                                controller.channelDetails;
                            if (channels.isEmpty) {
                              return const NoRecordFound();
                            } else {
                              return ListView.separated(
                                shrinkWrap: true,
                                itemCount: channels.length + 1,
                                padding: EdgeInsets.zero,
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 11.v);
                                },
                                itemBuilder: (context, index) {
                                  if (index == channels.length) {
                                    String currencySymbol =
                                        channels.first.currencySymbol;

                                    num totalAmount = channels.fold(
                                        0.0,
                                        (sum, item) =>
                                            sum + (item.amount.toNum));
                                    num totalTransaction = channels.fold(
                                        0,
                                        (sum, item) =>
                                            sum + (item.numberOfTransaction));
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4.h,
                                        vertical: 4.v,
                                      ),
                                      decoration: AppDecoration.outlinePrimary2
                                          .copyWith(
                                        color: appTheme.lightGreen50,
                                        border: Border.all(
                                          width: 1,
                                          color: appTheme.primary,
                                        ),
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder5,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${'total'.tr} ${'transactions'.tr}",
                                                style: TextStyle(
                                                  color:
                                                      theme.colorScheme.primary,
                                                  fontSize: 12.fSize,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(height: 4.v),
                                              Text(
                                                "${'total'.tr} ${'amount'.tr}",
                                                style: TextStyle(
                                                  color:
                                                      theme.colorScheme.primary,
                                                  fontSize: 12.fSize,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                width: 200.h,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 8.h,
                                                  ),
                                                  child: Text(
                                                    '$totalTransaction',
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      fontSize: 12.fSize,
                                                      fontFamily: 'Poppins',
                                                      color: appTheme.gray80001,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 4.v),
                                              SizedBox(
                                                width: 200.h,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 8.h,
                                                  ),
                                                  child: Text(
                                                    '$currencySymbol$totalAmount',
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      fontSize: 12.fSize,
                                                      fontFamily: 'Poppins',
                                                      color: appTheme.gray80001,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }

                                  ChannelDetails channel = channels[index];

                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 4.h,
                                      vertical: 4.v,
                                    ),
                                    decoration:
                                        AppDecoration.outlinePrimary2.copyWith(
                                      color: appTheme.lightGreen50,
                                      border: Border.all(
                                        width: 1,
                                        color: appTheme.primary,
                                      ),
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder5,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 100.h,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'campaign'.tr,
                                                style: TextStyle(
                                                  color:
                                                      theme.colorScheme.primary,
                                                  fontSize: 12.fSize,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(height: 4.v),
                                              Text(
                                                channel.campaign,
                                                style: TextStyle(
                                                  color: appTheme.gray80001,
                                                  fontSize: 12.fSize,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100.h,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'transactions'.tr,
                                                style: TextStyle(
                                                  color:
                                                      theme.colorScheme.primary,
                                                  fontSize: 12.fSize,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(height: 4.v),
                                              Text(
                                                "${channel.numberOfTransaction}",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: appTheme.gray80001,
                                                  fontSize: 12.fSize,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100.h,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                'amount'.tr,
                                                style: TextStyle(
                                                  color:
                                                      theme.colorScheme.primary,
                                                  fontSize: 12.fSize,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(height: 4.v),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 8.h),
                                                child: Text(
                                                  "${channel.currencySymbol}${channel.amount}",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: appTheme.gray80001,
                                                    fontSize: 12.fSize,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
