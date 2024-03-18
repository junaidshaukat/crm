import 'package:flutter/material.dart';
import '/core/app_export.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    this.title = '',
    this.subtitle,
    this.content = '',
    this.imagePath = '',
    this.more,
    this.processing = false,
    this.error,
    this.onRefresh,
  });

  final String title;
  final String? subtitle;
  final String content;
  final String imagePath;
  final Widget? more;
  final bool processing;
  final Object? error;
  final Future<void> Function()? onRefresh;

  Widget buildHeader() {
    if (more != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: appTheme.blueGray30001,
                  fontSize: 12.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (subtitle == null) SizedBox(height: 11.v),
              if (subtitle != null)
                Text(
                  subtitle!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: appTheme.blueGray30001,
                    fontSize: 8.fSize,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
          if (more != null) more!
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: appTheme.blueGray30001,
              fontSize: 12.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          if (subtitle == null) SizedBox(height: 16.v),
          if (subtitle != null)
            Text(
              subtitle!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: appTheme.blueGray30001,
                fontSize: 8.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      );
    }
  }

  Widget buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            content,
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontSize: 13.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        CustomImageView(
          imagePath: imagePath,
          height: 24.v,
          width: 24.h,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (processing) {
      return Container(
        width: 170.h,
        padding: EdgeInsets.symmetric(
          horizontal: 8.h,
          vertical: 16.v,
        ),
        decoration: AppDecoration.outlineBlueGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: SizedBox(
          width: 170.h,
          height: 60.v,
          child: const CircularProgress(),
        ),
      );
    } else {
      if (error != null) {
        return Container(
          width: 170.h,
          padding: EdgeInsets.symmetric(
            horizontal: 8.h,
            vertical: 16.v,
          ),
          decoration: AppDecoration.outlineBlueGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: SizedBox(
            width: 170.h,
            height: 60.v,
            child: Center(
              child: RefreshIndicator.adaptive(
                onRefresh: onRefresh!,
                child: SizedBox(
                  height: 60.v,
                  child: GestureDetector(
                    onTap: onRefresh,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.refresh, color: appTheme.red900),
                          SizedBox(width: 8.h),
                          Text(
                            'try_again'.tr,
                            style: TextStyle(
                              color: appTheme.red900,
                              fontSize: 12.fSize,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        return Container(
          width: 170.h,
          padding: EdgeInsets.symmetric(
            horizontal: 8.h,
            vertical: 16.v,
          ),
          decoration: AppDecoration.outlineBlueGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [buildHeader(), SizedBox(height: 6.v), buildFooter()],
          ),
        );
      }
    }
  }
}
