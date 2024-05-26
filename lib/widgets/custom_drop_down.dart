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

class SimpleDropDown extends StatefulWidget {
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
  });

  final bool enabled;
  final Widget? icon;
  final double width;
  final int? height;
  final String? hintText;
  final EdgeInsets? padding;
  final List<DropDown>? items;
  final void Function(DropDown?)? onSelected;

  final BorderRadius? borderRadius;
  final int circularRadius;
  final TextOverflow? overflow;

  @override
  SimpleDropDownState createState() => SimpleDropDownState();
}

class SimpleDropDownState extends State<SimpleDropDown> {
  DropDown? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: EdgeInsets.zero,
      child: DropdownMenu<DropDown>(
        enabled: widget.enabled,
        hintText: widget.hintText,
        enableSearch: false,
        requestFocusOnTap: false,
        width: widget.width + 2,
        expandedInsets: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        onSelected: (item) {
          setState(() {
            selectedItem = item;
          });
          if (widget.onSelected != null) {
            widget.onSelected!(item);
          }
        },
        trailingIcon: widget.icon,
        selectedTrailingIcon: widget.icon,
        textStyle: TextStyle(
          color: appTheme.gray80001,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
        ),
        dropdownMenuEntries: widget.items!.map((DropDown item) {
          return DropdownMenuEntry(
            value: item,
            label: item.title,
          );
        }).toList(),
        inputDecorationTheme: InputDecorationTheme(
          helperMaxLines: 4,
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          helperStyle: TextStyle(
            color: appTheme.gray80001,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: appTheme.gray400,
              width: 1.0,
            ),
            borderRadius: widget.borderRadius ??
                BorderRadius.circular(widget.circularRadius.adaptSize),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: appTheme.gray400,
              width: 1.0,
            ),
            borderRadius: widget.borderRadius ??
                BorderRadius.circular(widget.circularRadius.adaptSize),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: appTheme.gray400,
              width: 1.0,
            ),
            borderRadius: widget.borderRadius ??
                BorderRadius.circular(widget.circularRadius.adaptSize),
          ),
        ),
        menuStyle: MenuStyle(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          padding: const WidgetStatePropertyAll(
            EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
          ),
          elevation: const WidgetStatePropertyAll(5),
          alignment: Alignment.bottomLeft,
          maximumSize: widget.height != null
              ? WidgetStatePropertyAll(
                  Size.fromHeight(widget.height!.toDouble()),
                )
              : null,
        ),
      ),
    );
  }
}
