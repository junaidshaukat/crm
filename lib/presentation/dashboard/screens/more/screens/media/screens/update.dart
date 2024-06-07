import 'dart:io';

import 'package:flutter/material.dart';
import '/core/app_export.dart';

class UpdateMediaScreen extends StatelessWidget {
  final void Function(dynamic) event;
  final MediaData media;
  final UpdateMediaController controller = Get.put(UpdateMediaController());

  UpdateMediaScreen({super.key, required this.event, required this.media}) {
    controller.setTextEditingController(media);
  }

  Future<void> onPressed() async {
    if (controller.formKey.currentState!.validate()) {
      UpdateMediaReq request = UpdateMediaReq(
        name: controller.nameController.text,
        description: controller.descriptionController.text,
        duration: controller.durationController.text,
        sortOrder: controller.sortOrderController.text,
        fullScreen: controller.fullScreen.value,
        status: controller.status.value,
        isMuted: controller.isMuted.value,
        mediaFile: controller.media.value?.file,
      );
      await controller.create(media.tagNumber, request.toJson(), event);
    }
  }

  Widget input({
    int? height,
    String? label,
    Widget? suffix,
    String? hintText,
    bool browse = false,
    bool dropDown = false,
    bool readOnly = false,
    List<DropDown>? items,
    void Function()? onTap,
    EdgeInsets? contentPadding,
    TextEditingController? conn,
    void Function(DropDown?)? onChanged,
    String? Function(String?)? validator,
    TextInputType? keyboardType = TextInputType.text,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4.adaptSize),
        Text(
          "$label".tr,
          style: TextStyle(
            color: appTheme.gray80001,
            fontSize: 14.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 2.adaptSize),
        if (!dropDown)
          CustomTextFormField(
            onTap: onTap,
            controller: conn,
            readOnly: readOnly,
            hintText: "$hintText".tr,
            validator: validator,
            fillColor: appTheme.gray10001,
            keyboardType: keyboardType,
            contentPadding: contentPadding,
            suffixConstraints: browse == true
                ? BoxConstraints(
                    minWidth: 120.h,
                    maxWidth: 120.h,
                    minHeight: 50.v,
                    maxHeight: 50.v,
                  )
                : null,
            suffix: browse == true
                ? Container(
                    width: 120.h,
                    height: 50.v,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: appTheme.green800,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4.h),
                        bottomRight: Radius.circular(4.h),
                      ),
                      border: Border.all(
                        color: appTheme.gray400,
                        width: 1.0,
                      ),
                    ),
                    child: suffix,
                  )
                : null,
            borderDecoration: OutlineInputBorder(
              borderSide: BorderSide(
                color: appTheme.gray400,
              ),
            ),
          ),
        if (dropDown)
          SimpleDropDown2(
            items: items,
            height: height,
            hintText: hintText,
            onSelected: onChanged,
            icon: CustomImageView(
              imagePath: "dropdown".icon.svg,
              height: 23.v,
              width: 34.h,
            ),
          ),
        SizedBox(height: 4.adaptSize),
      ],
    );
  }

  Widget customSwitch({
    required String label,
    num width = 50,
    bool? value,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
    required dynamic Function(bool) onChange,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        SizedBox(height: 14.v),
        Text(
          label,
          overflow: TextOverflow.clip,
          maxLines: 2,
          style: TextStyle(
            color: appTheme.gray80001,
            fontSize: 14.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 2.v),
        SizedBox(
          width: width.h,
          child: FittedBox(
            fit: BoxFit.cover,
            child: CustomSwitch(
              value: value,
              onChange: onChange,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> onTap() async {
    try {
      File? file = await pickers.media(mediaType: controller.mediaType.value);
      if (file != null) {
        Media media = await Media.factory(file);
        controller.durationController.text = media.duration.toString();
        controller.mediaFileController.text = media.name;
        controller.media.value = media;
      } else {
        controller.media.value = null;
        controller.mediaFileController.clear();
      }
    } catch (e) {
      controller.media.value = null;
      controller.mediaFileController.clear();
    }
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
              title: "update_media".tr,
            ),
          ),
          SizedBox(height: 12.v),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 16.h),
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
                      SizedBox(height: 14.v),
                      const Center(child: CustomDivider()),
                      SizedBox(height: 19.v),
                      input(
                        label: 'name'.tr,
                        hintText: 'name'.tr,
                        conn: controller.nameController,
                        validator: (input) {
                          return ValidatorMedia.name(input, isRequired: false);
                        },
                      ),
                      input(
                        label: 'description'.tr,
                        hintText: 'description'.tr,
                        conn: controller.descriptionController,
                        validator: (input) {
                          return ValidatorMedia.description(input,
                              isRequired: false);
                        },
                      ),
                      Obx(() {
                        Props props = controller.propsPicking;
                        return input(
                          dropDown: true,
                          label: 'media_type'.tr,
                          hintText: controller.mediaType.value.tr,
                          items: [
                            DropDown(id: 1, title: 'image'.tr, value: 'image'),
                            DropDown(id: 2, title: 'video'.tr, value: 'video'),
                          ]
                              .map(
                                (option) => DropDown(
                                  id: option.id,
                                  title: option.title,
                                  value: option.value,
                                ),
                              )
                              .toList(),
                          onChanged: props.useState.value == UseState.processing
                              ? null
                              : (option) {
                                  controller.media.value = null;
                                  controller.mediaFileController.clear();
                                  controller.mediaType.value = option?.value;
                                },
                        );
                      }),
                      Obx(() {
                        Props props = controller.propsPicking;
                        return input(
                          browse: true,
                          readOnly: true,
                          label: 'media_file'.tr,
                          onTap: props.useState.value == UseState.processing
                              ? null
                              : controller.select,
                          hintText: 'media_file'.tr,
                          conn: controller.mediaFileController,
                          suffix: props.useState.value == UseState.processing
                              ? Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.h),
                                  child: Center(
                                    child: CustomProgressButton(
                                      indicator: false,
                                      lable: 'processing'.tr,
                                      style: TextStyle(
                                        color: appTheme.whiteA700,
                                      ),
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    'browse'.tr,
                                    style: TextStyle(
                                      color: appTheme.whiteA700,
                                    ),
                                  ),
                                ),
                          validator: (val) {
                            Media? media = controller.media.value;
                            if (media != null) {
                              if (val == null) {
                                return "media_file_required".tr;
                              } else if (media.size <= 0) {
                                return "media_file_required".tr;
                              } else if (media.size > 20) {
                                return "file_size_exceed".tr;
                              } else if (!media.supported) {
                                return "media_file_extension_required".tr;
                              } else {
                                return null;
                              }
                            } else {
                              return null;
                            }
                          },
                        );
                      }),
                      Row(
                        children: [
                          Expanded(
                            child: input(
                              label: 'duration'.tr,
                              hintText: 'duration'.tr,
                              keyboardType: TextInputType.number,
                              conn: controller.durationController,
                              validator: (input) {
                                return ValidatorMedia.duration(input,
                                    isRequired: false);
                              },
                            ),
                          ),
                          SizedBox(width: 12.h),
                          Expanded(
                            child: input(
                              label: 'sort_order'.tr,
                              hintText: 'sort_order'.tr,
                              keyboardType: TextInputType.number,
                              conn: controller.sortOrderController,
                              validator: (input) {
                                return ValidatorMedia.sortOrder(input,
                                    isRequired: false);
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => customSwitch(
                              label: "full_screen".tr,
                              value: controller.fullScreen.value,
                              onChange: (value) {
                                controller.fullScreen(value);
                              },
                            ),
                          ),
                          Obx(
                            () => customSwitch(
                              label: "status".tr,
                              value: controller.status.value,
                              onChange: (value) {
                                controller.status(value);
                              },
                            ),
                          ),
                          Obx(
                            () => customSwitch(
                              label: "muted".tr,
                              value: controller.isMuted.value,
                              onChange: (value) {
                                controller.isMuted(value);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.v),
                      Obx(
                        () => CustomElevatedButton(
                          text: controller.props.useState.value == UseState.none
                              ? "update_media".tr
                              : "",
                          leftIcon:
                              controller.props.useState.value == UseState.none
                                  ? null
                                  : CustomProgressButton(
                                      lable: 'processing'.tr,
                                    ),
                          onPressed: onPressed,
                        ),
                      ),
                      SizedBox(height: 16.v),
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
