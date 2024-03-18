import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'binding/binding.dart';
export 'controller/controller.dart';
export 'models/model.dart';

class ChannelsScreen extends StatelessWidget {
  ChannelsScreen({super.key});
  final controller = Get.put(ChannelsController());
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
    required ChannelsController conn,
  }) {
    List list = [];
    console.log({
      'checkboxList': checkboxList,
      'value': value,
      'control': control,
      'visible': visible,
    });
    Rx<String?> date = Rx(null);

    if (checkboxList != null) list = checkboxList as List;

    return Visibility(
      visible: visible,
      child: SizedBox(
        width: FIGMA_DESIGN_WIDTH.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (control == 'textbox')
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
            if (control == 'datetime')
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
                    "filter_channel".tr,
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
                      conn: controller,
                      checkboxList: controller.routeValues.value[field.value],
                      visible: field.selected!.value,
                      label: field.label.toString(),
                      control: field.control!,
                      hintText: field.data,
                      value: field.value,
                      onSelect: (option) {
                        console.log(option);

                        if (controller.query.containsKey(option['key'])) {
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
                          controller.query[option['key']] = [option['value']];
                        }
                        console.log(controller.query.entries, name: 'entries');
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
                  hintText: controller.by2.value?.label ?? "sort_by".tr,
                  items: controller.fields.map((field) {
                    return DropDown(
                      id: field.value,
                      title: field.label.toString(),
                      value: field,
                    );
                  }).toList(),
                  onChanged: (option) {
                    controller.request.by = option?.value.value.toString();
                    controller.by2.value = option?.value;
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
                        id: '1', title: 'ascending'.tr, value: 'ascending'),
                    DropDown(
                        id: '2', title: 'descending'.tr, value: 'descending'),
                  ],
                  onChanged: (option) {
                    controller.request.order = option?.value.toString().orderBy;
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

  void editChannelName(ChannelsData channel) {
    controller.channelName.text = channel.organizationDefinedName!;
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
                      "update_channel".tr,
                      style: TextStyle(
                        color: appTheme.whiteA700,
                        fontSize: 12.fSize,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    CustomImageView(
                      imagePath: "close".icon.svg,
                      height: 15.adaptSize,
                      width: 15.adaptSize,
                      onTap: () {
                        if (controller.propsUpdateChannel.useState.value !=
                            UseState.processing) {
                          Get.back();
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 13.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.h),
                child: Text(
                  "Channel Name".tr,
                  style: TextStyle(
                    color: appTheme.gray80001,
                    fontSize: 14.fSize,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 2.adaptSize),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.h),
                child: CustomTextFormField(
                  hintText: channel.organizationDefinedName,
                  controller: controller.channelName,
                  fillColor: appTheme.gray10001,
                  borderDecoration: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.gray400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 13.v),
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
                        if (controller.propsUpdateChannel.useState.value !=
                            UseState.processing) {
                          Get.back();
                        }
                      },
                    ),
                    SizedBox(width: 4.h),
                    Obx(
                      () => CustomElevatedButton(
                        height: 32.v,
                        width: 100.h,
                        text: controller.propsUpdateChannel.useState.value ==
                                UseState.none
                            ? "update".tr
                            : "",
                        leftIcon:
                            controller.propsUpdateChannel.useState.value ==
                                    UseState.none
                                ? null
                                : CustomProgressButton(
                                    indicator: false,
                                    lable: 'processing'.tr,
                                  ),
                        margin: EdgeInsets.symmetric(horizontal: 0.h),
                        onPressed: () async {
                          ChannelUpdateReq request = ChannelUpdateReq(
                            organizationDefinedName:
                                controller.channelName.text,
                          );
                          await controller.updateChannelName(
                            channel.tagNumber,
                            request.toJson(),
                            event: (val) {
                              controller.reloadData();
                            },
                          );
                        },
                      ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 64.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: AppbarWithBackAndFilter(
              back: true,
              title: "channels".tr,
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.v),
                  const Center(
                    child: CustomDivider(),
                  ),
                  SizedBox(height: 16.v),
                  Text(
                    "channels_summary".tr,
                    style: TextStyle(
                      color: appTheme.gray80001,
                      fontSize: 14.fSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16.v),
                  Obx(() {
                    UseState useState =
                        controller.propsChannelSummary.useState.value;
                    UseError error = controller.propsChannelSummary.error.value;
                    if (useState == UseState.none ||
                        useState == UseState.loading) {
                      return const CircularProgress();
                    } else if (error.message != null) {
                      return TryAgain(
                          message: error.message, tryAgain: () async {});
                    } else {
                      List<ChennelMenu> channelSummary =
                          controller.channelSummary;
                      if (channelSummary.isEmpty) {
                        return const Center(
                          child: Text('No Record Found.'),
                        );
                      }
                      return SizedBox(
                        height: 100.v,
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 12.h);
                          },
                          itemCount: channelSummary.length,
                          itemBuilder: (context, index) {
                            ChennelMenu summary =
                                controller.channelSummary[index];
                            return InkWell(
                              onTap: () {
                                controller.selectChannel(summary);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomIconButton(
                                    height: 54.v,
                                    width: 54.h,
                                    padding: EdgeInsets.all(8.h),
                                    decoration:
                                        AppDecoration.fillLightGreen.copyWith(
                                      border:
                                          Border.all(color: appTheme.primary),
                                      borderRadius:
                                          BorderRadiusStyle.customBorderTL8,
                                    ),
                                    child: Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: [
                                        CustomImageView(
                                          imagePath: summary.image,
                                          width: 26.adaptSize,
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Text(
                                            "${summary.value}",
                                            style: TextStyle(
                                              color: appTheme.gray80001,
                                              fontSize: 12.fSize,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10.v),
                                  Text(
                                    summary.label,
                                    style: TextStyle(
                                      color: appTheme.gray80001,
                                      fontSize: 12.fSize,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 8.v),
                                  Obx(
                                    () => Container(
                                      height: 4.v,
                                      width: 54.h,
                                      decoration: summary.selected.isTrue
                                          ? AppDecoration.fillPrimary.copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .customBorderTL28,
                                            )
                                          : null,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                  }),
                  SizedBox(height: 16.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "registered_channels".tr,
                        style: TextStyle(
                          color: appTheme.gray80001,
                          fontSize: 14.fSize,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: CustomElevatedButton(
                          height: 32.v,
                          width: 75.h,
                          text: "filters".tr,
                          onPressed: onTapFilter,
                          leftIcon: Container(
                            margin: EdgeInsets.only(right: 5.h),
                            child: CustomImageView(
                              imagePath: "filters".icon.svg,
                              svgColor: appTheme.whiteA700,
                            ),
                          ),
                          buttonStyle: CustomButtonStyles.fillPrimaryTL16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.v),
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Obx(
                        () {
                          UseState useState =
                              controller.propsRegisteredChannels.useState.value;
                          UseError error =
                              controller.propsRegisteredChannels.error.value;

                          if (useState == UseState.none ||
                              useState == UseState.loading) {
                            return const CircularProgress();
                          } else {
                            if (error.message != null) {
                              return TryAgain(
                                message: error.message,
                                tryAgain: () async {},
                              );
                            }

                            List<ChannelsData> channels = controller.channels;
                            if (channels.isEmpty) {
                              return const NoRecordFound();
                            } else {
                              return ListView.separated(
                                shrinkWrap: true,
                                itemCount: channels.length,
                                padding: EdgeInsets.zero,
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 11.v);
                                },
                                itemBuilder: (context, index) {
                                  ChannelsData channel = channels[index];
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 4.h,
                                      vertical: 4.v,
                                    ),
                                    decoration:
                                        AppDecoration.outlinePrimary2.copyWith(
                                      color: appTheme.lightGreen50,
                                      border: Border.all(
                                        width: 1,
                                        color: appTheme.primary,
                                      ),
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder5,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${channel.organizationDefinedName}',
                                                style: TextStyle(
                                                  color:
                                                      theme.colorScheme.primary,
                                                  fontSize: 12.fSize,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(height: 4.v),
                                              Text(
                                                '${channel.type} ${channel.tagNumber}',
                                                style: TextStyle(
                                                  color: appTheme.gray80001,
                                                  fontSize: 12.fSize,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                channel.userName ?? '',
                                                style: TextStyle(
                                                  color:
                                                      theme.colorScheme.primary,
                                                  fontSize: 12.fSize,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(height: 4.v),
                                              Text(
                                                channel.passcode ?? '',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: appTheme.gray80001,
                                                  fontSize: 12.fSize,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              CustomImageView(
                                                imagePath: "edit".icon.svg,
                                                height: 21.adaptSize,
                                                width: 21.adaptSize,
                                                onTap: () {
                                                  editChannelName(channel);
                                                },
                                              ),
                                              SizedBox(height: 4.v),
                                              Text(
                                                '${channel.currencySymbol}${channel.raisedAmount}',
                                                style: TextStyle(
                                                  color:
                                                      theme.colorScheme.primary,
                                                  fontSize: 12.fSize,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 24.v),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
