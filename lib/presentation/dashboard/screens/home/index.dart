import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'binding/binding.dart';
export 'controller/controller.dart';
export 'models/model.dart';
export 'screens/export.dart';
export 'widgets/export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomImageView(
          imagePath: "logo@2".icon.svg,
          height: 60.v,
          width: 144.h,
        ),
        SizedBox(height: 12.v),
        Obx(() {
          Props props = controller.propsOrganizations;
          List<Organizations> organizations = controller.organizations.value;
          if (props.useState.value == UseState.none ||
              props.useState.value == UseState.loading) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: SimpleDropDown(
                icon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.h),
                  child: CustomImageView(
                    imagePath: "arrow_down".icon.svg,
                  ),
                ),
                hintText: 'Organizations',
                items: [
                  DropDown(
                    id: 'title',
                    title: 'title',
                    value: 'title',
                  ),
                ],
                onSelect: (value) {},
                onChanged: (option) {},
              ),
            );
          } else {
            if (props.error.value.message != null) {
              return ItemCard(
                error: props.error.value.message,
                onRefresh: () async {},
              );
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: SimpleDropDown(
                  icon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.h),
                    child: CustomImageView(
                      imagePath: "arrow_down".icon.svg,
                    ),
                  ),
                  hintText: controller.getOrganization.name?.organizationTitle(
                          controller.getOrganization.location) ??
                      'Select an organization',
                  items: organizations.map((organization) {
                    return DropDown(
                      id: organization.tagNumber,
                      title: organization.name
                          ?.organizationTitle(organization.location),
                      value: organization,
                    );
                  }).toList(),
                  onChanged: controller.setOrganization,
                ),
              );
            }
          }
        }),
        SizedBox(height: 12.v),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 8.h,
            vertical: 8.v,
          ),
          decoration: AppDecoration.fillWhiteA.copyWith(
            borderRadius: BorderRadiusStyle.customBorderTL28,
          ),
          child: Column(
            children: [
              SizedBox(height: 16.v),
              const CustomDivider(),
              SizedBox(height: 16.v),
              RefreshIndicator(
                edgeOffset: 12.v,
                displacement: 100.v,
                onRefresh: controller.onRefresh,
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                notificationPredicate: (notification) {
                  BuildContext context = notification.context!;
                  console.log(context);

                  return true;
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.h),
                    child: Wrap(
                      spacing: 16.h,
                      runSpacing: 8.h,
                      children: [
                        Obx(() {
                          Props props = controller.propsDonorsAndFollowers;
                          DonorsAndFollowers donorsAndFollowers =
                              controller.donorsAndFollowers.value;
                          if (props.useState.value == UseState.loading) {
                            return const ItemCard(
                              processing: true,
                            );
                          } else {
                            if (props.error.value.message != null) {
                              return ItemCard(
                                error: props.error.value.message,
                                onRefresh: () async {},
                              );
                            } else {
                              return ItemCard(
                                title: "registered_donors".tr,
                                imagePath: "registered_donors".icon.svg,
                                content: donorsAndFollowers.donors.toString(),
                              );
                            }
                          }
                        }),
                        Obx(() {
                          Props props = controller.propsDonorsAndFollowers;
                          DonorsAndFollowers donorsAndFollowers =
                              controller.donorsAndFollowers.value;
                          if (props.useState.value == UseState.loading) {
                            return const ItemCard(
                              processing: true,
                            );
                          } else {
                            if (props.error.value.message != null) {
                              return ItemCard(
                                error: props.error.value.message,
                                onRefresh: () async {},
                              );
                            } else {
                              return ItemCard(
                                title: "followers".tr,
                                imagePath: "followers".icon.svg,
                                content:
                                    donorsAndFollowers.followers.toString(),
                              );
                            }
                          }
                        }),
                        Obx(() {
                          Props props = controller.propsTotalTransactions;
                          TotalTransactions totalTransactions =
                              controller.totalTransactions.value;
                          if (props.useState.value == UseState.loading) {
                            return const ItemCard(
                              processing: true,
                            );
                          } else {
                            if (props.error.value.message != null) {
                              return ItemCard(
                                error: props.error.value.message,
                                onRefresh: () async {},
                              );
                            } else {
                              return ItemCard(
                                title: "total_transactions".tr,
                                imagePath: "total_transactions".icon.svg,
                                content: totalTransactions.total.toString(),
                              );
                            }
                          }
                        }),
                        Obx(() {
                          Props props = controller.propsThisYearTransactions;
                          ThisYearTransactions thisYearTransactions =
                              controller.thisYearTransactions.value;
                          if (props.useState.value == UseState.loading) {
                            return const ItemCard(
                              processing: true,
                            );
                          } else {
                            if (props.error.value.message != null) {
                              return ItemCard(
                                error: props.error.value.message,
                                onRefresh: () async {},
                              );
                            } else {
                              return ItemCard(
                                title: "this_year_transaction".tr,
                                imagePath: "this_year_transaction".icon.svg,
                                content: thisYearTransactions.total.toString(),
                              );
                            }
                          }
                        }),
                        Obx(() {
                          Props props = controller.propsDonationSince;
                          DonationSince donationSince =
                              controller.donationSince.value;
                          if (props.useState.value == UseState.loading) {
                            return const ItemCard(
                              processing: true,
                            );
                          } else {
                            if (props.error.value.message != null) {
                              return ItemCard(
                                error: props.error.value.message,
                                onRefresh: () async {},
                              );
                            } else {
                              return ItemCard(
                                title: "donation_since".tr,
                                imagePath: "donation_since".icon.svg,
                                subtitle: donationSince.signupDate,
                                content:
                                    '${donationSince.currencySymbol}${donationSince.donation}',
                              );
                            }
                          }
                        }),
                        Obx(() {
                          Props props = controller.propsDonationYear;
                          DonationYear donationYear =
                              controller.donationYear.value;
                          if (props.useState.value == UseState.loading) {
                            return const ItemCard(
                              processing: true,
                            );
                          } else {
                            if (props.error.value.message != null) {
                              return ItemCard(
                                error: props.error.value.message,
                                onRefresh: controller.setDonationYear,
                              );
                            } else {
                              return ItemCard(
                                title: "donation".tr,
                                imagePath: "donation".icon.svg,
                                subtitle: donationYear.year,
                                content:
                                    '${donationYear.currencySymbol}${donationYear.donation}',
                                more: InkWell(
                                  onTap: () {
                                    controller.year(donationYear.year);
                                    Get.dialog(
                                      AlertDialog(
                                        backgroundColor: Colors.transparent,
                                        contentPadding: EdgeInsets.zero,
                                        insetPadding:
                                            const EdgeInsets.only(left: 0),
                                        content: Obx(
                                          () => FilterByYearsDialog(
                                            year: controller.year.value,
                                            yearList: DateTime.now().yearList(),
                                            onChanged: (option) {
                                              controller.year.value =
                                                  option?.value;
                                            },
                                            onPressed:
                                                controller.setDonationYear,
                                          ),
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
                        Obx(() {
                          Props props = controller.propsDonationDay;
                          DonationDay donationDay =
                              controller.donationDay.value;
                          if (props.useState.value == UseState.loading) {
                            return const ItemCard(
                              processing: true,
                            );
                          } else {
                            if (props.error.value.message != null) {
                              return ItemCard(
                                error: props.error.value.message,
                                onRefresh: controller.setDonationDay,
                              );
                            } else {
                              return ItemCard(
                                title: "day_donation".tr,
                                imagePath: "day_donation".icon.svg,
                                content:
                                    '${donationDay.currencySymbol}${donationDay.total!.toStringAsFixed(2)}',
                                more: InkWell(
                                  onTap: () {
                                    controller.date(
                                      DateTime.tryParse(donationDay.date!),
                                    );
                                    Get.dialog(
                                      AlertDialog(
                                        backgroundColor: Colors.transparent,
                                        contentPadding: EdgeInsets.zero,
                                        insetPadding:
                                            const EdgeInsets.only(left: 0),
                                        content: FilterByDayDialog(
                                          date: controller.date,
                                          onChanged: () {
                                            Pickers.date(Get.context!)
                                                .then((date) {
                                              if (date != null) {
                                                controller.date(
                                                  date,
                                                );
                                              }
                                            });
                                          },
                                          onPressed: controller.setDonationDay,
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
                        Obx(() {
                          Props props = controller.propsDonationMonth;
                          DonationMonth donationMonth =
                              controller.donationMonth.value;
                          if (props.useState.value == UseState.loading) {
                            return const ItemCard(
                              processing: true,
                            );
                          } else {
                            if (props.error.value.message != null) {
                              return ItemCard(
                                error: props.error.value.message,
                                onRefresh: controller.setDonationMonth,
                              );
                            } else {
                              return ItemCard(
                                title: "month_donation".tr,
                                imagePath: "month_donation".icon.svg,
                                content:
                                    '${donationMonth.currencySymbol}${donationMonth.total!.toStringAsFixed(2)}',
                                more: InkWell(
                                  onTap: () {
                                    controller.year(donationMonth.year);
                                    controller.month(donationMonth.month);
                                    Get.dialog(
                                      AlertDialog(
                                        backgroundColor: Colors.transparent,
                                        contentPadding: EdgeInsets.zero,
                                        insetPadding:
                                            const EdgeInsets.only(left: 0),
                                        content: Obx(
                                          () => FilterByRangeDialog(
                                            year: controller.year.value,
                                            month: controller
                                                .month.value.monthName,
                                            yearList: DateTime.now().yearList(),
                                            monthList:
                                                DateTime.now().monthList(),
                                            onChangeYear: (option) {
                                              if (option.value != null) {
                                                controller.year(option.value);
                                              }
                                            },
                                            onChangeMonth: (option) {
                                              if (option.value != null) {
                                                controller.month(option.value
                                                    .toString()
                                                    .monthNumber);
                                              }
                                            },
                                            onPressed:
                                                controller.setDonationMonth,
                                          ),
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
              SizedBox(height: 16.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      text: "campaigns".tr,
                      margin: EdgeInsets.only(right: 5.h),
                      onPressed: () {
                        Get.toNamed(AppRoutes.homeCompaigns);
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomOutlinedButton(
                      text: "recuring_details".tr,
                      margin: EdgeInsets.only(left: 5.h),
                      onPressed: () {
                        Get.toNamed(AppRoutes.homeRecurring);
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 30.v),
            ],
          ),
        ),
      ],
    );
  }
}
