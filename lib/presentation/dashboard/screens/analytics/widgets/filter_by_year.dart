import 'package:flutter/material.dart';
import '/core/app_export.dart';

class AnalysisFilterByYearsDialog extends StatelessWidget {
  const AnalysisFilterByYearsDialog({super.key, required this.controller});

  final AnalyticsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 100.h, right: 24.h),
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.v),
      decoration: AppDecoration.outlineBluegray100011.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 5.v),
          Padding(
            padding: EdgeInsets.only(left: 1.h, right: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.v),
                  child: Text(
                    "filter_by_years".tr,
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
                  onTap: () {
                    Get.back();
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 4.v),
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
          SizedBox(height: 7.v),
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
  onTapImgMakiCross() {
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
