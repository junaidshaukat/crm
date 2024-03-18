import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'binding/binding.dart';
export 'controller/controller.dart';
export 'models/model.dart';
export 'screens/export.dart';
export 'widgets/export.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key, required this.controller});
  final AnalyticsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 36.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: AppbarWithBackAndFilter(
              back: false,
              title: "analytics_information".tr,
            ),
          ),
          SizedBox(height: 16.v),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              decoration: AppDecoration.fillWhiteA.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL28,
              ),
              child: Column(
                children: [
                  SizedBox(height: 12.v),
                  const CustomDivider(),
                  SizedBox(height: 12.v),
                  Obx(() {
                    Rx<UseState> useState =
                        controller.propsYearOverYear.useState;
                    if (useState.value == UseState.none ||
                        useState.value == UseState.loading) {
                      return SizedBox(
                        height: 240.v,
                        child: const CircularProgress(),
                      );
                    } else {
                      return Container(
                        margin: EdgeInsets.only(left: 1.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.h, vertical: 7.v),
                        decoration:
                            AppDecoration.outlineBluegray100011.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16,
                        ),
                        // decoration: AppDecoration.outlineGray.copyWith(
                        //   borderRadius: BorderRadiusStyle.roundedBorder8,
                        //   border: Border.all(
                        //     color: appTheme.gray300,
                        //   ),
                        // ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 5.v),
                                    child: Text(
                                      "${"total_donations".tr}${controller.yearOverYear.value.currencySymbol}${controller.yearOverYear.value.total!.toStringAsFixed(2)}",
                                      style: TextStyle(
                                        color: appTheme.gray80001,
                                        fontSize: 15.fSize,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.dialog(
                                      AlertDialog(
                                        contentPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        insetPadding:
                                            EdgeInsets.only(bottom: 340.v),
                                        content: Container(
                                          margin: EdgeInsets.only(
                                            left: 100.h,
                                            right: 24.h,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10.h,
                                            vertical: 5.v,
                                          ),
                                          decoration: AppDecoration
                                              .outlineBluegray100011
                                              .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 5.v),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: 1.h,
                                                  right: 2.h,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "filter_by_number_of_years"
                                                          .tr,
                                                      style: TextStyle(
                                                        color:
                                                            appTheme.gray80001,
                                                        fontSize: 12.fSize,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    CustomImageView(
                                                      imagePath:
                                                          "close".icon.svg,
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 4.v),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 1.v),
                                                child: Text(
                                                  "number_of_years".tr,
                                                  style: TextStyle(
                                                    color: appTheme.gray80001,
                                                    fontSize: 14.fSize,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Obx(
                                                () => SimpleDropDown(
                                                  icon: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 8.h,
                                                    ),
                                                    child: CustomImageView(
                                                      imagePath:
                                                          "dropdown".icon.svg,
                                                    ),
                                                  ),
                                                  hintText: controller
                                                      .numberOfYears.value
                                                      .toString()
                                                      .padLeft(2, '0'),
                                                  items: [1, 2, 3, 4, 5]
                                                      .map(
                                                        (e) => DropDown(
                                                          id: e,
                                                          title: e
                                                              .toString()
                                                              .padLeft(2, '0'),
                                                          value: e,
                                                        ),
                                                      )
                                                      .toList(),
                                                  onChanged: (option) {
                                                    controller.numberOfYears(
                                                        option?.value);
                                                  },
                                                ),
                                              ),
                                              SizedBox(height: 7.v),
                                              CustomElevatedButton(
                                                height: 40.v,
                                                text: "filter".tr,
                                                onPressed:
                                                    controller.setYearOverYears,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.h,
                                      vertical: 6.v,
                                    ),
                                    child: CustomImageView(
                                      imagePath: "more".icon.svg,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 7.v),
                            Padding(
                              padding: EdgeInsets.all(8.adaptSize),
                              child: LineGraph(
                                data: controller.yearOverYear.value,
                                numberOfYears: controller.numberOfYears.value,
                              ),
                            ),
                            SizedBox(height: 7.v),
                            SizedBox(
                              width: double.maxFinite,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: controller
                                    .yearOverYear.value.chartData!
                                    .map((chartData) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 4.h),
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: chartData.color,
                                        ),
                                      ),
                                      SizedBox(width: 4.h),
                                      Text('${chartData.year}'),
                                      SizedBox(width: 4.h),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }),
                  SizedBox(height: 14.v),
                  Obx(
                    () => Row(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.initialPage(0);
                            controller.pageController.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 0.h),
                            child: Text(
                              "tender_types".tr,
                              style: controller.initialPage.value == 0
                                  ? TextStyle(
                                      color: theme.colorScheme.primary,
                                      fontSize: 12.fSize,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    )
                                  : TextStyle(
                                      color: appTheme.gray50001,
                                      fontSize: 12.fSize,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.initialPage(1);
                            controller.pageController.animateToPage(
                              1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text(
                              "channel_types".tr,
                              style: controller.initialPage.value == 1
                                  ? TextStyle(
                                      color: theme.colorScheme.primary,
                                      fontSize: 12.fSize,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    )
                                  : TextStyle(
                                      color: appTheme.gray50001,
                                      fontSize: 12.fSize,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.initialPage(2);
                            controller.pageController.animateToPage(
                              2,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text(
                              "receipt".tr,
                              style: controller.initialPage.value == 2
                                  ? TextStyle(
                                      color: theme.colorScheme.primary,
                                      fontSize: 12.fSize,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    )
                                  : TextStyle(
                                      color: appTheme.gray50001,
                                      fontSize: 12.fSize,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 14.v),
                  Expanded(
                    child: PageView(
                      controller: controller.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Obx(() {
                          Props props = controller.propsTenderTypes;
                          Rx<TenderTypes> tenderTypes = controller.tenderTypes;
                          if (props.useState.value == UseState.none ||
                              props.useState.value == UseState.loading) {
                            return const CircularProgress();
                          } else {
                            if (props.error.value.message != null) {
                              return ItemCard(
                                error: props.error.value.message,
                                onRefresh: () async {},
                              );
                            } else {
                              num? total = tenderTypes.value.total;
                              String? year = tenderTypes.value.year;
                              String? currencySymbol =
                                  tenderTypes.value.currencySymbol;
                              List<TenderTypesValue>? dataValue =
                                  tenderTypes.value.values;

                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 3.v),
                                          child: Text(
                                            "${"total_amount_in".tr} $year $currencySymbol${total!.toStringAsFixed(2)}",
                                            style: TextStyle(
                                              color: appTheme.gray80001,
                                              fontSize: 14.fSize,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.dialog(
                                              AlertDialog(
                                                contentPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                insetPadding: EdgeInsets.only(
                                                    bottom: 0.v),
                                                content: Container(
                                                  margin: EdgeInsets.only(
                                                    left: 100.h,
                                                    right: 24.h,
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10.h,
                                                    vertical: 5.v,
                                                  ),
                                                  decoration: AppDecoration
                                                      .outlineBluegray100011
                                                      .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder8,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(height: 5.v),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 1.h,
                                                          right: 2.h,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "filter_by_years"
                                                                  .tr,
                                                              style: TextStyle(
                                                                color: appTheme
                                                                    .gray80001,
                                                                fontSize:
                                                                    12.fSize,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            CustomImageView(
                                                              imagePath: "close"
                                                                  .icon
                                                                  .svg,
                                                              onTap: () {
                                                                Get.back();
                                                              },
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 4.v),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1.v),
                                                        child: Text(
                                                          "year".tr,
                                                          style: TextStyle(
                                                            color: appTheme
                                                                .gray80001,
                                                            fontSize: 14.fSize,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Obx(
                                                        () => SimpleDropDown(
                                                          icon: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              horizontal: 8.h,
                                                            ),
                                                            child:
                                                                CustomImageView(
                                                              imagePath:
                                                                  "dropdown"
                                                                      .icon
                                                                      .svg,
                                                              height: 23.v,
                                                              width: 28.h,
                                                            ),
                                                          ),
                                                          hintText: controller
                                                              .year.value,
                                                          items: DateTime.now()
                                                              .yearList()
                                                              .map(
                                                                (e) => DropDown(
                                                                  id: e,
                                                                  title: e,
                                                                  value: e,
                                                                ),
                                                              )
                                                              .toList(),
                                                          onChanged: (option) {
                                                            controller.year(
                                                                option?.value);
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(height: 7.v),
                                                      CustomElevatedButton(
                                                        height: 40.v,
                                                        text: "filter".tr,
                                                        onPressed: controller
                                                            .setTenderTypes,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 12.h,
                                              vertical: 6.v,
                                            ),
                                            child: CustomImageView(
                                              imagePath: "more".icon.svg,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0.h),
                                      child: Wrap(
                                        spacing: 8.h,
                                        runSpacing: 8.v,
                                        alignment: WrapAlignment.center,
                                        runAlignment:
                                            WrapAlignment.spaceBetween,
                                        children: dataValue!.map((e) {
                                          return TenderTransactionCard(
                                            type: '${e.tenderType}',
                                            text: '${e.text}',
                                            transaction:
                                                '${e.numberOfTransaction}',
                                            amount:
                                                '$currencySymbol${e.amount!.toStringAsFixed(2)}',
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    SizedBox(height: 36.v),
                                  ],
                                ),
                              );
                            }
                          }
                        }),
                        Obx(() {
                          Props props = controller.propsChannelTypes;
                          Rx<ChannelTypes> channelTypes =
                              controller.channelTypes;
                          if (props.useState.value == UseState.none ||
                              props.useState.value == UseState.loading) {
                            return const CircularProgress();
                          } else {
                            if (props.error.value.message != null) {
                              return ItemCard(
                                error: props.error.value.message,
                                onRefresh: () async {},
                              );
                            } else {
                              num? total = channelTypes.value.total;
                              String? year = channelTypes.value.year;
                              String? currencySymbol =
                                  channelTypes.value.currencySymbol;
                              List<ChannelTypesValue>? dataValue =
                                  channelTypes.value.values;

                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 3.v),
                                            child: Text(
                                              "${"total_amount_in".tr} $year $currencySymbol${total?.toStringAsFixed(2)}",
                                              style: TextStyle(
                                                color: appTheme.gray80001,
                                                fontSize: 14.fSize,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            console.log(controller.month.value);
                                            Get.dialog(
                                              AlertDialog(
                                                contentPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                insetPadding: EdgeInsets.only(
                                                    bottom: 0.v),
                                                content: Container(
                                                  margin: EdgeInsets.only(
                                                    left: 100.h,
                                                    right: 24.h,
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10.h,
                                                    vertical: 5.v,
                                                  ),
                                                  decoration: AppDecoration
                                                      .outlineBluegray100011
                                                      .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder8,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(height: 5.v),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 1.h,
                                                          right: 2.h,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 2.v),
                                                              child: Text(
                                                                "filter_by_year_and_month"
                                                                    .tr,
                                                                style:
                                                                    TextStyle(
                                                                  color: appTheme
                                                                      .gray80001,
                                                                  fontSize:
                                                                      12.fSize,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                            ),
                                                            CustomImageView(
                                                              imagePath: 'close'
                                                                  .icon
                                                                  .svg,
                                                              onTap: () {
                                                                Get.back();
                                                              },
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 4.v),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1.v),
                                                        child: Text(
                                                          "month".tr,
                                                          style: TextStyle(
                                                            color: appTheme
                                                                .gray80001,
                                                            fontSize: 14.fSize,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Obx(
                                                        () => SimpleDropDown(
                                                          icon: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              horizontal: 8.h,
                                                            ),
                                                            child:
                                                                CustomImageView(
                                                              imagePath:
                                                                  "dropdown"
                                                                      .icon
                                                                      .svg,
                                                              height: 23.v,
                                                              width: 28.h,
                                                            ),
                                                          ),
                                                          hintText: controller
                                                                  .month
                                                                  .value
                                                                  ?.monthName ??
                                                              'select_month'.tr,
                                                          items: DateTime.now()
                                                              .monthList(
                                                                  selectMonth:
                                                                      true)
                                                              .map(
                                                                (e) => DropDown(
                                                                  id: e
                                                                      .monthNumber,
                                                                  title: e,
                                                                  value: e
                                                                      .monthNumber,
                                                                ),
                                                              )
                                                              .toList(),
                                                          onChanged: (option) {
                                                            console.log(
                                                                option?.value);
                                                            if (option?.value ==
                                                                '') {
                                                              controller.month
                                                                  .value = null;
                                                            } else {
                                                              controller.month(
                                                                  option
                                                                      ?.value);
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(height: 7.v),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1.v),
                                                        child: Text(
                                                          "year".tr,
                                                          style: TextStyle(
                                                            color: appTheme
                                                                .gray80001,
                                                            fontSize: 14.fSize,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Obx(
                                                        () => SimpleDropDown(
                                                          icon: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              horizontal: 8.h,
                                                            ),
                                                            child:
                                                                CustomImageView(
                                                              imagePath:
                                                                  "dropdown"
                                                                      .icon
                                                                      .svg,
                                                              height: 23.v,
                                                              width: 28.h,
                                                            ),
                                                          ),
                                                          hintText: controller
                                                              .year.value,
                                                          items: DateTime.now()
                                                              .yearList()
                                                              .map(
                                                                (e) => DropDown(
                                                                  id: e,
                                                                  title: e,
                                                                  value: e,
                                                                ),
                                                              )
                                                              .toList(),
                                                          onChanged: (option) {
                                                            controller.year(
                                                                option?.value);
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(height: 7.v),
                                                      CustomElevatedButton(
                                                        height: 40.v,
                                                        text: "filter".tr,
                                                        onPressed: controller
                                                            .setChannelTypes,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 12.h,
                                              vertical: 6.v,
                                            ),
                                            child: CustomImageView(
                                              imagePath: "more".icon.svg,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1.h),
                                      child: Column(
                                        children: dataValue!.map((e) {
                                          console.log(e.toJson());
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.v),
                                            child: ChannelCard(
                                              percentage: total
                                                  .toString()
                                                  .percentage(
                                                      e.amount.toString()),
                                              type: '${e.channelType}',
                                              text: '${e.text}',
                                              transaction:
                                                  '${e.numberOfTransaction}',
                                              amount:
                                                  '$currencySymbol${e.amount!.toStringAsFixed(2)}',
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    SizedBox(height: 36.v),
                                  ],
                                ),
                              );
                            }
                          }
                        }),
                        Obx(() {
                          Props props = controller.propsReceipted;
                          Rx<Receipted> receipted = controller.receipted;
                          if (props.useState.value == UseState.none ||
                              props.useState.value == UseState.loading) {
                            return const CircularProgress();
                          } else {
                            if (props.error.value.message != null) {
                              return ItemCard(
                                error: props.error.value.message,
                                onRefresh: () async {},
                              );
                            } else {
                              num? total = receipted.value.total;
                              String? year = receipted.value.year;
                              String? currencySymbol =
                                  receipted.value.currencySymbol;
                              List<ReceiptedValue>? values =
                                  receipted.value.values;

                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 3.v),
                                          child: Text(
                                            "${"total_amount_in".tr} $year $currencySymbol${total?.toStringAsFixed(2)}",
                                            style: TextStyle(
                                              color: appTheme.gray80001,
                                              fontSize: 14.fSize,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.dialog(
                                              AlertDialog(
                                                contentPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                insetPadding: EdgeInsets.only(
                                                    bottom: 0.v),
                                                content: Container(
                                                  margin: EdgeInsets.only(
                                                    left: 100.h,
                                                    right: 24.h,
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10.h,
                                                    vertical: 5.v,
                                                  ),
                                                  decoration: AppDecoration
                                                      .outlineBluegray100011
                                                      .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder8,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(height: 5.v),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 1.h,
                                                          right: 2.h,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 2.v),
                                                              child: Text(
                                                                "filter_by_year"
                                                                    .tr,
                                                                style:
                                                                    TextStyle(
                                                                  color: appTheme
                                                                      .gray80001,
                                                                  fontSize:
                                                                      12.fSize,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                            ),
                                                            CustomImageView(
                                                              imagePath: "close"
                                                                  .icon
                                                                  .svg,
                                                              onTap: () {
                                                                Get.back();
                                                              },
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 4.v),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1.v),
                                                        child: Text(
                                                          "year".tr,
                                                          style: TextStyle(
                                                            color: appTheme
                                                                .gray80001,
                                                            fontSize: 14.fSize,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Obx(
                                                        () => SimpleDropDown(
                                                          icon: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              horizontal: 8.h,
                                                            ),
                                                            child:
                                                                CustomImageView(
                                                              imagePath:
                                                                  "dropdown"
                                                                      .icon
                                                                      .svg,
                                                              height: 23.v,
                                                              width: 28.h,
                                                            ),
                                                          ),
                                                          hintText: controller
                                                              .year.value,
                                                          items: DateTime.now()
                                                              .yearList()
                                                              .map(
                                                                (e) => DropDown(
                                                                  id: e,
                                                                  title: e,
                                                                  value: e,
                                                                ),
                                                              )
                                                              .toList(),
                                                          onChanged: (option) {
                                                            controller.year(
                                                                option?.value);
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(height: 7.v),
                                                      CustomElevatedButton(
                                                        height: 40.v,
                                                        text: "filter".tr,
                                                        onPressed: controller
                                                            .setReceipted,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 12.h,
                                              vertical: 6.v,
                                            ),
                                            child: CustomImageView(
                                              imagePath: "more".icon.svg,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1.h),
                                      child: Column(
                                        children: values!.map((e) {
                                          console.log(e.toJson());
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 16.v),
                                            child: ReceiptCard(
                                              percentage: '${e.percentage}',
                                              type: '${e.receiptedType}',
                                              transaction:
                                                  '${e.numberOfTransaction}',
                                              amount:
                                                  '$currencySymbol${e.amount!.toStringAsFixed(2)}',
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    SizedBox(height: 36.v),
                                  ],
                                ),
                              );
                            }
                          }
                        }),
                      ],
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
