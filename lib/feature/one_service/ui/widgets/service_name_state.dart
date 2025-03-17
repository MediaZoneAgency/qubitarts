import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';

class ServiceNameAndState extends StatelessWidget {
  const ServiceNameAndState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 32.w),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Website Design\nSystem',
                  style: TextStyles.lato18SemiBoldDarkBlack
                      .copyWith(fontSize: 20.sp),
                ),
                Text(
                  'Start Date',
                  style: TextStyles.lato18SemiBoldDarkBlack.copyWith(
                      fontSize: 10.sp, color: Colors.black.withOpacity(0.55)),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 17.w,vertical: 8.h),
              child: Text(S.of(context).InProgress,style: TextStyles.lato18SemiBoldDarkBlack.copyWith(fontSize: 10.7.sp),),
              decoration: BoxDecoration(
                  color: Color(0xffFEDC32),
                  borderRadius: BorderRadius.circular(20.r)),
            )
          ]),
    );
  }
}