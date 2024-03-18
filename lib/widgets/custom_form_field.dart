import 'package:flutter/material.dart';
import '/core/app_export.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.onChanged,
    this.onTap,
    this.borderColor,
    this.readOnly = false,
    this.overflow = TextOverflow.ellipsis,
  });

  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool readOnly;
  final Color? borderColor;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.h),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        readOnly: readOnly,
        onTap: onTap,
        style: TextStyle(
          overflow: overflow,
          color: appTheme.gray80001,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(8.h),
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(
            overflow: overflow,
            color: appTheme.gray80001,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? appTheme.gray400,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? appTheme.gray400,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.h),
            borderSide: BorderSide(
              color: borderColor ?? appTheme.gray400,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class InputForm extends StatelessWidget {
  const InputForm({
    super.key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.overflow = TextOverflow.ellipsis,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool readOnly;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.h),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        readOnly: readOnly,
        onTap: onTap,
        validator: validator,
        autovalidateMode: autovalidateMode,
        style: TextStyle(
          overflow: overflow,
          color: appTheme.gray80001,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(8.h),
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(
            overflow: overflow,
            color: appTheme.gray80001,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: appTheme.gray400,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: appTheme.gray400,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.h),
            borderSide: BorderSide(
              color: appTheme.gray400,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
