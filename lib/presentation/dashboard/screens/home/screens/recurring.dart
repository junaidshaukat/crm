import 'package:flutter/material.dart';
import '/core/app_export.dart';

class HomeRecurringScreen extends StatelessWidget {
  final controller = Get.put(HomeRecurringController());
  HomeRecurringScreen({super.key});

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
        height: (FIGMA_DESIGN_HEIGHT * 0.9).adaptSize,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text(
                    "recurring_filter".tr,
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 20.fSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.h),
                  ),
                ],
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
              Obx(
                () => CustomTextFormField(
                  hintText: controller.date.value.formatYYYYMMDD,
                  textInputAction: TextInputAction.done,
                  borderDecoration: const OutlineInputBorder(),
                  readOnly: true,
                  onTap: () {
                    Pickers.date(Get.context!).then((date) {
                      if (date != null) {
                        controller.date(date);
                      }
                    });
                  },
                ),
              ),
              SizedBox(height: 16.v),
              CustomElevatedButton(
                text: "filter".tr,
                onPressed: controller.onPressedFilter,
              )
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
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: AppbarWithBackAndFilter(
              title: "recurring".tr,
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
                            "${"total_amount".tr}: ${controller.recurrings.value?.currencySymbol}${controller.recurrings.value!.total!.toStringAsFixed(2)}",
                          ),
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
                          if (props.error.value.message != null) {
                            return TryAgain(
                              message: props.error.value.message,
                              tryAgain: controller.tryAgain,
                            );
                          } else {
                            List<RecurringValues>? recurrings =
                                controller.recurrings.value?.values ?? [];
                            String? currencySymbol =
                                controller.recurrings.value?.currencySymbol;
                            String? themeHome =
                                controller.recurrings.value?.themeHome;

                            if (recurrings.isEmpty) {
                              return Center(
                                child: Text('no_records_found'.tr),
                              );
                            } else {
                              return ListView.separated(
                                itemCount: recurrings.length,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  return CustomCard(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              recurrings[index].campaign,
                                              style: TextStyle(
                                                color:
                                                    theme.colorScheme.onPrimary,
                                                fontSize: 16.fSize,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            CustomImageView(
                                              imagePath:
                                                  "$themeHome${recurrings[index].icon}",
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
                                              "amount".tr,
                                              style: TextStyle(
                                                color: appTheme.gray600,
                                                fontSize: 13.fSize,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "$currencySymbol${recurrings[index].amount?.toStringAsFixed(2)}",
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
                                              "no_of_transactions".tr,
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
                                                horizontal: 8.adaptSize,
                                                vertical: 4.adaptSize,
                                              ),
                                              decoration: AppDecoration
                                                  .fillPrimary
                                                  .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder8,
                                              ),
                                              child: Text(
                                                "${recurrings[index].numberOfTransaction}",
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
                                              "progress".tr,
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
                                                    value: (recurrings[index]
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
                                              "percentage".tr,
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
                                                "${recurrings[index].percentage}%",
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
                                  return SizedBox(height: 10.v);
                                },
                              );
                            }
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 19.v),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
