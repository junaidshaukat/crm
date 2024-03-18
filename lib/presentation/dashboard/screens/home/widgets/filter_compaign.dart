import 'package:flutter/material.dart';
import '/core/app_export.dart';

class YearWidget extends StatelessWidget {
  final dynamic controller;
  final List<String> items;
  final void Function(DropDown?)? onChanged;

  const YearWidget({
    super.key,
    required this.controller,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDropDown(
      icon: Padding(
        padding: EdgeInsets.only(right: 8.h),
        child: CustomImageView(
          imagePath: "dropdown".icon.svg,
          width: 24.h,
        ),
      ),
      hintText: controller.year.value.isEmpty
          ? "select_year".tr
          : controller.year.value,
      items: items.map((year) {
        return DropDown(id: year, title: year.toString(), value: year);
      }).toList(),
      onChanged: onChanged,
    );
  }
}

class MonthWidget extends StatelessWidget {
  final dynamic controller;
  final List<String> items;
  final void Function(DropDown?)? onChanged;

  const MonthWidget(
      {super.key,
      required this.controller,
      required this.items,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SimpleDropDown(
      icon: Padding(
        padding: EdgeInsets.only(right: 8.h),
        child: CustomImageView(
          imagePath: "dropdown".icon.svg,
          width: 24.h,
        ),
      ),
      hintText: controller.month.isEmpty ? "select_month".tr : controller.month,
      items: items.map((month) {
        return DropDown(
          id: month,
          title: month,
          value: month,
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}

class DayWidget extends StatelessWidget {
  final dynamic controller;

  const DayWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.date.value;
      return CustomTextFormField(
        hintText: controller.day.isEmpty ? "mm/dyyyy".tr : controller.day,
        textInputAction: TextInputAction.done,
        borderDecoration: const OutlineInputBorder(),
        readOnly: true,
        onTap: () {
          Pickers.date(Get.context!).then((value) {
            if (value != null) {
              controller.day = value.day.toString().padLeft(2, '0');
              controller.date.value = value;
            }
          });
        },
      );
    });
  }
}

class ChannelTypeshWidget extends StatelessWidget {
  final dynamic controller;
  final RxList<ChannelType> channelTypes;

  const ChannelTypeshWidget({
    super.key,
    required this.controller,
    required this.channelTypes,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.v,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: channelTypes.map((channel) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 44.adaptSize,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: CustomsSwitch(
                    value: channel.isSelectedSwitch,
                    onChange: (newValue) {
                      for (ChannelType c in channelTypes) {
                        if (c.value == channel.value) {
                          if (newValue == true) {
                            controller.channelType.add(channel.value);
                          } else {
                            controller.channelType.remove(channel.value);
                          }
                          channel.isSelectedSwitch.value = newValue;
                        }
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 2.v),
              SizedBox(
                width: 70.adaptSize,
                child: Text(
                  channel.label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: appTheme.gray80001,
                    fontSize: 12.fSize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class CustomsSwitch extends StatelessWidget {
  final RxBool value;
  final Function(bool) onChange;

  const CustomsSwitch({super.key, required this.value, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomSwitch(
        value: value.value,
        onChange: (status) {
          value.value = status;
          onChange(status);
        },
      ),
    );
  }
}
