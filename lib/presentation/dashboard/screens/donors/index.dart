import 'dart:io';

import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'screens/export.dart';
export 'controller/controller.dart';

class DonorsScreen extends StatelessWidget {
  final DonorsController controller = Get.put(DonorsController());
  final Google google = Get.put(Google());

  DonorsScreen({super.key});

  Widget visibility({
    required bool visible,
    required String label,
    required String control,
    TextEditingController? controller,
    String? hintText,
    void Function(String)? onChanged,
    void Function(dynamic)? onSelect,
    required void Function()? onRemove,
    void Function()? onTap,
    dynamic value,
    dynamic checkboxList,
    required DonorsController conn,
  }) {
    List list = [];

    Rx<bool?> switchs = Rx(hintText == '1' ? true : false);
    Rx<String?> datetime = Rx(null);

    if (checkboxList != null) list = checkboxList as List;

    return Visibility(
      visible: visible,
      child: SizedBox(
        width: fdw.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (control == 'textbox' ||
                control == "datetime" ||
                control == "date" ||
                control == "switch")
              Text(
                label,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 15.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            if (control == 'checkboxList')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  IconButton(
                    onPressed: () {
                      conn.query.remove(value);
                      onRemove!();
                    },
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
            if (control == 'datetime' || control == 'date')
              Obx(() {
                return Input(
                  readOnly: true,
                  controller: controller,
                  hintText: datetime.value ?? hintText,
                  onChanged: onChanged,
                  onTap: () async {
                    DateTime? date = await pickers.date(Get.context!);
                    TimeOfDay? time = await pickers.time(Get.context!);
                    if (date != null && time == null) {
                      datetime.value = '${date.format('yyyy-MM-dd')} 00:00:00';
                      onChanged!(datetime.value!);
                    }
                    if (date != null && time != null) {
                      datetime.value =
                          '${date.format('yyyy-MM-dd')} ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';
                      onChanged!(datetime.value!);
                    }
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
            if (control == 'checkboxList')
              Wrap(
                children: list.map(
                  (e) {
                    RxBool check = false.obs;
                    if (conn.query.containsKey(value)) {
                      List temp = conn.query[value] as List;
                      if (temp.contains(e['value'])) {
                        check.value = true;
                      }
                    }
                    return GestureDetector(
                      onTap: () {
                        check.value = check.toggle().value;
                        onSelect!({
                          'key': value,
                          'label': e['label'],
                          'value': e['value'],
                          'checked': check.value
                        });
                      },
                      child: SizedBox(
                        width: 170.h,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () {
                                return Checkbox(
                                  value: check.value,
                                  side: BorderSide(
                                    color: appTheme.primary,
                                    width: 1.8,
                                  ),
                                  onChanged: (checked) {
                                    check.value = checked!;
                                    onSelect!({
                                      'key': value,
                                      'label': e['label'],
                                      'value': e['value'],
                                      'checked': checked
                                    });
                                  },
                                );
                              },
                            ),
                            Expanded(child: Text(e['label']))
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            if (control == 'textbox')
              Input(
                controller: controller,
                hintText: hintText,
                onChanged: onChanged,
                borderColor: appTheme.gray400,
                suffixIcon: IconButton(
                  onPressed: onRemove,
                  icon: Icon(
                    Icons.close,
                    color: appTheme.gray400,
                  ),
                ),
              ),
            if (control == 'switch')
              Obx(() {
                onChanged!(switchs.value == true ? '1' : '0');
                return CustomSwitch(
                  value: switchs.value,
                  alignment: Alignment.bottomLeft,
                  onChange: (option) {
                    switchs(option);
                  },
                );
              }),
            SizedBox(height: 4.v)
          ],
        ),
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
        height: (fdh * 0.9).adaptSize,
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
              Obx(() {
                int selectedIndex = controller.selectedIndex.value;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.selectedIndex.value = 1;
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.adaptSize),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: selectedIndex == 1
                                    ? appTheme.primary
                                    : Colors.transparent,
                                width: 1.5,
                              ),
                            ),
                          ),
                          child: Text(
                            'by_fields'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.fSize,
                              color: selectedIndex == 1
                                  ? appTheme.primary
                                  : appTheme.gray90001,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.h),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.selectedIndex.value = 2;
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.adaptSize),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: selectedIndex == 2
                                    ? appTheme.primary
                                    : Colors.transparent,
                                width: 1.5,
                              ),
                            ),
                          ),
                          child: Text(
                            'by_nearest'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.fSize,
                              color: selectedIndex == 2
                                  ? appTheme.primary
                                  : appTheme.gray90001,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
              Obx(() {
                int selectedIndex = controller.selectedIndex.value;
                if (selectedIndex == 1) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        () => SimpleDropDown2(
                          width: 352.h,
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
                          onSelected: controller.selectFields,
                        ),
                      ),
                      SizedBox(height: 8.v),
                      Obx(
                        () => Column(
                          children: controller.fields.map((field) {
                            return visibility(
                              conn: controller,
                              checkboxList:
                                  controller.routeValues.value[field.value],
                              visible: field.selected!.value,
                              label: field.label.toString(),
                              control: field.control!,
                              hintText: field.data,
                              value: field.value,
                              onSelect: (option) {
                                if (controller.query
                                    .containsKey(option['key'])) {
                                  if (option['checked'] == true) {
                                    if (controller.query[option['key']]!
                                            .contains(option['value']) ==
                                        false) {
                                      controller.query[option['key']]
                                          ?.add(option['value']);
                                    }
                                  }
                                  if (option['checked'] == false) {
                                    if (controller.query[option['key']]!
                                        .contains(option['value'])) {
                                      controller.query[option['key']]
                                          ?.remove(option['value']);
                                    }
                                  }
                                } else {
                                  controller.query[option['key']] = [
                                    option['value']
                                  ];
                                }
                              },
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
                      SimpleDropDown(
                        width: 352.h,
                        hintText: controller.pageSize.value.toString(),
                        items: pageSizeList.map((e) {
                          return DropDown(
                            id: e,
                            title: e.toString().tr,
                            value: e,
                          );
                        }).toList(),
                        onSelected: (option) {
                          controller.pageSize.value = option?.value;
                        },
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
                      SimpleDropDown(
                        width: 352.h,
                        hintText: controller.by.value?.label ?? "sort_by".tr,
                        items: controller.fields.map((field) {
                          return DropDown(
                            id: field.value,
                            title: field.label.toString(),
                            value: field,
                          );
                        }).toList(),
                        onSelected: (option) {
                          controller.by.value = option?.value;
                        },
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
                      SimpleDropDown(
                        width: 352.h,
                        hintText: controller.order.value.tr,
                        items: [
                          DropDown(
                              id: '1',
                              title: 'ascending'.tr,
                              value: 'Ascending'),
                          DropDown(
                              id: '2',
                              title: 'descending'.tr,
                              value: 'Descending'),
                        ],
                        onSelected: (option) {
                          controller.order.value = option?.value;
                        },
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
                                onPressed: () {
                                  controller.reset(byFields: true);
                                },
                              ),
                            ),
                            Expanded(
                              child: CustomElevatedButton(
                                text: "filter".tr,
                                margin: EdgeInsets.only(left: 4.h),
                                onPressed: () {
                                  controller.onPressedFilter(byFields: true);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 11.v),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "postal_zip_code".tr,
                                  style: TextStyle(
                                    color: appTheme.black900,
                                    fontSize: 15.fSize,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 2.v),
                                InputForm(
                                  hintText: "postal_zip_code".tr,
                                  controller:
                                      controller.postalZipCodeController,
                                  onChanged: (val) {
                                    controller.postalZipCode.value = val;
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8.v),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "radius".tr,
                                  style: TextStyle(
                                    color: appTheme.black900,
                                    fontSize: 15.fSize,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 2.v),
                                InputForm(
                                  hintText: "radius".tr,
                                  controller: controller.radiusController,
                                  onChanged: (val) {
                                    if (val.isNotEmpty) {
                                      controller.radius.value =
                                          double.parse(val);
                                    }
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 8.v),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "latitude".tr,
                                  style: TextStyle(
                                    color: appTheme.black900,
                                    fontSize: 15.fSize,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 2.v),
                                InputForm(
                                  readOnly: true,
                                  hintText: "latitude".tr,
                                  controller: controller.latitudeController,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8.v),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "longitude".tr,
                                  style: TextStyle(
                                    color: appTheme.black900,
                                    fontSize: 15.fSize,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 2.v),
                                InputForm(
                                  readOnly: true,
                                  hintText: "longitude".tr,
                                  controller: controller.longitudeController,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 8.v),
                      Container(
                        height: 350.v,
                        width: double.maxFinite,
                        decoration:
                            AppDecoration.outlineBluegray100011.copyWith(
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
                        child: GoogleMaps(
                          onChangeLocation: controller.onChangeLocation,
                        ),
                      ),
                      SizedBox(height: 8.v),
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
                                onPressed: () {
                                  controller.reset(byNearest: true);
                                },
                              ),
                            ),
                            Expanded(
                              child: CustomElevatedButton(
                                text: "filter".tr,
                                margin: EdgeInsets.only(left: 4.h),
                                onPressed: () {
                                  controller.onPressedFilter(byNearest: true);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }
              }),
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

  Widget? avatar(DonorData donor) {
    return CircleAvatar(
      radius: 44.adaptSize,
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

  void onTapAvatar(DonorData donor) {
    controller.profileImage.value = null;

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
            crossAxisAlignment: CrossAxisAlignment.center,
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
                      "profile".tr,
                      style: TextStyle(
                        color: appTheme.whiteA700,
                        fontSize: 12.fSize,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    CustomImageView(
                      svgColor: appTheme.white,
                      imagePath: "close".icon.svg,
                      height: 15.adaptSize,
                      width: 15.adaptSize,
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.v),
              Obx(() {
                File? image = controller.profileImage.value;
                return Stack(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 88.adaptSize,
                      backgroundImage: image != null
                          ? FileImage(image)
                          : donor.profileImage != null
                              ? NetworkImage(donor.profileImage ?? "")
                              : null,
                      child: image == null
                          ? donor.profileImage == null
                              ? Text(
                                  "${donor.firstName.toString().avatar}${donor.lastName.toString().avatar}",
                                  style: TextStyle(
                                    color: appTheme.whiteA700,
                                    fontSize: 32.fSize,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              : null
                          : null,
                    ),
                    Positioned(
                      bottom: 4.v,
                      right: 4.h,
                      child: InkWell(
                        onTap: () {
                          pickers.pickImage().then((file) {
                            if (file != null) {
                              controller.profileImage.value = file;
                              controller.profileImage.refresh();
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.adaptSize),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: appTheme.primary),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: appTheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
              SizedBox(height: 8.v),
              Padding(
                padding: EdgeInsets.only(right: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() {
                      return CustomElevatedButton(
                        width: 100.h,
                        height: 32.v,
                        text: controller.propsProfile.useState.value !=
                                UseState.deleting
                            ? "delete".tr
                            : "",
                        buttonStyle: CustomButtonStyles.fillRedA,
                        leftIcon: controller.propsProfile.useState.value ==
                                UseState.deleting
                            ? CustomProgressButton(
                                indicator: false,
                                lable: 'processing'.tr,
                              )
                            : null,
                        onPressed: () async {
                          if (controller.propsProfile.useState.value !=
                              UseState.deleting) {
                            await controller
                                .deleteProfileImage(donor.tagNumber);
                          }
                        },
                      );
                    }),
                    SizedBox(width: 8.v),
                    Obx(() {
                      return CustomElevatedButton(
                        width: 100.h,
                        height: 32.v,
                        text: controller.propsProfile.useState.value !=
                                UseState.updating
                            ? "update".tr
                            : "",
                        buttonStyle: CustomButtonStyles.fillPrimaryA,
                        leftIcon: controller.propsProfile.useState.value ==
                                UseState.updating
                            ? CustomProgressButton(
                                indicator: false,
                                lable: 'processing'.tr,
                              )
                            : null,
                        onPressed: () async {
                          if (controller.propsProfile.useState.value !=
                              UseState.processing) {
                            await controller.updateProfileImage(
                              donor.tagNumber,
                              controller.profileImage.value!,
                            );
                          }
                        },
                      );
                    }),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: (SizeUtils.statusBarHeight + 24).v),
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
                      InkWell(
                        onTap: onPressedAdd,
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
                                "add_donors".tr,
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
                        width: 90.adaptSize,
                        height: 30.adaptSize,
                        child: Obx(
                          () => PageSizeDropDown(
                            circularRadius: 33,
                            hintText: controller.pageSize.value.toString(),
                            items: pageSizeList
                                .map((page) => DropDown(
                                      id: page,
                                      value: page,
                                      title: page.toString(),
                                    ))
                                .toList(),
                            onSelected: controller.onChangedPageSize,
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
                              return Center(
                                child: Text("no_records_found".tr),
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
                                            child: InkWell(
                                              onTap: () {
                                                onTapAvatar(donor);
                                              },
                                              child: avatar(donor),
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
                                          const Spacer(),
                                          IconButton(
                                            onPressed: () {
                                              Get.to(
                                                () => DonorDetailsScreen(donor),
                                              );
                                            },
                                            icon: CustomImageView(
                                              imagePath: 'arrow_right'.icon.svg,
                                            ),
                                          )
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
                                            if (donor.accountType == 'B') ...[
                                              listTile(
                                                label: "business_name".tr,
                                                value: donor.businessName ??
                                                    "None",
                                              ),
                                              SizedBox(height: 4.v),
                                              Divider(
                                                color: appTheme.gray600
                                                    .withOpacity(0.4),
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
                    DonorLinks links = controller.links.value;
                    return WebPagination(
                      displayItemCount:
                          (links.lastPage?.toInt() ?? 0) > 3 ? 3 : 0,
                      currentPage: links.currentPage?.toInt() ?? 0,
                      totalPage: links.lastPage?.toInt() ?? 0,
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
