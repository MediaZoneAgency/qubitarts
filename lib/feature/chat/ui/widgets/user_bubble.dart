import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/localization_cubit.dart';
import '../../../../core/theming/text_styles.dart';

class UserChatBubble extends StatelessWidget{
  const UserChatBubble({super.key, this.text, this.time});
final String? text;
  final String? time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 36.w,top: 16.h,bottom:39.h ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsetsDirectional.only(start: 13.w,top: 23.h,end: 15.w,bottom: 25.h),
            margin: EdgeInsetsDirectional.only(start:117.w,bottom:12.6.h ,end: 38.w),

            //width: 224.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.9.r),
                  bottomLeft: LocalizationCubit.get(context).locale == 'en'?Radius.circular(25.9.r):Radius.circular(4.3.r),
                  topRight: Radius.circular(25.9.r),
                  bottomRight: LocalizationCubit.get(context).locale == 'en'?Radius.circular(4.3.r):Radius.circular(25.9.r),
                ),
                color: const Color(0xffFFECEF)
            ),
            child: Text(text!,style: TextStyles.roboto15RegularRed,),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 117.w ),
            child: Text(time!,style: TextStyles.roboto13RegularGray,),
          )
        ],
      ),
    );
  }
}