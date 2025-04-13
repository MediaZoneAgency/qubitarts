import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';

class ServiceNameAndState extends StatelessWidget {
  const ServiceNameAndState({
    super.key, required this.title, required this.startDate, required this.status,
  });
  final String title;
  final String startDate;
  final String status;
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
                  title,
                  style: TextStyles.lato18SemiBoldDarkBlack
                      .copyWith(fontSize: 20.sp),
                ),
                Text(
                  '${S.of(context).StartDate} $startDate',
                  style: TextStyles.lato18SemiBoldDarkBlack.copyWith(
                      fontSize: 10.sp, color: Colors.black.withOpacity(0.55)),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 17.w,vertical: 8.h),
              child: Text(status,style: TextStyles.lato18SemiBoldDarkBlack.copyWith(fontSize: 10.7.sp),),
              decoration: BoxDecoration(
                  color: Color(0xffFEDC32),
                  borderRadius: BorderRadius.circular(20.r)),
            )
          ]),
    );
  }
}