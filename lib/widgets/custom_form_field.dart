import 'package:flutter/material.dart';

import '/core/app_export.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    this.onTap,
    this.hintText,
    this.onChanged,
    this.controller,
    this.suffixIcon,
    this.borderColor,
    this.keyboardType,
    this.readOnly = false,
    this.overflow = TextOverflow.ellipsis,
  });

  final bool readOnly;
  final String? hintText;
  final Widget? suffixIcon;
  final Color? borderColor;
  final void Function()? onTap;
  final TextOverflow? overflow;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.h),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        readOnly: readOnly,
        onTap: onTap,
        keyboardType: keyboardType,
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
    this.onTap,
    this.hintText,
    this.onChanged,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.keyboardType,
    this.readOnly = false,
    this.overflow = TextOverflow.ellipsis,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  final bool readOnly;
  final String? hintText;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final TextOverflow? overflow;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;

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
        keyboardType: keyboardType,
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
