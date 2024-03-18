import 'dart:ui';
import 'package:flutter/material.dart';
import '/core/app_export.dart';

class AppbarMini extends StatelessWidget implements PreferredSizeWidget {
  const AppbarMini({
    super.key,
    this.height,
    this.onTapFilter,
    required this.title,
  });

  final double? height;
  final String title;
  final Function()? onTapFilter;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.v),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: "back".icon.svg,
              height: 24.h,
              width: 24.v,
              margin: EdgeInsets.only(bottom: 8.v),
              onTap: () {
                Get.back();
              },
            ),
            SizedBox(width: 8.h),
            SizedBox(
              width: onTapFilter != null ? 200.h : 300.h,
              child: Text(
                title,
                maxLines: 2,
                style: TextStyle(
                  color: appTheme.whiteA700,
                  fontSize: 16.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            if (onTapFilter != null) const Spacer(),
            if (onTapFilter != null)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.h),
                decoration: AppDecoration.fillWhiteA.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder16,
                ),
                child: InkWell(
                  onTap: onTapFilter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: "filters".icon.svg,
                        height: 24.v,
                        width: 24.h,
                      ),
                      SizedBox(width: 2.h),
                      Text("filters".tr),
                      SizedBox(width: 2.h),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, height ?? kToolbarHeight);
}

class PreferredSizeAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PreferredSizeAppBar({
    super.key,
    this.height,
    required this.child,
  });

  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize, // Set this height
      child: child,
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, height ?? kToolbarHeight);
}

class StatusBarPlaceHolder extends StatelessWidget
    implements PreferredSizeWidget {
  const StatusBarPlaceHolder({super.key, this.color, this.height});
  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        color: color,
        width: preferredSize.width,
        height: preferredSize.height,
      ),
    );
  }

  @override
  Size get preferredSize => Size(
        double.maxFinite,
        height ?? PlatformDispatcher.instance.views.first.padding.top,
      );
}

class AppbarWithBackAndFilter extends StatelessWidget {
  const AppbarWithBackAndFilter({
    super.key,
    required this.title,
    this.onTapFilter,
    this.back = true,
  });

  final String title;
  final bool back;
  final Function()? onTapFilter;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (back)
          Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: CustomImageView(
              imagePath: "back".icon.svg,
              height: 24.v,
              width: 24.h,
              onTap: () {
                Get.back();
              },
            ),
          ),
        GestureDetector(
          onTap: () {
            if (back) Get.back();
          },
          child: Text(
            title,
            maxLines: 2,
            style: TextStyle(
              color: appTheme.whiteA700,
              fontSize: 16.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        if (onTapFilter != null) const Spacer(),
        if (onTapFilter != null)
          InkWell(
            onTap: onTapFilter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.v),
              decoration: AppDecoration.fillWhiteA.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: "filters".icon.svg,
                    height: 24.v,
                    width: 24.h,
                  ),
                  SizedBox(width: 2.h),
                  Text("filters".tr),
                  SizedBox(width: 2.h),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
