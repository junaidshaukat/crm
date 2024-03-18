import 'package:flutter/material.dart';
import '/core/app_export.dart';

class DropDown {
  dynamic id;
  String title;
  dynamic value;
  bool isSelected;

  DropDown({
    this.id,
    required this.title,
    this.value,
    this.isSelected = false,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (id != null) {
      data['id'] = id;
    }
    data['title'] = title;
    if (value != null) {
      data['value'] = value;
    }
    data['isSelected'] = isSelected;

    return data;
  }
}

class SimpleDropDown extends StatelessWidget {
  SimpleDropDown({
    super.key,
    this.value,
    this.onChanged,
    this.items,
    this.borderRadius,
    this.circularRadius = 4,
    this.colorBorder,
    this.icon,
    this.focusNode,
    this.autofocus = true,
    this.hintText,
    this.hintStyle,
    this.textStyle,
    this.onSelect,
    this.height,
    this.padding,
    this.containerPadding,
    this.dropdownButtonPadding,
    this.hintPadding,
    this.overflow = TextOverflow.ellipsis,
  });
  final TextOverflow? overflow;
  final double? height;
  final Widget? icon;
  final String? value;
  final void Function(DropDown?)? onChanged;
  final void Function(DropDown?)? onSelect;

  final List<DropDown>? items;
  final BorderRadiusGeometry? borderRadius;
  final int circularRadius;
  final Color? colorBorder;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding,
      containerPadding,
      dropdownButtonPadding,
      hintPadding;

  final Rx<String?> hint = Rx(null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: height,
      padding: containerPadding ?? const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        borderRadius: borderRadius ??
            BorderRadius.circular(
              circularRadius.adaptSize,
            ),
        border: Border.all(
          color: colorBorder ?? appTheme.gray400,
          width: 1.0,
        ),
      ),
      child: DropdownButton<DropDown>(
        isExpanded: true,
        padding: dropdownButtonPadding ?? EdgeInsets.only(left: 8.h),
        focusNode: focusNode ?? FocusNode(),
        icon: icon ?? const Icon(Icons.arrow_drop_down),
        autofocus: autofocus,
        style: textStyle ??
            TextStyle(
              color: appTheme.gray80001,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
        underline: const SizedBox(),
        hint: Padding(
          padding: hintPadding ?? EdgeInsets.only(right: 24.h),
          child: Text(
            hintText ?? '',
            style: textStyle ??
                TextStyle(
                  overflow: overflow,
                  color: appTheme.gray80001,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        items: items?.map((DropDown item) {
          return DropdownMenuItem<DropDown>(
            value: item,
            onTap: () {
              if (onSelect != null) onSelect!(item);
            },
            child: Text(
              item.title,
              overflow: TextOverflow.ellipsis,
              style: hintStyle ??
                  TextStyle(
                    color: appTheme.gray80001,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}

class SimpleDropDown2 extends StatelessWidget {
  final List<DropDown>? items;
  final void Function(DropDown?)? onChanged;
  final String? hintText;
  final Widget? icon;
  final TextStyle? hintStyle;

  const SimpleDropDown2({
    super.key,
    this.items,
    required this.onChanged,
    this.hintText,
    this.icon,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: items?.map((DropDown item) {
        return DropdownMenuItem<DropDown>(
          value: item,
          onTap: () {},
          child: Text(
            item.title,
            overflow: TextOverflow.ellipsis,
            style: hintStyle,
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
