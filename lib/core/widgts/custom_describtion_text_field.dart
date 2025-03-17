
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/text_styles.dart';

class CustomDescribtionTextField extends StatelessWidget {
  final double? borderRadius;
  final bool? enabled;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? containerWidth;
  final double? containerHeight;
  final  TextStyle? textStyle;
  final  TextStyle? hintStyle;
  final String hintText;
  final TextEditingController? controller;
  const CustomDescribtionTextField(
      {super.key,
      this.borderRadius,
      this.backgroundColor,
      this.containerWidth,
      this.containerHeight,
      required this.hintText,
      this.borderColor, this.textStyle, this.enabled, this.hintStyle, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, ),
      //margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
      width: containerWidth ?? double.infinity.w,
      height: containerHeight ?? 58.h,
      decoration: BoxDecoration(
          color: backgroundColor ?? Color(0xffE9E9E9),
          borderRadius: BorderRadius.circular(borderRadius ?? 13.2.r),
          border: Border.all(
              color: borderColor ?? Color(0xffE4E4E4), width: 0.5.w),
         // boxShadow: const [
         //   BoxShadow(
         //     color: ColorsManager.mainGray,
         //     blurRadius: 3,
         //     spreadRadius: 3,
         //   )
         // ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextFormField(
validator: (value) {
  if (value == null || value.isEmpty) {
    return "Must not be empty";
  }
  return null;
},
          controller: controller,
          enabled: enabled??true,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle ?? TextStyles.lato15SemiBoldGray.copyWith(fontSize: 9.88.sp,color: Color(0xff606060)) ,
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          style: textStyle ?? TextStyles.lato18SemiBoldDarkBlack,
          maxLines: null, // Allows the field to expand vertically
          textAlignVertical: TextAlignVertical.top, // Aligns text at the top
        ),
      ),
    );
  }
}
