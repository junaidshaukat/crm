import 'package:flutter/material.dart';
import '/core/app_export.dart';

class AnalysisFilterByRangeDialog extends StatelessWidget {
  const AnalysisFilterByRangeDialog({super.key, required this.controller});
  final AnalyticsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 100.h, right: 32.h, top: 100.v),
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 7.v),
      decoration: AppDecoration.outlineBluegray100011.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 3.v),
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    "month".tr,
                    style: TextStyle(
                      color: appTheme.gray80001,
                      fontSize: 12.fSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: "close".icon.svg,
                  height: 15.adaptSize,
                  width: 15.adaptSize,
                  margin: EdgeInsets.only(bottom: 4.v),
                  onTap: () {
                    Get.back();
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 5.v),
          SimpleDropDown(
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.h),
              child: CustomImageView(
                imagePath: "dropdown".icon.svg,
                height: 23.v,
                width: 28.h,
              ),
            ),
            hintText: "select".tr,
            items: const [],
            onChanged: (value) {},
          ),
          SizedBox(height: 3.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Text(
                "year".tr,
                style: TextStyle(
                  color: appTheme.gray80001,
                  fontSize: 12.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          SimpleDropDown(
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.h),
              child: CustomImageView(
                imagePath: "dropdown".icon.svg,
                height: 23.v,
                width: 28.h,
              ),
            ),
            hintText: "2023".tr,
            items: const [],
            onChanged: (value) {},
          ),
          SizedBox(height: 16.v),
          CustomElevatedButton(
            height: 40.v,
            width: 149.h,
            text: "filter".tr,
            onPressed: () {
              onTapFilter();
            },
          )
        ],
      ),
    );
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapclose() {
    // Get.toNamed(
    //   AppRoutes.homeContainerScreen,
    // );
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapFilter() {
    // Get.toNamed(
    //   AppRoutes.homeContainerScreen,
    // );
  }
}
