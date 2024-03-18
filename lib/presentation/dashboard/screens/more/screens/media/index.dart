import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'binding/binding.dart';
export 'controller/controller.dart';
export 'models/model.dart';
export 'screens/export.dart';

class MediaCentreScreen extends StatelessWidget {
  MediaCentreScreen({super.key});
  final controller = Get.put(MediaCentreController());

  Widget cell({required String label, required String value, bool? status}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: appTheme.gray80001,
            fontSize: 10.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 9.v),
        if (status != null)
          Icon(
            Icons.check_circle_rounded,
            size: 20,
            color: status == false ? appTheme.yellow800 : appTheme.green900,
          ),
        if (status == null)
          Text(
            value,
            style: TextStyle(
              color: appTheme.gray80001,
              fontSize: 9.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
            ),
          ),
      ],
    );
  }

  Widget icons({String? imagePath, void Function()? onTap}) {
    return Container(
      width: 24,
      height: 24,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: appTheme.primary,
        ),
      ),
      child: CustomImageView(
        width: 24,
        height: 24,
        imagePath: imagePath,
        svgColor: appTheme.primary,
        alignment: Alignment.center,
      ),
    );
  }

  void onCreate() {
    Get.to(
      () => CreateMediaScreen(
        event: (event) {
          if (event == "update") {
            controller.reloadData();
          }
        },
      ),
    );
  }

  void onWidget(WidgetData widget) {
    console.log(widget.widgetValue);
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
                      "".tr,
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
                        if (controller.propsMedia.useState.value !=
                            UseState.deleting) {
                          Get.back();
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.v),
                child: Text("${widget.widgetValue}"),
              ),
              SizedBox(height: 18.v),
            ],
          ),
        ),
      ),
    );
  }

  void onUpdateWidget(WidgetData widget) {
    TextEditingController widgetValue =
        TextEditingController(text: widget.widgetValue);
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
                      "update_widget".tr,
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
                        if (controller.propsMedia.useState.value !=
                            UseState.deleting) {
                          Get.back();
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.h),
                child: TextField(
                  maxLines: 7,
                  controller: widgetValue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 4.v),
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
                        if (controller.propsMedia.useState.value !=
                            UseState.deleting) {
                          Get.back();
                        }
                      },
                    ),
                    SizedBox(width: 8.v),
                    CustomElevatedButton(
                      height: 32.v,
                      width: 100.h,
                      text: "update".tr,
                      buttonStyle: CustomButtonStyles.fillRedA.copyWith(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => appTheme.primary,
                        ),
                      ),
                      onPressed: () {
                        controller.updateWidget(
                          tagNumber: widget.tagNumber,
                          widgetValue: widgetValue.text,
                          status: widget.status,
                          callback: (message) {
                            Get.back();
                            Toasts.success(message: message.toString());
                            controller.getWidgets();
                          },
                        );
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

  void onUpdate(MediaData media) {
    Get.to(
      () => UpdateMediaScreen(
        media: media,
        event: (event) {
          if (event == "update") {
            controller.reloadData();
          }
        },
      ),
    );
  }

  void onDelete(num? tagNumber) {
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
                      "delete_media".tr,
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
                        if (controller.propsMedia.useState.value !=
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
                if (controller.propsMedia.useState.value == UseState.deleting) {
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
                          "are_you_sure_delete_media".tr,
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
                        if (controller.propsMedia.useState.value !=
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
                        await controller.delete(tagNumber);
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

  Widget visibility({
    required bool visible,
    required String label,
    required String control,
    required String value,
    TextEditingController? controller,
    dynamic hintText,
    void Function(dynamic)? onChanged,
    required void Function()? onRemove,
    void Function()? onTap,
  }) {
    Rx<String?> date = Rx(null);
    Rx<bool?> switchs = Rx(hintText == 1 ? true : false);
    Rx<String?> dropdown = Rx(null);

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
          if (control == 'textbox' && value != "media_type")
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
            ),
          if (control == 'textbox' && value == "media_type")
            Obx(
              () => SimpleDropDown(
                icon: Row(
                  children: [
                    CustomImageView(
                      imagePath: "dropdown".icon.svg,
                      height: 23.v,
                      width: 28.h,
                    ),
                    IconButton(
                      onPressed: onRemove,
                      icon: Icon(
                        Icons.close,
                        color: appTheme.gray400,
                      ),
                    )
                  ],
                ),
                hintText: dropdown.value ?? hintText,
                items: ["image", "video"]
                    .map(
                      (e) => DropDown(
                        id: e,
                        title: e.toString().padLeft(2, '0'),
                        value: e,
                      ),
                    )
                    .toList(),
                onChanged: (option) {
                  onChanged!(option?.value);
                  dropdown.value = option?.value;
                },
              ),
            ),
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
                    "filter_media".tr,
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
                      value: field.value!,
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
                  items: pageSizeList3.map((e) {
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

  /// Section Widget
  Widget buildFilters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onCreate,
          child: CustomImageView(
            imagePath: "plus_circle".icon.svg,
          ),
        ),
        GestureDetector(
          onTap: onCreate,
          child: Padding(
            padding: EdgeInsets.only(
              left: 7.h,
              top: 6.v,
              bottom: 7.v,
            ),
            child: Text(
              "add_media".tr,
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
        CustomElevatedButton(
          height: 32.v,
          width: 100.h,
          text: "filters".tr,
          leftIcon: Container(
            margin: EdgeInsets.only(right: 5.h),
            child: CustomImageView(
              svgColor: appTheme.whiteA700,
              imagePath: "filters".icon.svg,
            ),
          ),
          buttonStyle: CustomButtonStyles.fillPrimaryTL16,
          onPressed: onTapFilter,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 64.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: AppbarWithBackAndFilter(
              back: true,
              title: "media_center".tr,
            ),
          ),
          SizedBox(height: 12.v),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
              decoration: AppDecoration.outlinePrimary.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL28,
              ),
              child: Obx(() {
                UseState useState = controller.props.useState.value;
                UseError error = controller.props.error.value;

                if (useState == UseState.none || useState == UseState.loading) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [CircularProgress()],
                  );
                }

                if (error.message != null) {
                  return TryAgain(
                    message: error.message,
                    tryAgain: controller.tryAgain,
                  );
                }

                return SingleChildScrollView(
                  controller: controller.controller,
                  child: Column(
                    children: [
                      SizedBox(height: 10.v),
                      const CustomDivider(),
                      SizedBox(height: 10.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 0.h),
                          child: Text(
                            "widgets".tr,
                            style: TextStyle(
                              color: appTheme.gray80001,
                              fontSize: 16.fSize,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.v),
                      Obx(() {
                        UseState useState =
                            controller.propsWidgets.useState.value;
                        UseError error = controller.propsWidgets.error.value;

                        if (useState == UseState.none ||
                            useState == UseState.loading) {
                          return const CircularProgress();
                        } else {
                          if (error.message != null) {
                            return TryAgain(
                              message: error.message,
                              tryAgain: controller.tryAgainWidgets,
                            );
                          }

                          List<WidgetData> widgets = controller.widgets;
                          if (widgets.isEmpty) {
                            return const NoRecordFound();
                          } else {
                            return Wrap(
                              spacing: 12.h,
                              runSpacing: 12.v,
                              children: List.generate(
                                widgets.length,
                                (index) {
                                  WidgetData widget = widgets[index];
                                  return Container(
                                    width: (393 - 65).h / 2,
                                    decoration:
                                        AppDecoration.outlineBlueGray.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder16,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 100.v,
                                          width: double.maxFinite,
                                          decoration:
                                              AppDecoration.fillGreen.copyWith(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16.h),
                                              topRight: Radius.circular(16.h),
                                            ),
                                          ),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                top: 12,
                                                child: CustomImageView(
                                                  imagePath: widget.icon
                                                      ?.replaceAll(' ', '')
                                                      .icon
                                                      .svg,
                                                  fit: BoxFit.fill,
                                                  width: 44.adaptSize,
                                                  height: 44.adaptSize,
                                                  svgColor: appTheme.whiteA700,
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 12,
                                                child: Text(
                                                  '${widget.name}',
                                                  style: TextStyle(
                                                    color: appTheme.whiteA700,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              if (widget.valueRequired == true)
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: IconButton(
                                                    onPressed: () =>
                                                        onUpdateWidget(widget),
                                                    selectedIcon:
                                                        CustomImageView(
                                                      imagePath:
                                                          "edit".icon.svg,
                                                      fit: BoxFit.fill,
                                                      svgColor:
                                                          appTheme.whiteA700,
                                                    ),
                                                    icon: CustomImageView(
                                                      imagePath:
                                                          "edit".icon.svg,
                                                      fit: BoxFit.fill,
                                                      svgColor:
                                                          appTheme.whiteA700,
                                                    ),
                                                  ),
                                                ),
                                              if (widget.valueRequired == true)
                                                Positioned(
                                                  right: 0,
                                                  top: 0,
                                                  child: IconButton(
                                                    onPressed: () =>
                                                        onWidget(widget),
                                                    icon: CustomImageView(
                                                      imagePath:
                                                          "more".icon.svg,
                                                      fit: BoxFit.fill,
                                                      svgColor:
                                                          appTheme.whiteA700,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 12.v),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(width: 12.v),
                                            Text('Location ${widget.location}'),
                                            const Spacer(),
                                            SizedBox(
                                              width: 44.adaptSize,
                                              child: FittedBox(
                                                fit: BoxFit.fill,
                                                child: CustomSwitch(
                                                  value: widget.status,
                                                  onChange: (status) {
                                                    controller.updateWidget(
                                                      tagNumber:
                                                          widget.tagNumber,
                                                      widgetValue: null,
                                                      status: status,
                                                      callback: (message) {
                                                        Toasts.success(
                                                          message: message
                                                              .toString(),
                                                        );
                                                        controller.getWidgets();
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 12.v),
                                          ],
                                        ),
                                        SizedBox(height: 12.v),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        }
                      }),
                      SizedBox(height: 10.v),
                      buildFilters(),
                      SizedBox(height: 10.v),
                      Obx(
                        () {
                          UseState useState =
                              controller.propsMedia.useState.value;
                          UseError error = controller.propsMedia.error.value;

                          if (useState == UseState.none ||
                              useState == UseState.loading) {
                            return SizedBox(
                              height: 400.v,
                              child: const Center(
                                child: CircularProgress(),
                              ),
                            );
                          } else {
                            if (error.message != null) {
                              return TryAgain(
                                message: error.message,
                                tryAgain: controller.tryAgainMedia,
                              );
                            } else {
                              if (controller.media.isEmpty) {
                                return const Center(
                                  child: Text('No Recod Found'),
                                );
                              }

                              return ListView.separated(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                controller: controller.controller,
                                itemCount: controller.media.length,
                                itemBuilder: (context, index) {
                                  MediaData media = controller.media[index];
                                  return CustomCard(
                                    padding: EdgeInsets.zero,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 8.v),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 3.h,
                                            vertical: 1.v,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              if (media.mediaType == 'image' ||
                                                  media.mediaType ==
                                                      'application')
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ViewScreen(
                                                          media: media,
                                                          src: media.path ?? '',
                                                          type: "image",
                                                          tag: media.tagNumber!,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: media.tagNumber!,
                                                    child: Container(
                                                      width: 44.adaptSize,
                                                      height: 44.adaptSize,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: AppDecoration
                                                          .fillPrimary
                                                          .copyWith(
                                                        border: Border.all(
                                                            color: appTheme
                                                                .primary),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          100,
                                                        ),
                                                      ),
                                                      child: ClipOval(
                                                        child: CustomImageView(
                                                          imagePath: media.path,
                                                          fit: BoxFit.fill,
                                                          width: 44.adaptSize,
                                                          height: 44.adaptSize,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (media.mediaType == 'video')
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ViewScreen(
                                                          media: media,
                                                          src: media.path ?? '',
                                                          type: "video",
                                                          tag: media.tagNumber!,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: media.tagNumber!,
                                                    child: Container(
                                                      width: 44.adaptSize,
                                                      height: 44.adaptSize,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: AppDecoration
                                                          .fillPrimary
                                                          .copyWith(
                                                        border: Border.all(
                                                            color: appTheme
                                                                .primary),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          100,
                                                        ),
                                                      ),
                                                      child: ClipOval(
                                                        child: CustomImageView(
                                                          alignment:
                                                              Alignment.center,
                                                          imagePath:
                                                              "play".icon.svg,
                                                          height: 28.adaptSize,
                                                          width: 28.adaptSize,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 6.h,
                                                    top: 4.v,
                                                    bottom: 5.v,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "${media.name}",
                                                        style: TextStyle(
                                                          color: theme
                                                              .colorScheme
                                                              .onPrimary,
                                                          fontSize: 14.fSize,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${media.description}',
                                                        style: TextStyle(
                                                          color:
                                                              appTheme.gray600,
                                                          fontSize: 10.fSize,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const Spacer(flex: 1),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  icons(
                                                    imagePath:
                                                        media.mediaType ==
                                                                'video'
                                                            ? "video".icon.svg
                                                            : "image".icon.svg,
                                                    onTap: () {},
                                                  ),
                                                  SizedBox(width: 2.h),
                                                  icons(
                                                    imagePath: media.isMuted ==
                                                            true
                                                        ? "muted".icon.svg
                                                        : "unmuted".icon.svg,
                                                    onTap: () {},
                                                  ),
                                                  SizedBox(width: 2.h),
                                                  icons(
                                                    imagePath: media.status ==
                                                            false
                                                        ? "eye_slash".icon.svg
                                                        : "eye".icon.svg,
                                                    onTap: () {},
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16.v, horizontal: 8.h),
                                          decoration:
                                              AppDecoration.fillLightGreen,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              cell(
                                                label: 'created'.tr,
                                                value: '${media.createDateTime}'
                                                    .dateTime,
                                              ),
                                              cell(
                                                label: 'duration'.tr,
                                                value:
                                                    '${media.duration} seconds',
                                              ),
                                              cell(
                                                label: 'sort_order'.tr,
                                                value: '${media.sortOrder}',
                                              ),
                                              cell(
                                                label: 'full_screen'.tr,
                                                value: media.fullScreen == true
                                                    ? 'Yes'
                                                    : 'No',
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 8.v),
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
                                                onUpdate(media);
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
                                                onDelete(media.tagNumber);
                                              },
                                            ),
                                            SizedBox(width: 8.v),
                                          ],
                                        ),
                                        SizedBox(height: 8.v),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 8.v);
                                },
                              );
                            }
                          }
                        },
                      ),
                      SizedBox(height: 10.v),
                      Obx(() {
                        return WebPagination(
                          displayItemCount: 3,
                          currentPage: controller.page.value,
                          totalPage: controller.totalPage.value,
                          onPageChanged: controller.onPageChanged,
                        );
                      }),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
