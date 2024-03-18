import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'binding/binding.dart';
export 'controller/controller.dart';
export 'models/model.dart';
export 'screens/export.dart';
export 'widgets/export.dart';

class DonorsScreen extends StatelessWidget {
  final DonorsController controller = Get.put(DonorsController());
  DonorsScreen({super.key});

  Widget visibility({
    required bool visible,
    required String label,
    required String control,
    TextEditingController? controller,
    String? hintText,
    void Function(String)? onChanged,
    required void Function()? onRemove,
    void Function()? onTap,
  }) {
    Rx<String?> date = Rx(null);

    return Visibility(
      visible: visible,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: appTheme.black900,
              fontSize: 15.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 2.v),
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
          if (control != 'date')
            Input(
              readOnly: control == 'date' ? true : false,
              controller: controller,
              hintText: control == 'date' ? date.value : hintText,
              onChanged: onChanged,
              onTap: control == 'date' ? onTap : null,
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
                    "filter_donors".tr,
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

  void onPressedAdd() {
    Get.to(() => CreateDonorScreen(
          (event) {
            if (event == "update") {
              controller.reloadData();
            }
          },
        ));
  }

  void onPressedEdit(DonorData donor) {
    Get.to(() => UpdateDonorScreen(
          donor,
          (event) {
            if (event == "update") {
              controller.reloadData();
            }
          },
        ));
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
                      "delete_donor".tr,
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
                          "are_you_sure_delete_donor".tr,
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
                        await controller.deleteDonor(tagNumber);
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

  Widget listTile({required String label, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 36.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: AppbarWithBackAndFilter(
              back: false,
              title: "donors".tr,
              onTapFilter: onTapFilter,
            ),
          ),
          SizedBox(height: 16.v),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              decoration: AppDecoration.outlinePrimary.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL28,
              ),
              child: Column(
                children: [
                  SizedBox(height: 12.v),
                  const CustomDivider(),
                  SizedBox(height: 12.v),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: "plus_circle".icon.svg,
                      ),
                      InkWell(
                        onTap: onPressedAdd,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 7.h,
                            top: 2.v,
                            bottom: 3.v,
                          ),
                          child: Text(
                            "add_donors".tr,
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontSize: 12.fSize,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 60.h,
                        height: 30.v,
                        child: Obx(
                          () => SimpleDropDown(
                            containerPadding: EdgeInsets.zero,
                            dropdownButtonPadding: EdgeInsets.zero,
                            hintPadding: EdgeInsets.only(left: 10.h),
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

                        if (useState.value == UseState.none ||
                            useState.value == UseState.loading) {
                          return const CircularProgress();
                        } else {
                          if (error.value.message != null) {
                            return TryAgain(
                              message: error.value.message,
                              tryAgain: controller.tryAgain,
                            );
                          } else {
                            List<DonorData> donors = controller.donors;
                            if (donors.isEmpty) {
                              return const Center(
                                child: Text('No Recod Found'),
                              );
                            }

                            return ListView.separated(
                              itemCount: donors.length,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                DonorData donor = donors[index];
                                return CustomCard(
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 44.adaptSize,
                                            height: 44.adaptSize,
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 3.h,
                                              vertical: 1.v,
                                            ),
                                            decoration: AppDecoration
                                                .fillPrimary
                                                .copyWith(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Text(
                                              "${donor.firstName.toString().avatar}${donor.lastName.toString().avatar}",
                                              style: TextStyle(
                                                color: appTheme.whiteA700,
                                                fontSize: 16.fSize,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 6.h,
                                              top: 4.v,
                                              bottom: 5.v,
                                            ),
                                            child: Text(
                                              "${donor.firstName} ${donor.lastName}",
                                              style: TextStyle(
                                                color:
                                                    theme.colorScheme.onPrimary,
                                                fontSize: 14.fSize,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
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
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4.v),
                                        decoration:
                                            AppDecoration.fillLightGreen,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            listTile(
                                              label: "phone".tr,
                                              value: "${donor.phone}",
                                            ),
                                            SizedBox(height: 4.v),
                                            Divider(
                                              color: appTheme.gray600
                                                  .withOpacity(0.4),
                                              indent: 0.h,
                                            ),
                                            SizedBox(height: 3.v),
                                            listTile(
                                              label: "created".tr,
                                              value:
                                                  "${donor.createDateTime?.dateTime}",
                                            ),
                                            SizedBox(height: 4.v),
                                            Divider(
                                              color: appTheme.gray600
                                                  .withOpacity(0.4),
                                              indent: 0.h,
                                            ),
                                            SizedBox(height: 3.v),
                                            listTile(
                                              label: "updated".tr,
                                              value:
                                                  "${donor.updateDateTime?.dateTime}",
                                            ),
                                            SizedBox(height: 4.v),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 12.v),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CustomElevatedButton(
                                            height: 29.v,
                                            width: 65.h,
                                            text: "edit".tr,
                                            buttonStyle: CustomButtonStyles
                                                .fillPrimaryTL4,
                                            onPressed: () {
                                              onPressedEdit(donor);
                                            },
                                          ),
                                          SizedBox(width: 3.v),
                                          CustomElevatedButton(
                                            height: 29.v,
                                            width: 65.h,
                                            text: "delete".tr,
                                            buttonStyle:
                                                CustomButtonStyles.fillRed,
                                            onPressed: () {
                                              onPressedDelete(
                                                donor.tagNumber,
                                              );
                                            },
                                          ),
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
                  SizedBox(height: 8.v),
                  Obx(() {
                    return WebPagination(
                      displayItemCount: 3,
                      currentPage: controller.page.value,
                      totalPage: controller.totalPage.value,
                      onPageChanged: controller.onPageChanged,
                    );
                  }),
                  SizedBox(height: 30.v),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
