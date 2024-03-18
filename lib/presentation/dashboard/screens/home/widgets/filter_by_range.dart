import 'package:flutter/material.dart';
import '/core/app_export.dart';

class FilterByRangeDialog extends StatelessWidget {
  const FilterByRangeDialog({
    super.key,
    required this.year,
    required this.month,
    required this.yearList,
    required this.monthList,
    required this.onChangeYear,
    required this.onChangeMonth,
    required this.onPressed,
  });

  final String year;
  final String month;
  final List<String> yearList;
  final List<String> monthList;

  final void Function(dynamic val) onChangeYear;
  final void Function(dynamic val) onChangeMonth;
  final void Function() onPressed;

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
                  onTap: () => Get.back(),
                )
              ],
            ),
          ),
          SizedBox(height: 5.v),
          SimpleDropDown(
            icon: Padding(
              padding: EdgeInsets.only(right: 16.h),
              child: CustomImageView(
                imagePath: "dropdown".icon.svg,
              ),
            ),
            hintText: month.isEmpty == true ? "select_month".tr : month,
            items: monthList.map((val) {
              return DropDown(
                id: val,
                title: val.toString(),
                value: val.toString(),
              );
            }).toList(),
            onChanged: onChangeMonth,
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
              padding: EdgeInsets.only(right: 16.h),
              child: CustomImageView(
                imagePath: "dropdown".icon.svg,
              ),
            ),
            hintText: year.isEmpty == true ? "select_year".tr : year,
            items: yearList.map((val) {
              return DropDown(
                id: val,
                title: val.toString(),
                value: val.toString(),
              );
            }).toList(),
            onChanged: onChangeYear,
          ),
          SizedBox(height: 16.v),
          CustomElevatedButton(
            height: 40.v,
            width: 149.h,
            text: "filter".tr,
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
