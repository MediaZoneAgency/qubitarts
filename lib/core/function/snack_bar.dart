import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void showSnackBar(
    {required BuildContext context,
    required String text,
    Color? color,
    TextStyle? style}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      //margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      duration: const Duration(seconds: 2),
      content: Center(
        child: Text(
          text,
          style: style,
        ),
      ),
      backgroundColor: color ?? Colors.black,
    ),
  );
}
