import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/app_text_button.dart';

class MeetingDetails extends StatelessWidget {
  const MeetingDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 18.h),
      //height: 165.h,
      width: 327.w,
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(offset: Offset(0, 4),color: Color(
              0x12000000),blurRadius: 4)],
          borderRadius: BorderRadius.circular(24.r),
          color: Color(0xff383838)),
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: 19.h, start: 19.w,bottom: 14.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Meeting',
              style: TextStyles.lato10SemiBoldDarkWhite,
            ),verticalSpace(6.h),
            Text('Next Meeting',
                style: TextStyles.lato10SemiBoldDarkWhite.copyWith(fontSize: 17.8.sp,color: Color(0xffeaeaea))),
            Text('8',
                style: TextStyles.lato10SemiBoldDarkWhite.copyWith(fontSize: 48.5.sp,color: Color(0xffeaeaea))),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('February\n2024',style:TextStyles.lato10SemiBoldDarkWhite.copyWith(fontSize: 14.sp,color: Color(0xffeaeaea)),),AppTextButton(buttonText: 'Change meeting', textStyle: TextStyles.lato10SemiBoldDarkWhite.copyWith(fontSize: 14.sp,color: Color(0xffeaeaea)), onPressed: () {  },buttonWidth: 150.w,buttonHeight: 25.h,)],)
          ],
        ),
      ),
    );
  }
}