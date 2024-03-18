import 'package:flutter/material.dart';
import '/core/app_export.dart';

class TenderTransactionCard extends StatelessWidget {
  const TenderTransactionCard({
    super.key,
    this.type,
    this.transaction,
    this.amount,
    this.text,
  });

  final String? type;
  final String? text;
  final String? transaction;
  final String? amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.h,
      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 7.v),
      decoration: AppDecoration.outlineBluegray100011.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          Text(
            '$text',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: appTheme.blueGray30001,
              fontSize: 12.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 9.v),
          Text(
            "Transaction: $transaction",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: appTheme.blueGray30001,
              fontSize: 12.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 9.v),
          Text(
            '$amount',
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontSize: 16.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class ChannelCard extends StatelessWidget {
  const ChannelCard({
    super.key,
    this.type,
    this.text,
    this.transaction,
    this.amount,
    this.percentage,
  });

  final String? type;
  final String? text;
  final String? transaction;
  final String? amount;
  final String? percentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$text- $amount",
            style: TextStyle(
              color: appTheme.black900,
              fontSize: 12.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                  child: LinearProgressIndicator(
                    value: percentage!.toNum * 0.01,
                    minHeight: 20.v,
                    backgroundColor: appTheme.gray10002,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      appTheme.blueGray8007f,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 20.v,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: appTheme.purple400,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                  child: Text(
                    "${double.tryParse(percentage!)!.toStringAsFixed(2)}%",
                    style: TextStyle(
                      color: appTheme.whiteA700,
                      fontSize: 12.fSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ReceiptCard extends StatelessWidget {
  const ReceiptCard({
    super.key,
    this.type,
    this.transaction,
    this.amount,
    this.percentage,
  });

  final String? type;
  final String? transaction;
  final String? amount;
  final String? percentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.v),
          decoration: AppDecoration.outlineBluegray1001a
              .copyWith(borderRadius: BorderRadiusStyle.customBorderTL8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 2.v),
              Padding(
                padding: EdgeInsets.only(right: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.v),
                      child: Text(
                        "amount".tr,
                        style: TextStyle(
                          color: appTheme.gray600,
                          fontSize: 14.fSize,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      "$amount",
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 14.fSize,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 8.v),
              Padding(
                padding: EdgeInsets.only(right: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "no_of_transactions".tr,
                      style: TextStyle(
                        color: appTheme.gray600,
                        fontSize: 14.fSize,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.h, vertical: 1.v),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(10.h),
                      ),
                      child: Text(
                        "$transaction",
                        style: TextStyle(
                          color: appTheme.whiteA700,
                          fontSize: 14.fSize,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 13.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "progress".tr,
                    style: TextStyle(
                      color: appTheme.gray600,
                      fontSize: 14.fSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.v, bottom: 9.v),
                    child: Container(
                      height: 5.v,
                      width: 175.h,
                      decoration: BoxDecoration(
                        color: appTheme.blueGray100,
                        borderRadius: BorderRadius.circular(2.h),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2.h),
                        child: LinearProgressIndicator(
                          value: percentage!.toNum * 0.01,
                          backgroundColor: appTheme.blueGray100,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            appTheme.gray80001,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 3.v),
              Padding(
                padding: EdgeInsets.only(right: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.v),
                      child: Text(
                        "percentage".tr,
                        style: TextStyle(
                          color: appTheme.gray600,
                          fontSize: 14.fSize,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.h, vertical: 1.v),
                      decoration: BoxDecoration(
                        color: appTheme.gray80001,
                        borderRadius: BorderRadius.circular(10.h),
                      ),
                      child: Text(
                        "$percentage%",
                        style: TextStyle(
                          color: appTheme.whiteA700,
                          fontSize: 14.fSize,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 40.v,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.v),
            decoration: type == "receipted".tr
                ? AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderBL8,
                  )
                : AppDecoration.fillOrange.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderBL8,
                  ),
            child: Text(
              "$type".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: appTheme.whiteA700,
                fontSize: 16.fSize,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
