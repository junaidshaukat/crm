import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  const CustomCard({super.key, this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: Colors.transparent,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 10,
              decoration: BoxDecoration(
                color: appTheme.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  border: Border.all(
                    color: appTheme.blueGray10001,
                    width: 1.h,
                  ),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black900.withOpacity(0.1),
                      spreadRadius: 1.h,
                      blurRadius: 1.h,
                    ),
                  ],
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardGRL extends StatelessWidget {
  const CardGRL({super.key, this.child, this.padding});
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(
        left: 9.h,
        // right: 1,
        // bottom: 1,
        // top: 1,
      ),
      decoration: AppDecoration.fillGreen,
      child: Container(
        width: double.maxFinite,
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: 8.h,
              vertical: 16.v,
            ),
        decoration: AppDecoration.fillWhite.copyWith(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          border: Border.all(
            color: appTheme.primary,
          ),
        ),
        child: child,
      ),
    );
  }
}
