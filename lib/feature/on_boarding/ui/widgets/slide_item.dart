import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/spacing.dart';

import '../../../../core/theming/font_weight.dart';
import '../../../../core/theming/text_styles.dart';

class SlideItem extends StatelessWidget {
  const SlideItem({
    super.key, required this.background, required this.title, required this.description, required this.textColor,
  });
  final Color background;
  final String title;
  final Color textColor;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 42.w,bottom: 18.h,end: 42.w),
      child: Container(

        height: 364.h,
       // width: 300.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(33.r),
            color:background ),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpace(26),
            SizedBox(width:200.w,child: Text(textAlign: TextAlign.center,title,style: TextStyles.inter28ExtraBoldBlack.copyWith(color: textColor))),
              verticalSpace(26),
            SizedBox(
              width: 260.w,
              child: Text(textAlign: TextAlign.center,description,
                style: TextStyles.inter28ExtraBoldBlack.copyWith(fontSize: 24.sp,fontWeight: FontWeightHelper.bold,color: textColor),),
            ),
          ]
            ,),
        ),),
    );
  }
}