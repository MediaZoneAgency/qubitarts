import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomServiceImage extends StatelessWidget {
  const CustomServiceImage({
    super.key, required this.serviceImage,
  });
  final  String serviceImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 27.w),
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(serviceImage),
          ),
          borderRadius: BorderRadius.circular(22.55.r),
          color: Colors.white.withOpacity(0.1)),
      width: 324.w,
      height: 211.h,
      child: SizedBox(),
      // Adjust transparency
    );
  }
}