import 'package:flutter/material.dart';
import '/core/app_export.dart';

class FilterByDayDialog extends StatelessWidget {
  const FilterByDayDialog({
    super.key,
    required this.date,
    required this.onChanged,
    required this.onPressed,
  });
  final Rx<DateTime> date;
  final void Function() onChanged;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.h, right: 120.h, top: 180.v),
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
                    "filter_by_date".tr,
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
                  margin: EdgeInsets.only(bottom: 5.v),
                  onTap: () => Get.back(),
                )
              ],
            ),
          ),
          SizedBox(height: 4.v),
          Obx(() => CustomTextFormField(
                hintText: date.value.formatYYYYMMDD,
                textInputAction: TextInputAction.done,
                borderDecoration: const OutlineInputBorder(),
                readOnly: true,
                suffix: Padding(
                  padding: EdgeInsets.all(12.adaptSize),
                  child: CustomImageView(
                    imagePath: 'calender'.icon.svg,
                    height: 12.adaptSize,
                    width: 12.adaptSize,
                  ),
                ),
                onTap: () {
                  Pickers.date(Get.context!).then((value) {
                    if (value != null) {
                      date.value = value;
                    }
                  });
                },
              )),
          SizedBox(height: 7.v),
          CustomElevatedButton(
            height: 40.v,
            text: "filter".tr,
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
