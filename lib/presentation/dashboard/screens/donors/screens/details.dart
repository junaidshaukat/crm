import 'package:flutter/material.dart';
import '/core/app_export.dart';

class DonorDetailsScreen extends StatelessWidget {
  final DonorData donor;
  final controller = Get.put(DonorDetailsController());

  DonorDetailsScreen(this.donor, {super.key}) {
    controller.email.value = donor.email;
    controller.setEmail(donor.email);
    controller.getYearly();
    controller.getLifetime();
    controller.getKeyDates();
    controller.getLastNthSummary();
    controller.getRecentTransactions();
    controller.getTotalDonationsAmount();
    controller.getCampaignsDistributions();
  }

  Widget progress({double? height = 200, Widget? child}) {
    return Container(
      height: height,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 16.v),
      decoration: AppDecoration.outlineBluegray100011.copyWith(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget? avatar(DonorData donor) {
    return CircleAvatar(
      radius: 144.adaptSize,
      backgroundImage: donor.profileImage != null
          ? NetworkImage(donor.profileImage ?? "")
          : null,
      child: donor.profileImage == null
          ? Text(
              "${donor.firstName.toString().avatar}${donor.lastName.toString().avatar}",
              style: TextStyle(
                color: appTheme.whiteA700,
                fontSize: 16.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            )
          : null,
    );
  }

  Widget listTile({
    String? icon,
    required String label,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (icon != null) ...[
          Text(
            label,
            style: TextStyle(
              fontSize: 11.fSize,
              fontFamily: 'Poppins',
              color: appTheme.green900,
              fontWeight: FontWeight.w700,
            ),
          ),
          CustomImageView(
            width: 24.h,
            imagePath: icon,
            fit: BoxFit.cover,
          ),
        ],
        if (icon == null) ...[
          Text(
            label,
            style: TextStyle(
              color: appTheme.gray80001,
              fontSize: 11.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: appTheme.gray600,
              fontSize: 11.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ],
    );
  }

  Widget card({
    required String title,
    List items = const [],
    Widget? more,
  }) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 16.v),
      decoration: AppDecoration.outlineBluegray100011.copyWith(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: CustomTextStyles.labelLargeBold,
                ),
                if (more != null) more,
              ],
            ),
          ),
          const Divider(),
          SizedBox(height: 8.v),
          Wrap(
            children: items.map((item) {
              return Column(
                children: [
                  SizedBox(height: 4.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['key'],
                          style: CustomTextStyles.labelMediumGray600,
                        ),
                        Text(
                          item['value'],
                          style: CustomTextStyles.labelMediumGray600,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 4.v),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget totalDonationsAmount({
    Widget? more,
    required String title,
    required num numberOfYears,
    required TotalDonationsAmount data,
  }) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 16.v),
      decoration: AppDecoration.outlineBluegray100011.copyWith(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: CustomTextStyles.labelLargeBold,
                ),
                if (more != null) more,
              ],
            ),
          ),
          const Divider(),
          SizedBox(height: 8.v),
          Padding(
            padding: EdgeInsets.only(right: 12.h),
            child: LineGraph2(
              data: data,
              numberOfYears: numberOfYears,
            ),
          ),
          SizedBox(height: 7.v),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: data.chartData!.map((chartData) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 4.h),
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: chartData.color,
                      ),
                    ),
                    SizedBox(width: 4.h),
                    Text('${chartData.year}'),
                    SizedBox(width: 4.h),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget campaignsDistribution({
    Widget? more,
    required String title,
    required CampaignsDistribution distribution,
  }) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 16.v),
      decoration: AppDecoration.outlineBluegray100011.copyWith(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  title,
                  style: CustomTextStyles.labelLargeBold,
                )),
                if (more != null) more,
              ],
            ),
          ),
          const Divider(),
          SizedBox(height: 8.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: Column(
              children: distribution.values!.map((e) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.v),
                  child: ChannelCard(
                    percentage: distribution.total
                        .toString()
                        .percentage(e.amount.toString()),
                    type: '${e.campaign}',
                    text: '${e.campaign}',
                    transaction: '${e.numberOfTransaction}',
                    amount: '${distribution.currencySymbol}${e.amount}',
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget recentTransactions({
    Widget? more,
    required String title,
    required RecentTransactions transactions,
  }) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 16.v),
      decoration: AppDecoration.outlineBluegray100011.copyWith(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: CustomTextStyles.labelLargeBold,
                ),
                if (more != null) more,
              ],
            ),
          ),
          const Divider(),
          SizedBox(height: 4.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: Wrap(
              spacing: 8.v,
              runSpacing: 8.v,
              children: transactions.transactions!.map((item) {
                return CustomCard(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4.v),
                        decoration: AppDecoration.fillWhite,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            listTile(
                              value: "".tr,
                              icon: item.campaignLogo,
                              label: "${item.campaign}",
                            ),
                            SizedBox(height: 4.v),
                            Divider(
                              color: appTheme.gray600.withOpacity(0.4),
                              indent: 0.h,
                            ),
                            SizedBox(height: 4.v),
                            listTile(
                              label: "channel".tr,
                              value: "${item.nodeType}",
                            ),
                            SizedBox(height: 4.v),
                            Divider(
                              color: appTheme.gray600.withOpacity(0.4),
                              indent: 0.h,
                            ),
                            SizedBox(height: 4.v),
                            listTile(
                              label: "amount".tr,
                              value:
                                  "${transactions.currencySymbol}${item.approvedAmount}",
                            ),
                            SizedBox(height: 4.v),
                            Divider(
                              color: appTheme.gray600.withOpacity(0.4),
                              indent: 0.h,
                            ),
                            SizedBox(height: 4.v),
                            listTile(
                              label: "tender_type".tr,
                              value: "${item.cardType}",
                            ),
                            SizedBox(height: 4.v),
                            Divider(
                              color: appTheme.gray600.withOpacity(0.4),
                              indent: 0.h,
                            ),
                            SizedBox(height: 4.v),
                            listTile(
                              label: "date".tr,
                              value: "${item.transactionDate}",
                            ),
                            SizedBox(height: 4.v),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
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
              title: "back_to_donors".tr,
            ),
          ),
          SizedBox(height: 16.v),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
              decoration: AppDecoration.outlinePrimary.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL28,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 64.adaptSize,
                                height: 64.adaptSize,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 3.h,
                                  vertical: 1.v,
                                ),
                                decoration: AppDecoration.fillPrimary.copyWith(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  child: avatar(donor),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 6.h,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${donor.firstName} ${donor.middleName} ${donor.lastName}",
                                      style: TextStyle(
                                        color: theme.colorScheme.onPrimary,
                                        fontSize: 12.fSize,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "${donor.accountType?.toLowerCase().tr}",
                                      style: TextStyle(
                                        color: theme.colorScheme.onPrimary,
                                        fontSize: 10.fSize,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Launcher.tel(donor.phone);
                                    },
                                    child: CustomImageView(
                                      width: 20.h,
                                      height: 20.v,
                                      svgColor: appTheme.primary,
                                      imagePath: 'telephone'.icon.svg,
                                    ),
                                  ),
                                  SizedBox(width: 8.h),
                                  InkWell(
                                    onTap: () {
                                      Launcher.mailto(donor.email ?? '');
                                    },
                                    child: CustomImageView(
                                      width: 20.h,
                                      height: 20.v,
                                      svgColor: appTheme.primary,
                                      imagePath: 'envelope'.icon.svg,
                                    ),
                                  ),
                                  SizedBox(width: 8.h),
                                  InkWell(
                                    onTap: () {
                                      Launcher.maps(donor.streetAddress ?? '');
                                    },
                                    child: CustomImageView(
                                      width: 20.h,
                                      height: 20.v,
                                      svgColor: appTheme.primary,
                                      imagePath: 'sign-turn-right'.icon.svg,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 12.v),
                          SizedBox(
                            width: double.maxFinite,
                            child: Text(
                              "${donor.streetAddress}, ${donor.city}, ${donor.provinceState}\r${donor.postalZipCode}, ${donor.country}\n${donor.email}",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: appTheme.gray600,
                                fontSize: 12.fSize,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 12.v),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 4.v),
                            decoration: AppDecoration.fillLightGreen,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (donor.accountType == 'B') ...[
                                  listTile(
                                    label: "business_name".tr,
                                    value: donor.businessName ?? "None",
                                  ),
                                  SizedBox(height: 4.v),
                                  Divider(
                                    color: appTheme.gray600.withOpacity(0.4),
                                    indent: 0.h,
                                  ),
                                  SizedBox(height: 3.v),
                                ],
                                listTile(
                                  label: "phone".tr,
                                  value: "${donor.phone ?? "None"}",
                                ),
                                SizedBox(height: 4.v),
                                Divider(
                                  color: appTheme.gray600.withOpacity(0.4),
                                  indent: 0.h,
                                ),
                                SizedBox(height: 3.v),
                                listTile(
                                  label: "created".tr,
                                  value: "${donor.createDateTime?.dateTime}",
                                ),
                                SizedBox(height: 4.v),
                                Divider(
                                  color: appTheme.gray600.withOpacity(0.4),
                                  indent: 0.h,
                                ),
                                SizedBox(height: 3.v),
                                listTile(
                                  label: "updated".tr,
                                  value: "${donor.updateDateTime?.dateTime}",
                                ),
                                SizedBox(height: 4.v),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.v),
                      Obx(() {
                        Rx<UseState> useState =
                            controller.propsLifetime.useState;
                        Rx<UseError> error = controller.propsLifetime.error;

                        if (useState.value == UseState.none ||
                            useState.value == UseState.processing) {
                          return progress(
                            height: 180.v,
                            child: const CircularProgress(),
                          );
                        } else {
                          if (error.value.message != null) {
                            return progress(
                              height: 180.v,
                              child: TryAgain(
                                message: error.value.message,
                                tryAgain: () async {
                                  return controller.getLifetime();
                                },
                              ),
                            );
                          } else {
                            LifetimeData lifetime = controller.lifetime.value;
                            return card(
                              title: 'lifetime'.tr,
                              items: [
                                {
                                  'key': 'min_contribution'.tr,
                                  'value':
                                      "${lifetime.currencySymbol}${lifetime.minContribution?.toFixed}"
                                },
                                {
                                  'key': 'max_contribution'.tr,
                                  'value':
                                      "${lifetime.currencySymbol}${lifetime.maxContribution?.toFixed}"
                                },
                                {
                                  'key': 'number_of_contributions'.tr,
                                  'value': "${lifetime.numberOfContribution}"
                                },
                                {
                                  'key': 'total_contribution'.tr,
                                  'value':
                                      "${lifetime.currencySymbol}${lifetime.totalContribution?.toFixed}"
                                }
                              ],
                            );
                          }
                        }
                      }),
                      SizedBox(height: 16.v),
                      Obx(() {
                        Rx<UseState> useState =
                            controller.propsKeyDates.useState;
                        Rx<UseError> error = controller.propsKeyDates.error;

                        if (useState.value == UseState.none ||
                            useState.value == UseState.processing) {
                          return progress(
                            height: 160.v,
                            child: const CircularProgress(),
                          );
                        } else {
                          if (error.value.message != null) {
                            return progress(
                              height: 160.v,
                              child: TryAgain(
                                message: error.value.message,
                                tryAgain: () async {
                                  return controller.getKeyDates();
                                },
                              ),
                            );
                          } else {
                            KeyDatesData keyDates = controller.keyDates.value;
                            return card(
                              title: 'key_dates'.tr,
                              items: [
                                {
                                  'key': 'registeration_date'.tr,
                                  'value': "${keyDates.registrationDate}"
                                },
                                {
                                  'key': 'first_contribution'.tr,
                                  'value': "${keyDates.firstContribution}"
                                },
                                {
                                  'key': 'last_contribution'.tr,
                                  'value': "${keyDates.lastContribution}"
                                },
                              ],
                            );
                          }
                        }
                      }),
                      SizedBox(height: 16.v),
                      Obx(() {
                        Rx<UseState> useState = controller.propsYearly.useState;
                        Rx<UseError> error = controller.propsYearly.error;

                        if (useState.value == UseState.none ||
                            useState.value == UseState.processing) {
                          return progress(
                            height: 180.v,
                            child: const CircularProgress(),
                          );
                        } else {
                          if (error.value.message != null) {
                            return progress(
                              height: 180.v,
                              child: TryAgain(
                                message: error.value.message,
                                tryAgain: () async {
                                  return controller.getYearly();
                                },
                              ),
                            );
                          } else {
                            String year = controller.year1.value;
                            YearlyData yearly = controller.yearly.value;

                            return card(
                              title: "${'year'.tr} - $year",
                              items: [
                                {
                                  'key': 'min_contribution'.tr,
                                  'value':
                                      "${yearly.currencySymbol}${yearly.minContribution?.toFixed}"
                                },
                                {
                                  'key': 'max_contribution'.tr,
                                  'value':
                                      "${yearly.currencySymbol}${yearly.maxContribution?.toFixed}"
                                },
                                {
                                  'key': 'number_of_contributions'.tr,
                                  'value': "${yearly.numberOfContribution}"
                                },
                                {
                                  'key': 'total_contribution'.tr,
                                  'value':
                                      "${yearly.currencySymbol}${yearly.totalContribution?.toFixed}"
                                }
                              ],
                              more: InkWell(
                                onTap: () {
                                  Get.dialog(
                                    AlertDialog(
                                      backgroundColor: Colors.transparent,
                                      contentPadding: EdgeInsets.zero,
                                      insetPadding:
                                          const EdgeInsets.only(left: 0),
                                      content: FilterByYearsDialog(
                                        hintText: 'filter_by_year'.tr,
                                        year: controller.year1.value,
                                        yearList: DateTime.now().yearList(),
                                        onChanged: (option) {
                                          year = option?.value;
                                        },
                                        onPressed: () {
                                          controller.year1.value = year;
                                          controller.getYearly();
                                          Get.back();
                                        },
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.h,
                                    vertical: 4.v,
                                  ),
                                  child: CustomImageView(
                                    imagePath: "more".icon.svg,
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                      }),
                      SizedBox(height: 16.v),
                      Obx(() {
                        Rx<UseState> useState =
                            controller.propsLastNthSummary.useState;
                        Rx<UseError> error =
                            controller.propsLastNthSummary.error;

                        if (useState.value == UseState.none ||
                            useState.value == UseState.processing) {
                          return progress(
                            height: 160.v,
                            child: const CircularProgress(),
                          );
                        } else {
                          if (error.value.message != null) {
                            return progress(
                              height: 160.v,
                              child: TryAgain(
                                message: error.value.message,
                                tryAgain: () async {
                                  return controller.getLastNthSummary();
                                },
                              ),
                            );
                          } else {
                            String noOfMonths = controller.noOfMonths.value;
                            LastNthSummaryData lastNthSummary =
                                controller.lastNthSummary.value;

                            return card(
                              title:
                                  "${'last'.tr} $noOfMonths ${'months_summary'.tr}",
                              items: [
                                {
                                  'key': 'total_contribution'.tr,
                                  'value':
                                      "${lastNthSummary.currencySymbol}${lastNthSummary.totalContribution?.toFixed}"
                                },
                                {
                                  'key': 'no_of_contribution'.tr,
                                  'value':
                                      "${lastNthSummary.numberOfContribution}"
                                },
                                {
                                  'key': 'since'.tr,
                                  'value': "${lastNthSummary.since}"
                                },
                              ],
                              more: InkWell(
                                onTap: () {
                                  Get.dialog(
                                    AlertDialog(
                                      backgroundColor: Colors.transparent,
                                      contentPadding: EdgeInsets.zero,
                                      insetPadding:
                                          const EdgeInsets.only(left: 0),
                                      content: FilterByYearsDialog(
                                        hintText: 'months'.tr,
                                        year: controller.noOfMonths.value,
                                        yearList: DateTime.now().monthsList(),
                                        onChanged: (option) {
                                          noOfMonths = option?.value;
                                        },
                                        onPressed: () {
                                          controller.noOfMonths.value =
                                              noOfMonths;
                                          controller.getLastNthSummary();
                                          Get.back();
                                        },
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.h,
                                    vertical: 4.v,
                                  ),
                                  child: CustomImageView(
                                    imagePath: "more".icon.svg,
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                      }),
                      SizedBox(height: 16.v),
                      Obx(() {
                        Rx<UseState> useState =
                            controller.propsTotalDonationsAmount.useState;
                        Rx<UseError> error =
                            controller.propsTotalDonationsAmount.error;

                        if (useState.value == UseState.none ||
                            useState.value == UseState.processing) {
                          return progress(
                            height: 280.v,
                            child: const CircularProgress(),
                          );
                        } else {
                          if (error.value.message != null) {
                            return progress(
                              height: 280.v,
                              child: TryAgain(
                                message: error.value.message,
                                tryAgain: () async {
                                  return controller.getTotalDonationsAmount();
                                },
                              ),
                            );
                          } else {
                            String numberOfYears = controller.noOfYears.value;
                            TotalDonationsAmount data =
                                controller.totalDonationsAmount.value;

                            return totalDonationsAmount(
                              data: data,
                              numberOfYears: num.parse(numberOfYears),
                              title:
                                  "${'total_donations_amount'.tr} - ${data.currencySymbol}${data.total?.toStringAsFixed(2)}",
                              more: InkWell(
                                onTap: () {
                                  Get.dialog(
                                    AlertDialog(
                                      backgroundColor: Colors.transparent,
                                      contentPadding: EdgeInsets.zero,
                                      insetPadding:
                                          const EdgeInsets.only(left: 0),
                                      content: FilterByYearsDialog(
                                        year: numberOfYears,
                                        hintText:
                                            'filter_by_number_of_years'.tr,
                                        yearList:
                                            DateTime.now().numberOfYears(),
                                        onChanged: (option) {
                                          numberOfYears = option?.value;
                                        },
                                        onPressed: () {
                                          controller.noOfYears.value =
                                              numberOfYears;
                                          controller.getTotalDonationsAmount();
                                          Get.back();
                                        },
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.h,
                                    vertical: 4.v,
                                  ),
                                  child: CustomImageView(
                                    imagePath: "more".icon.svg,
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                      }),
                      SizedBox(height: 16.v),
                      Obx(() {
                        Rx<UseState> useState =
                            controller.propsCampaignsDistributions.useState;
                        Rx<UseError> error =
                            controller.propsCampaignsDistributions.error;

                        if (useState.value == UseState.none ||
                            useState.value == UseState.processing) {
                          return progress(
                            height: 280.v,
                            child: const CircularProgress(),
                          );
                        } else {
                          if (error.value.message != null) {
                            return progress(
                              height: 280.v,
                              child: TryAgain(
                                message: error.value.message,
                                tryAgain: () async {
                                  return controller.getCampaignsDistributions();
                                },
                              ),
                            );
                          } else {
                            String year = controller.year2.value;
                            CampaignsDistribution distribution =
                                controller.campaignsDistributions.value;

                            return campaignsDistribution(
                              title:
                                  "${'campaigns_distribution'.tr} - ${distribution.currencySymbol}${distribution.total}- $year",
                              distribution: distribution,
                              more: InkWell(
                                onTap: () {
                                  Get.dialog(
                                    AlertDialog(
                                      backgroundColor: Colors.transparent,
                                      contentPadding: EdgeInsets.zero,
                                      insetPadding:
                                          const EdgeInsets.only(left: 0),
                                      content: FilterByYearsDialog(
                                        year: controller.year2.value,
                                        hintText: 'filter_by_year'.tr,
                                        yearList: DateTime.now().yearList(),
                                        onChanged: (option) {
                                          year = option?.value;
                                        },
                                        onPressed: () {
                                          controller.year2.value = year;
                                          controller
                                              .getCampaignsDistributions();
                                          Get.back();
                                        },
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.h,
                                    vertical: 4.v,
                                  ),
                                  child: CustomImageView(
                                    imagePath: "more".icon.svg,
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                      }),
                      SizedBox(height: 16.v),
                      Obx(() {
                        Rx<UseState> useState =
                            controller.propsRecentTransactions.useState;
                        Rx<UseError> error =
                            controller.propsRecentTransactions.error;

                        if (useState.value == UseState.none ||
                            useState.value == UseState.processing) {
                          return progress(
                            height: 400.v,
                            child: const CircularProgress(),
                          );
                        } else {
                          if (error.value.message != null) {
                            return progress(
                              height: 400.v,
                              child: TryAgain(
                                message: error.value.message,
                                tryAgain: () async {
                                  return controller.getRecentTransactions();
                                },
                              ),
                            );
                          } else {
                            String noOfTransactions =
                                controller.noOfTransactions.value;
                            RecentTransactions transactions =
                                controller.recentTransactions.value;

                            return recentTransactions(
                              transactions: transactions,
                              title:
                                  "${'recent_transactions'.tr} - $noOfTransactions",
                              more: InkWell(
                                onTap: () {
                                  Get.dialog(
                                    AlertDialog(
                                      backgroundColor: Colors.transparent,
                                      contentPadding: EdgeInsets.zero,
                                      insetPadding:
                                          const EdgeInsets.only(left: 0),
                                      content: FilterByYearsDialog(
                                        year: noOfTransactions,
                                        yearList: DateTime.now().monthsList(),
                                        hintText: 'number_of_transactions'.tr,
                                        onChanged: (option) {
                                          noOfTransactions = option?.value;
                                        },
                                        onPressed: () {
                                          controller.noOfTransactions.value =
                                              noOfTransactions;
                                          controller.getRecentTransactions();
                                          Get.back();
                                        },
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.h,
                                    vertical: 4.v,
                                  ),
                                  child: CustomImageView(
                                    imagePath: "more".icon.svg,
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
