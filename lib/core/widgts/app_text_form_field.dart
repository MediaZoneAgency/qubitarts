import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../localization/localization_cubit.dart';
import '../theming/colors.dart';



class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final bool? enabled;

  final List<BoxShadow>? boxShadow;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
final Function(String)? onSubmit;

  final Color? backgroundColor;
  final double?height;
  final double?width;
   final TextAlignVertical? textAlignVertical;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final String? Function(String?)? validator;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.validator,
    this.textStyle, this.height, this.boxShadow, this.width, this.prefixIcon, this.textAlignVertical, this.enabled, this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(


        onFieldSubmitted: onSubmit,
      enabled: enabled,
        //maxLines: null,
        textAlignVertical: textAlignVertical??TextAlignVertical.center,
        controller: controller,
        decoration: InputDecoration(


          prefixIcon:prefixIcon ,
          fillColor: backgroundColor ?? Colors.transparent,
          filled: backgroundColor != null,
          isDense: true,
          contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 11.h),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(
                  //color: backgroundColor ,
                  width: 1.3.w,
                ),
                borderRadius: BorderRadius.circular(10.0.r),
              ),
          enabledBorder:enabledBorder??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorsManager.lightGray,
                 width: 1.3,
                ),
                borderRadius: BorderRadius.circular(10.0.r),
              ),
          errorBorder: OutlineInputBorder(

            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(10.0.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          hintStyle: hintStyle ,
          hintText: hintText,
          hintTextDirection: LocalizationCubit.get(context).locale.languageCode == 'ar' ?TextDirection.rtl:TextDirection.ltr,
          suffixIcon: Padding(
            padding: EdgeInsetsDirectional.only(end: 7.5.w),
            child: suffixIcon,
          ),
        ),
        obscureText: isObscureText ?? false,
        style: textStyle ,

        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return "Must not be empty";
              }
              return null;
            },
      ),
    );
  }
}