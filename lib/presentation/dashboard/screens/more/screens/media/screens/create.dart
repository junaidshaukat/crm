import 'dart:io';

import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CreateMediaScreen extends StatelessWidget {
  CreateMediaScreen({super.key, required this.event});

  final void Function(dynamic) event;
  final CreateMediaController controller = Get.put(CreateMediaController());

  Future<void> onPressed() async {
    if (controller.formKey.currentState!.validate()) {
      CreateMediaReq request = CreateMediaReq(
        name: controller.nameController.text,
        description: controller.descriptionController.text,
        duration: controller.durationController.text,
        sortOrder: controller.sortOrderController.text,
        fullScreen: controller.fullScreen.value,
        status: controller.status.value,
        isMuted: controller.isMuted.value,
        mediaFile: controller.mediaFile.value?.file,
      );
      controller.create(request.toJson(), event).then((res) async {
        await pickers.getCache();
        await pickers.clearCache();
        await pickers.getCache();
      });
    }
  }

  Widget input({
    int? height,
    String? label,
    String? hintText,
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
            borderDecoration: OutlineInputBorder(
              borderSide: BorderSide(
                color: appTheme.gray400,
              ),
            ),
          ),
        if (dropDown)
          SimpleDropDown(
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
    if (controller.mediaType.value == 'image') {
      try {
        File? result = await pickers.image();
        if (result != null) {
          MediaFile media = MediaFile(true, ipResult: result);
          await media.init();
          controller.durationController.text = media.duration.toString();
          controller.mediaFileController.text = media.name;
          controller.mediaFile.value = media;
          console.log(media.toJson(), name: 'media', force: true);
        } else {
          controller.mediaFile.value = null;
          controller.mediaFileController.clear();
        }
      } catch (e) {
        controller.mediaFile.value = null;
        controller.mediaFileController.clear();
      }
    }

    if (controller.mediaType.value == 'video') {
      try {
        File? result = await pickers.video();
        if (result != null) {
          MediaFile media = MediaFile(true, ipResult: result);
          await media.init();
          controller.durationController.text = media.duration.toString();
          controller.mediaFileController.text = media.name;
          controller.mediaFile.value = media;
          console.log(media.toJson(), name: 'media', force: true);
        } else {
          controller.mediaFile.value = null;
          controller.mediaFileController.clear();
        }
      } catch (e) {
        controller.mediaFile.value = null;
        controller.mediaFileController.clear();
      }
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
              title: "add_media".tr,
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
                        validator: ValidatorMedia.name,
                      ),
                      input(
                        label: 'description'.tr,
                        hintText: 'description'.tr,
                        conn: controller.descriptionController,
                        validator: ValidatorMedia.description,
                      ),
                      input(
                        dropDown: true,
                        label: 'media_type'.tr,
                        hintText: controller.mediaType.value,
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
                        onChanged: (option) {
                          controller.mediaFile.value = null;
                          controller.mediaFileController.clear();
                          controller.mediaType.value = option?.value;
                        },
                      ),
                      input(
                        onTap: onTap,
                        readOnly: true,
                        label: 'media_file'.tr,
                        hintText: 'media_file'.tr,
                        conn: controller.mediaFileController,
                        validator: (val) {
                          MediaFile? mediaFile = controller.mediaFile.value;
                          if (mediaFile != null) {
                            if (mediaFile.size > 20) {
                              return "file_size_exceed".tr;
                            }

                            if (mediaFile.size <= 0) {
                              return "media_file_required".tr;
                            }
                          }

                          if (val == null || mediaFile == null) {
                            return "media_file_required".tr;
                          }

                          if (val.isEmpty) {
                            return "media_file_extension_required".tr;
                          }

                          return null;
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: input(
                              label: 'duration'.tr,
                              hintText: 'duration'.tr,
                              keyboardType: TextInputType.number,
                              conn: controller.durationController,
                              validator: ValidatorMedia.duration,
                            ),
                          ),
                          SizedBox(width: 12.h),
                          Expanded(
                            child: input(
                              label: 'sort_order'.tr,
                              hintText: 'sort_order'.tr,
                              keyboardType: TextInputType.number,
                              conn: controller.sortOrderController,
                              validator: ValidatorMedia.sortOrder,
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
                              ? "add_media".tr
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
