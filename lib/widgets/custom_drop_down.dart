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

class PageSizeDropDown extends StatelessWidget {
  const PageSizeDropDown({
    super.key,
    this.value,
    this.onSelected,
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
  final void Function(DropDown?)? onSelected;
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

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      padding: EdgeInsets.only(top: 24.v, left: 24.h, right: 24.h),
      child: Container(
        width: double.maxFinite,
        height: height,
        padding: containerPadding ?? EdgeInsets.zero,
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
          elevation: 12,
          isExpanded: true,
          padding: dropdownButtonPadding ?? EdgeInsets.only(left: 2.h),
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
            padding: hintPadding ?? EdgeInsets.only(right: 2.h),
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
          onChanged: onSelected,
        ),
      ),
    );
  }
}

class SimpleDropDown extends StatelessWidget {
  const SimpleDropDown({
    super.key,
    this.icon,
    this.items,
    this.height,
    this.hintText,
    this.overflow,
    this.onSelected,
    this.borderRadius,
    this.enabled = true,
    this.circularRadius = 4,
    this.width = double.maxFinite,
    this.padding = EdgeInsets.zero,
    this.validator,
    this.onSaved,
    this.contentPadding = EdgeInsets.zero,
  });

  final bool enabled;
  final Widget? icon;
  final double width;
  final int? height;
  final String? hintText;
  final EdgeInsets? padding;
  final List<DropDown>? items;
  final void Function(DropDown?)? onSelected;
  final void Function(DropDown?)? onSaved;

  final BorderRadius? borderRadius;
  final int circularRadius;
  final TextOverflow? overflow;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(DropDown?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<DropDown>(
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: appTheme.gray400,
          ),
          borderRadius: borderRadius ??
              BorderRadius.circular(
                circularRadius.adaptSize,
              ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: appTheme.gray400,
          ),
          borderRadius: borderRadius ??
              BorderRadius.circular(
                circularRadius.adaptSize,
              ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: appTheme.gray400,
          ),
          borderRadius: borderRadius ??
              BorderRadius.circular(
                circularRadius.adaptSize,
              ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: appTheme.gray400,
          ),
          borderRadius: borderRadius ??
              BorderRadius.circular(
                circularRadius.adaptSize,
              ),
        ),
      ),
      hint: Text(
        hintText ?? '',
        style: TextStyle(
          color: appTheme.gray80001,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
        ),
      ),
      items: items
          ?.map((item) => DropdownMenuItem<DropDown>(
                value: item,
                child: Text(
                  item.title,
                  style: TextStyle(
                    color: appTheme.gray80001,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ))
          .toList(),
      validator: validator,
      onChanged: onSelected,
      onSaved: onSaved,
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: appTheme.gray500,
        ),
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: height?.toDouble() ?? double.maxFinite,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(1)),
      ),
    );
  }
}

class SimpleDropDown2 extends StatelessWidget {
  const SimpleDropDown2({
    super.key,
    this.icon,
    this.items,
    this.height,
    this.hintText,
    this.overflow,
    this.onSelected,
    this.borderRadius,
    this.enabled = true,
    this.circularRadius = 4,
    this.width = double.maxFinite,
    this.padding = EdgeInsets.zero,
    this.onSaved,
  });

  final bool enabled;
  final Widget? icon;
  final double width;
  final int? height;
  final String? hintText;
  final EdgeInsets? padding;
  final List<DropDown>? items;
  final void Function(DropDown?)? onSelected;
  final void Function(DropDown?)? onSaved;

  final BorderRadius? borderRadius;
  final int circularRadius;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<DropDown>(
        isExpanded: true,
        hint: Text(
          hintText ?? '',
          style: TextStyle(
            color: appTheme.gray80001,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
          ),
        ),
        items: items
            ?.map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.title,
                    style: TextStyle(
                      color: appTheme.gray80001,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ))
            .toList(),
        onChanged: onSelected,
        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: appTheme.gray400,
            ),
            borderRadius: borderRadius ??
                BorderRadius.circular(
                  circularRadius.adaptSize,
                ),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: height?.toDouble() ?? double.maxFinite,
        ),
        menuItemStyleData: const MenuItemStyleData(),
        onMenuStateChange: (isOpen) {},
        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: appTheme.gray500,
          ),
        ),
      ),
    );
  }
}
