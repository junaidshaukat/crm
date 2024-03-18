import 'package:flutter/material.dart';
import '/core/app_export.dart';

export './binding/binding.dart';
export './controller/controller.dart';
export './models/model.dart';
export './screens/export.dart';

class CompaignScreen extends StatelessWidget {
  CompaignScreen({super.key});
  final controller = Get.put(CompaignController());
  Widget visibility({
    required bool visible,
    required String label,
    required String control,
    TextEditingController? controller,
    dynamic hintText,
    void Function(dynamic)? onChanged,
    required void Function()? onRemove,
    void Function()? onTap,
  }) {
    Rx<String?> date = Rx(null);
    Rx<bool?> switchs = Rx(hintText == 1 ? true : false);

    return Visibility(
      visible: visible,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4.v),
          Text(
            label,
            style: TextStyle(
              color: appTheme.black900,
              fontSize: 15.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 4.v),
          if (control == 'datetime' || control == 'date')
            Obx(() {
              return Input(
                readOnly: true,
                controller: controller,
                hintText: date.value ?? hintText,
                onChanged: onChanged,
                onTap: () {
                  Pickers.date(Get.context!).then((val) {
                    if (val != null) {
                      date.value = val.formatYYYYMMDD;
                      onChanged!(val.formatYYYYMMDD);
                    }
                  });
                },
                suffixIcon: IconButton(
                  onPressed: onRemove,
                  icon: Icon(
                    Icons.close,
                    color: appTheme.gray400,
                  ),
                ),
              );
            }),
          if (control == 'switch')
            Obx(() {
              onChanged!(switchs.value == true ? 1 : 0);
              return CustomSwitch(
                value: switchs.value,
                alignment: Alignment.bottomLeft,
                onChange: (option) {
                  switchs(option);
                  onChanged(option == true ? 1 : 0);
                },
              );
            }),
          if (control == 'textbox')
            Input(
              controller: controller,
              hintText: hintText,
              onChanged: onChanged,
              suffixIcon: IconButton(
                onPressed: onRemove,
                icon: Icon(
                  Icons.close,
                  color: appTheme.gray400,
                ),
              ),
            )
        ],
      ),
    );
  }

  void onTapFilter() {
    console.log(
      controller.fields.map(
        (element) => console.log(element.control),
      ),
    );
    Get.bottomSheet(
      persistent: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.adaptSize),
          topRight: Radius.circular(20.adaptSize),
        ),
      ),
      Container(
        width: double.maxFinite,
        height: (FIGMA_DESIGN_HEIGHT * 0.9).adaptSize,
        margin: EdgeInsets.only(bottom: 0.v),
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.v),
        decoration: AppDecoration.outlineBluegray100011,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.v),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomImageView(
                    svgColor: Colors.black,
                    imagePath: "back".icon.svg,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    onTap: () {
                      Get.back();
                    },
                  ),
                  const Spacer(flex: 1),
                  Text(
                    "filter_compaign".tr,
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 20.fSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
              SizedBox(height: 11.v),
              Text(
                "select_fields".tr,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 15.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2.v),
              Obx(
                () => SimpleDropDown(
                  overflow: TextOverflow.clip,
                  icon: Padding(
                    padding: EdgeInsets.only(right: 12.adaptSize),
                    child: CustomImageView(
                      imagePath: "dropdown".icon.svg,
                    ),
                  ),
                  hintText: controller.getDropDownHint.isNotEmpty
                      ? controller.getDropDownHint.join(', ')
                      : "select_fields".tr,
                  items: controller.getFields.map((e) {
                    return DropDown(
                      id: e.value,
                      title: e.label.toString(),
                      value: e.value,
                    );
                  }).toList(),
                  onChanged: controller.selectFields,
                ),
              ),
              SizedBox(height: 8.v),
              Obx(
                () => Column(
                  children: controller.fields.map((field) {
                    return visibility(
                      visible: field.selected!.value,
                      label: field.label.toString(),
                      control: field.control!,
                      hintText: field.data,
                      onChanged: (val) {
                        controller.onChangedField(val, field);
                      },
                      onRemove: () {
                        controller.removeField(field);
                      },
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 8.v),
              Text(
                "record_per_page".tr,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 15.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2.v),
              Obx(
                () => SimpleDropDown(
                  icon: Padding(
                    padding: EdgeInsets.only(right: 12.adaptSize),
                    child: CustomImageView(
                      imagePath: "dropdown".icon.svg,
                    ),
                  ),
                  hintText: controller.pageSize.value.toString(),
                  items: pageSizeList.map((e) {
                    return DropDown(
                      id: e,
                      title: e.toString().tr,
                      value: e,
                    );
                  }).toList(),
                  onChanged: (option) {
                    controller.pageSize.value = option?.value;
                  },
                ),
              ),
              SizedBox(height: 8.v),
              Text(
                "sort_by".tr,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 15.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2.v),
              Obx(
                () => SimpleDropDown(
                  icon: Padding(
                    padding: EdgeInsets.only(right: 12.adaptSize),
                    child: CustomImageView(
                      imagePath: "dropdown".icon.svg,
                    ),
                  ),
                  hintText: controller.by.value?.label ?? "sort_by".tr,
                  items: controller.fields.map((field) {
                    return DropDown(
                      id: field.value,
                      title: field.label.toString(),
                      value: field,
                    );
                  }).toList(),
                  onChanged: (option) {
                    controller.by.value = option?.value;
                  },
                ),
              ),
              SizedBox(height: 8.v),
              Text(
                "order_by".tr,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 15.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2.v),
              Obx(
                () => SimpleDropDown(
                  icon: Padding(
                    padding: EdgeInsets.only(right: 12.adaptSize),
                    child: CustomImageView(
                      imagePath: "dropdown".icon.svg,
                    ),
                  ),
                  hintText: controller.order.value.tr,
                  items: [
                    DropDown(
                        id: '1', title: 'ascending'.tr, value: 'Ascending'),
                    DropDown(
                        id: '2', title: 'descending'.tr, value: 'Descending'),
                  ],
                  onChanged: (option) {
                    controller.order.value = option?.value;
                  },
                ),
              ),
              SizedBox(height: 16.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        text: "reset".tr,
                        margin: EdgeInsets.only(right: 4.h),
                        buttonStyle: CustomButtonStyles.fillGray,
                        onPressed: controller.reset,
                      ),
                    ),
                    Expanded(
                      child: CustomElevatedButton(
                        text: "filter".tr,
                        margin: EdgeInsets.only(left: 4.h),
                        onPressed: controller.onPressedFilter,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressedDelete(num? tagNumber) {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.only(bottom: 0.v),
        content: Container(
          decoration: AppDecoration.fillPrimary.copyWith(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.adaptSize),
              topRight: Radius.circular(8.adaptSize),
            ),
          ),
          width: 260.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(6.h),
                decoration: AppDecoration.fillPrimary.copyWith(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.adaptSize),
                    topRight: Radius.circular(8.adaptSize),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "delete_campaign".tr,
                      style: TextStyle(
                        color: appTheme.whiteA700,
                        fontSize: 12.fSize,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    CustomImageView(
                      imagePath: "close".icon.svg,
                      svgColor: appTheme.whiteA700,
                      onTap: () {
                        if (controller.props.useState.value !=
                            UseState.deleting) {
                          Get.back();
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.v),
              Obx(() {
                if (controller.props.useState.value == UseState.deleting) {
                  return Padding(
                    padding: EdgeInsets.all(16.adaptSize),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomProgressButton(
                            lable: 'deleting'.tr,
                            indicatorColor: theme.primaryColor,
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Text(
                          "are_you_sure_delete_campaign".tr,
                          style: TextStyle(
                            color: appTheme.redA700,
                            fontSize: 12.fSize,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 7.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Text(
                          "you_cannot_undo".tr,
                          style: TextStyle(
                            color: appTheme.redA700,
                            fontSize: 12.fSize,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.v),
                    ],
                  );
                }
              }),
              Padding(
                padding: EdgeInsets.only(right: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomElevatedButton(
                      height: 32.v,
                      width: 80.h,
                      text: "cancel".tr,
                      buttonStyle: CustomButtonStyles.fillGray,
                      onPressed: () {
                        if (controller.props.useState.value !=
                            UseState.deleting) {
                          Get.back();
                        }
                      },
                    ),
                    SizedBox(width: 8.v),
                    CustomElevatedButton(
                      height: 32.v,
                      width: 100.h,
                      text: "delete".tr,
                      buttonStyle: CustomButtonStyles.fillRedA,
                      onPressed: () async {
                        await controller.onDeleteCompaign(tagNumber);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.v),
            ],
          ),
        ),
      ),
    );
  }

  void onPressedCreate() {
    Get.to(
      () => CreateCampaignScreen(
        (event) {
          if (event == "update") {
            controller.reset();
            controller.reloadData();
          }
        },
      ),
    );
  }

  void onPressedEdit(CampaignData campaign) {
    Get.to(
      () => UpdateCampaignScreen(
        campaign,
        (event) {
          if (event == "update") {
            // controller.reset();
            controller.reloadData();
          }
        },
      ),
    );
  }

  String formateDate(val) {
    if (val != null) {
      DateTime dateTime = DateTime.parse(val);
      String formattedDate = "${dateTime.toLocal()}".split(" ")[0];
      return formattedDate;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 36.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: AppbarWithBackAndFilter(
              back: false,
              title: "campaign".tr,
              onTapFilter: onTapFilter,
            ),
          ),
          SizedBox(height: 16.v),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 8.h),
              decoration: AppDecoration.outlinePrimary.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL28,
              ),
              child: Column(
                children: [
                  SizedBox(height: 14.v),
                  const CustomDivider(),
                  SizedBox(height: 19.v),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: onPressedCreate,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              imagePath: "plus_circle".icon.svg,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 7.h,
                                top: 2.v,
                                bottom: 3.v,
                              ),
                              child: Text(
                                "add_campaign".tr,
                                style: TextStyle(
                                  color: theme.colorScheme.primary,
                                  fontSize: 12.fSize,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 70.adaptSize,
                        height: 30.adaptSize,
                        child: Obx(
                          () => SimpleDropDown(
                            containerPadding: EdgeInsets.zero,
                            dropdownButtonPadding: EdgeInsets.zero,
                            hintPadding: EdgeInsets.only(left: 10.adaptSize),
                            circularRadius: 33,
                            hintText: controller.pageSize.value.toString(),
                            items: pageSizeList
                                .map((page) => DropDown(
                                      id: page,
                                      value: page,
                                      title: page.toString(),
                                    ))
                                .toList(),
                            onChanged: controller.onChangedPageSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 19.v),
                  Expanded(
                    child: Obx(
                      () {
                        Rx<UseState> useState = controller.props.useState;
                        Rx<UseError> error = controller.props.error;

                        if (useState.value == UseState.loading) {
                          return const CircularProgress();
                        } else {
                          if (error.value.message != null) {
                            return Center(
                              child: RefreshIndicator.adaptive(
                                strokeWidth: 2.adaptSize,
                                onRefresh: () async {},
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text("Error Message"),
                                    GestureDetector(
                                      onTap: controller.tryAgain,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.refresh,
                                              color: appTheme.red900),
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
                                    )
                                  ],
                                ),
                              ),
                            );
                          } else {
                            if (controller.compaigns.isEmpty) {
                              return const Center(
                                child: Text('No Record Found.'),
                              );
                            }
                            return ListView.separated(
                              itemCount: controller.compaigns.length,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                CampaignData compaign =
                                    controller.compaigns[index];
                                return CustomCard(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${compaign.name}",
                                              style: TextStyle(
                                                color:
                                                    theme.colorScheme.onPrimary,
                                                fontSize: 16.fSize,
                                                fontFamily: 'Nunito Sans',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          CustomElevatedButton(
                                            height: 28.v,
                                            width: 80.h,
                                            text: compaign.donationCampaign ==
                                                    true
                                                ? "Donation".tr
                                                : "Payment".tr,
                                            buttonStyle:
                                                compaign.donationCampaign ==
                                                        true
                                                    ? CustomButtonStyles
                                                        .fillPrimaryTL4
                                                    : CustomButtonStyles
                                                        .fillOrangeTL4,
                                          ),
                                          SizedBox(width: 4.h),
                                          CustomElevatedButton(
                                            height: 28.v,
                                            width: 80.h,
                                            text: compaign.status == true
                                                ? "active".tr
                                                : "inactive".tr,
                                            buttonStyle: compaign.status == true
                                                ? CustomButtonStyles
                                                    .fillPrimaryTL4
                                                : CustomButtonStyles
                                                    .fillOrangeTL4,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 12.v),
                                      Divider(
                                        color:
                                            appTheme.gray600.withOpacity(0.4),
                                      ),
                                      SizedBox(height: 4.v),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${compaign.description}",
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                color: appTheme.gray600,
                                                fontSize: 10.adaptSize,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          CustomImageView(
                                            imagePath: compaign.icon?.filename,
                                            height: 30.v,
                                            width: 30.h,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 7.v),
                                      DataTables(
                                        startDate: compaign.startDate,
                                        endDate: compaign.endDate,
                                        currencySymbol: compaign.currencySymbol,
                                        minimumAmount: compaign.minimumAmount,
                                        issueTaxReceipt:
                                            compaign.issueTaxReceipt,
                                        sortOrder: compaign.sortOrder,
                                      ),
                                      SizedBox(height: 6.v),
                                      buildTargetAmount(
                                        targetAmount: "target_amount".tr,
                                        zero:
                                            "${compaign.currencySymbol}${compaign.targetAmount?.toStringAsFixed(2)}",
                                        amount: "amount".tr,
                                        price:
                                            "${compaign.currencySymbol}${compaign.raisedAmount?.toStringAsFixed(2)}",
                                        collection: "collection".tr,
                                        fifty:
                                            "${compaign.targetAmount?.percentage(compaign.raisedAmount)}",
                                      ),
                                      SizedBox(height: 6.v),
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(100)),
                                        child: LinearProgressIndicator(
                                          value:
                                              '${compaign.targetAmount?.percentage(compaign.raisedAmount)}'
                                                      .toNum *
                                                  0.01,
                                          minHeight: 4.v,
                                          backgroundColor: appTheme.gray100,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            appTheme.primary,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 7.v),
                                      Divider(
                                        color:
                                            appTheme.gray600.withOpacity(0.4),
                                      ),
                                      SizedBox(height: 7.v),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          DownloadQrCode(
                                            controller: controller,
                                            qrCode: compaign.qrCode,
                                            name: compaign.name,
                                          ),
                                          const Spacer(),
                                          CustomElevatedButton(
                                            height: 30.v,
                                            width: 65.h,
                                            text: "edit".tr,
                                            buttonStyle: CustomButtonStyles
                                                .fillPrimaryTL4,
                                            onPressed: () =>
                                                onPressedEdit(compaign),
                                          ),
                                          CustomElevatedButton(
                                            height: 30.v,
                                            width: 65.h,
                                            text: "delete".tr,
                                            margin: EdgeInsets.only(left: 9.h),
                                            buttonStyle:
                                                CustomButtonStyles.fillRed,
                                            onPressed: () async {
                                              onPressedDelete(
                                                  compaign.tagNumber);
                                            },
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 16.v);
                              },
                            );
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 16.v),
                  Obx(() {
                    return WebPagination(
                      displayItemCount: 3,
                      currentPage: controller.page.value,
                      totalPage: controller.totalPage.value,
                      onPageChanged: controller.onPageChanged,
                    );
                  }),
                  SizedBox(height: 18.v),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataColumn dataColumn({required String label}) {
    return DataColumn(
      label: Text(
        label,
        style: TextStyle(
          color: appTheme.gray600,
          fontSize: 11.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  DataCell dataCell({required String label}) {
    return DataCell(
      Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: appTheme.gray80001,
            fontSize: 10.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget buildTargetAmount({
    required String targetAmount,
    required String zero,
    required String amount,
    required String price,
    required String collection,
    required String fifty,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 4.h),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              targetAmount,
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontSize: 10.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 1.v),
            Text(
              zero,
              style: TextStyle(
                color: appTheme.gray80001,
                fontSize: 10.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        SizedBox(
          height: 40.v,
          child: VerticalDivider(
            width: 1.h,
            thickness: 1.v,
            color: appTheme.gray600,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              amount,
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontSize: 10.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 2.v),
            Text(
              price,
              style: TextStyle(
                color: appTheme.gray80001,
                fontSize: 10.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 41.v,
          child: VerticalDivider(
            width: 1.h,
            thickness: 1.v,
            color: appTheme.gray600,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              collection,
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontSize: 10.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 3.v),
            Text(
              fifty,
              style: TextStyle(
                color: appTheme.gray80001,
                fontSize: 10.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        SizedBox(width: 4.h),
      ],
    );
  }
}

class DownloadQrCode extends StatelessWidget {
  final String? qrCode;
  final String? name;
  final CompaignController? controller;

  const DownloadQrCode({
    super.key,
    this.qrCode,
    this.name,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    Rx<bool> downloading = Rx(false);

    return Obx(() {
      if (downloading.isFalse) {
        return CustomElevatedButton(
          height: 30.v,
          width: 100.h,
          text: "qr_code".tr,
          isDisabled: controller!.env.gatewayNodeTag > 0 ? false : true,
          leftIcon: Container(
            margin: EdgeInsets.only(right: 6.h),
            child: CustomImageView(
              imagePath: "download".icon.svg,
            ),
          ),
          buttonStyle: CustomButtonStyles.fillGrayTL4,
          onPressed: () async {
            downloading(true);
            await controller?.qrCode(qrCode, name);
            downloading(false);
          },
        );
      } else {
        return CustomElevatedButton(
          height: 30.v,
          width: 100.h,
          text: "".tr,
          isDisabled: qrCode != null ? false : true,
          leftIcon: Container(
            padding: EdgeInsets.all(6.adaptSize),
            child: Center(
              child: CircularProgress(
                width: 12,
                height: 12,
                colorAnimation: appTheme.whiteA700,
              ),
            ),
          ),
          buttonStyle: CustomButtonStyles.fillGrayTL4,
          onPressed: () async {},
        );
      }
    });
  }
}

class DataTables extends StatelessWidget {
  final String? startDate;
  final String? endDate;
  final String? currencySymbol;
  final num? minimumAmount;
  final bool? issueTaxReceipt;
  final num? sortOrder;

  const DataTables({
    super.key,
    this.startDate,
    this.endDate,
    this.currencySymbol,
    this.minimumAmount,
    this.issueTaxReceipt,
    this.sortOrder,
  });

  DataColumn dataColumn({required String label}) {
    return DataColumn(
      label: Text(
        label,
        style: TextStyle(
          color: appTheme.gray600,
          fontSize: 11.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  DataCell dataCell({required String label}) {
    return DataCell(
      Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: appTheme.gray80001,
            fontSize: 10.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  String formateDate(val) {
    if (val != null) {
      DateTime dateTime = DateTime.parse(val);
      String formattedDate = "${dateTime.toLocal()}".split(" ")[0];
      return formattedDate;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();

    return SizedBox(
      height: 60.v,
      child: RawScrollbar(
        controller: controller,
        thickness: 4.adaptSize,
        radius: Radius.circular(100.adaptSize),
        thumbVisibility: true,
        trackVisibility: true,
        thumbColor: theme.colorScheme.primary,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          child: DataTable(
            sortAscending: true,
            sortColumnIndex: 0,
            headingRowHeight: 14.v,
            horizontalMargin: 0.h,
            columnSpacing: 8.h,
            columns: <DataColumn>[
              dataColumn(
                label: "start_date".tr,
              ),
              dataColumn(
                label: "end_date".tr,
              ),
              dataColumn(
                label: "minimum_amount".tr,
              ),
              dataColumn(
                label: "tax_deductible".tr,
              ),
              dataColumn(
                label: "sort_order".tr,
              ),
            ],
            rows: [
              DataRow(
                cells: <DataCell>[
                  dataCell(label: formateDate(startDate)),
                  dataCell(label: formateDate(endDate)),
                  dataCell(label: "$currencySymbol$minimumAmount"),
                  dataCell(label: issueTaxReceipt == true ? "yes".tr : "no".tr),
                  dataCell(label: "$sortOrder"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
