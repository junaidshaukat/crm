import 'package:flutter/material.dart';
import '/core/app_export.dart';

class HomeCompaignsScreen extends GetWidget<HomeCompaignsController> {
  const HomeCompaignsScreen({super.key});

  void onTapFilter() {
    controller.initialPage(0);
    if (controller.propsChannels.useState.value == UseState.done) {
      Get.dialog(
        AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.only(bottom: 450.v),
          content: Container(
            width: double.maxFinite,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                        svgColor: Colors.black,
                        imagePath: "back".icon.svg,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        margin: EdgeInsets.only(bottom: 8.v),
                        onTap: () {
                          Get.back();
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 63.h, top: 2.v),
                        child: Text(
                          "campaign_filter".tr,
                          style: TextStyle(
                            color: appTheme.black900,
                            fontSize: 20.fSize,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8.v),
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
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text(
                              "channels".tr,
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
                              "year".tr,
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
                              "month".tr,
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
                        ),
                        InkWell(
                          onTap: () {
                            controller.initialPage(3);
                            controller.pageController.animateToPage(
                              3,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text(
                              "day".tr,
                              style: controller.initialPage.value == 3
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
                  SizedBox(height: 8.v),
                  const Divider(),
                  SizedBox(height: 8.v),
                  Container(
                    height: 200.v,
                    padding: EdgeInsets.symmetric(horizontal: 10.adaptSize),
                    child: PageView(
                      controller: controller.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ChannelTypeshWidget(
                              controller: controller,
                              channelTypes: controller.channelTypes,
                            ),
                            CustomElevatedButton(
                              text: "reset".tr,
                              buttonStyle: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: appTheme.primary,
                                  side: BorderSide(color: appTheme.primary)),
                              onPressed: () {
                                controller.reset("channelType");
                              },
                            ),
                            SizedBox(height: 12.v),
                            CustomElevatedButton(
                              text: "filter".tr,
                              onPressed: controller.onPressedFilterByChannels,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                            Obx(
                              () => SimpleDropDown(
                                icon: Padding(
                                  padding: EdgeInsets.only(right: 4.h),
                                  child: CustomImageView(
                                    imagePath: "dropdown".icon.svg,
                                    // width: 24.h,
                                  ),
                                ),
                                hintText:
                                    controller.year.value ?? "select_year".tr,
                                items: DateTime.now().yearList().map((year) {
                                  return DropDown(
                                      id: year,
                                      title: year.toString(),
                                      value: year);
                                }).toList(),
                                onChanged: (option) {
                                  controller.year(option?.value);
                                },
                              ),
                            ),
                            SizedBox(height: 4.v),
                            ChannelTypeshWidget(
                              controller: controller,
                              channelTypes: controller.channelTypes,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomElevatedButton(
                                    text: "reset".tr,
                                    buttonStyle: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: appTheme.primary,
                                        side: BorderSide(
                                            color: appTheme.primary)),
                                    onPressed: () {
                                      controller.reset("campaignYearSummary");
                                    },
                                  ),
                                ),
                                SizedBox(width: 16.h),
                                Expanded(
                                  child: CustomElevatedButton(
                                    text: "filter".tr,
                                    onPressed: controller.onPressedFilterByYear,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
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
                                      Obx(
                                        () => SimpleDropDown(
                                          icon: Padding(
                                            padding:
                                                EdgeInsets.only(right: 8.h),
                                            child: CustomImageView(
                                              imagePath: "dropdown".icon.svg,
                                              width: 24.h,
                                            ),
                                          ),
                                          hintText: controller.year.value ??
                                              "select_year".tr,
                                          items: DateTime.now()
                                              .yearList()
                                              .map((year) {
                                            return DropDown(
                                                id: year,
                                                title: year.toString(),
                                                value: year);
                                          }).toList(),
                                          onChanged: (option) {
                                            controller.year(option?.value);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.adaptSize),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
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
                                      Obx(
                                        () => SimpleDropDown(
                                          icon: Padding(
                                            padding:
                                                EdgeInsets.only(right: 8.h),
                                            child: CustomImageView(
                                              imagePath: "dropdown".icon.svg,
                                              width: 24.h,
                                            ),
                                          ),
                                          hintText: controller.month.value ??
                                              "select_month".tr,
                                          items: DateTime.now()
                                              .monthList()
                                              .map((month) {
                                            return DropDown(
                                                id: month,
                                                title: month.toString(),
                                                value: month);
                                          }).toList(),
                                          onChanged: (option) {
                                            controller.month(option?.value);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.v),
                            ChannelTypeshWidget(
                              controller: controller,
                              channelTypes: controller.channelTypes,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomElevatedButton(
                                    text: "reset".tr,
                                    buttonStyle: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: appTheme.primary,
                                        side: BorderSide(
                                            color: appTheme.primary)),
                                    onPressed: () {
                                      controller
                                          .reset("campaignYearMonthSummary");
                                    },
                                  ),
                                ),
                                SizedBox(width: 16.h),
                                Expanded(
                                  child: CustomElevatedButton(
                                    text: "filter".tr,
                                    onPressed:
                                        controller.onPressedFilterByMonth,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "day".tr,
                              style: TextStyle(
                                color: appTheme.black900,
                                fontSize: 15.fSize,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Obx(
                              () => CustomTextFormField(
                                hintText:
                                    controller.day.value?.formatYYYYMMDD ??
                                        "yyyy/mm/dd".tr,
                                textInputAction: TextInputAction.done,
                                borderDecoration: const OutlineInputBorder(),
                                readOnly: true,
                                onTap: () {
                                  Pickers.date(Get.context!).then((date) {
                                    if (date != null) {
                                      controller.day(date);
                                    }
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: 4.v),
                            ChannelTypeshWidget(
                              controller: controller,
                              channelTypes: controller.channelTypes,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomElevatedButton(
                                    text: "reset".tr,
                                    buttonStyle: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: appTheme.primary,
                                        side: BorderSide(
                                            color: appTheme.primary)),
                                    onPressed: () {
                                      controller
                                          .reset("campaignYearMonthDaySummary");
                                    },
                                  ),
                                ),
                                SizedBox(width: 16.h),
                                Expanded(
                                  child: CustomElevatedButton(
                                    text: "filter".tr,
                                    onPressed: controller.onPressedFilterByDay,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 64.v),
          Padding(
            padding: EdgeInsets.only(left: 8.h, right: 12.h),
            child: AppbarWithBackAndFilter(
              title: "campaign_summary".tr,
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
                children: [
                  SizedBox(height: 14.v),
                  const CustomDivider(),
                  SizedBox(height: 19.v),
                  Obx(() {
                    Props props = controller.props;
                    if (props.useState.value == UseState.none ||
                        props.useState.value == UseState.loading) {
                      return const SizedBox.shrink();
                    } else {
                      if (props.error.value.message != null) {
                        return TryAgain(
                          message: props.error.value.message,
                          tryAgain: controller.tryAgain,
                        );
                      } else {
                        return CustomCard(
                          child: Text(
                              "Total Amount: ${controller.campaigns.value?.currencySymbol}${controller.campaigns.value?.total!.toStringAsFixed(2) ?? 0.00}"),
                        );
                      }
                    }
                  }),
                  SizedBox(height: 19.v),
                  Expanded(
                    child: Obx(
                      () {
                        Props props = controller.props;
                        if (props.useState.value == UseState.none ||
                            props.useState.value == UseState.loading) {
                          return const CircularProgress();
                        } else {
                          List<CampaignValues>? campaigns =
                              controller.campaigns.value?.values ?? [];
                          String? currencySymbol =
                              controller.campaigns.value?.currencySymbol;
                          String? themeHome =
                              controller.campaigns.value?.themeHome;
                          if (props.error.value.message != null) {
                            return TryAgain(
                              message: props.error.value.message,
                              tryAgain: controller.tryAgain,
                            );
                          } else {
                            if (campaigns.isEmpty) {
                              return const Center(
                                child: Text('No Records Found'),
                              );
                            } else {
                              return ListView.separated(
                                itemCount: campaigns.length,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  return CustomCard(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "${campaigns[index].campaign}",
                                                style: TextStyle(
                                                  color: theme
                                                      .colorScheme.onPrimary,
                                                  fontSize: 16.fSize,
                                                  fontFamily: 'Nunito Sans',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            CustomImageView(
                                              imagePath:
                                                  "$themeHome${campaigns[index].icon}",
                                              height: 28.adaptSize,
                                              width: 28.adaptSize,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 2.v),
                                        const Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Amount",
                                              style: TextStyle(
                                                color: appTheme.gray600,
                                                fontSize: 13.fSize,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "$currencySymbol${campaigns[index].amount!.toStringAsFixed(2)}",
                                              style: TextStyle(
                                                color:
                                                    theme.colorScheme.primary,
                                                fontSize: 12.fSize,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "No. of  transactions",
                                              style: TextStyle(
                                                color: appTheme.gray600,
                                                fontSize: 13.fSize,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 5.v, bottom: 3.v),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.h,
                                                  vertical: 4.h),
                                              decoration: AppDecoration
                                                  .fillPrimary
                                                  .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder8,
                                              ),
                                              child: Text(
                                                "${campaigns[index].numberOfTransaction}",
                                                style: TextStyle(
                                                  color: appTheme.whiteA700,
                                                  fontSize: 11.fSize,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Progress",
                                              style: TextStyle(
                                                color: appTheme.gray600,
                                                fontSize: 13.fSize,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 6.v,
                                                bottom: 9.v,
                                              ),
                                              child: Container(
                                                height: 5.v,
                                                width: 175.h,
                                                decoration: BoxDecoration(
                                                  color: appTheme.blueGray100,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    2.h,
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    2.h,
                                                  ),
                                                  child:
                                                      LinearProgressIndicator(
                                                    value: (campaigns[index]
                                                            .percentage! /
                                                        100),
                                                    backgroundColor:
                                                        appTheme.blueGray100,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      appTheme.gray80001,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Percentage",
                                              style: TextStyle(
                                                color: appTheme.gray600,
                                                fontSize: 13.fSize,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 5.v, bottom: 3.v),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.h,
                                                  vertical: 4.h),
                                              decoration: AppDecoration
                                                  .fillPrimary
                                                  .copyWith(
                                                color: appTheme.gray80001,
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder8,
                                              ),
                                              child: Text(
                                                "${campaigns[index].percentage!.toStringAsFixed(2)}%",
                                                style: TextStyle(
                                                  color: appTheme.whiteA700,
                                                  fontSize: 11.fSize,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
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
                              );
                            }
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 30.v),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
