import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/text_styles.dart';

class SupportChatBubble extends StatelessWidget {
  const SupportChatBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 36.w,top: 16.h,bottom:39.h ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: 23.r,
            child: Image.asset('assets/images/logo.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(start: 13.w,top: 23.h,end: 15.w,bottom: 25.h),
                margin: EdgeInsetsDirectional.only(start: 16.w,bottom:12.6.h ),

                width: 269.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.9.r),
                      bottomLeft: Radius.circular(4.3.r),
                      topRight: Radius.circular(25.9.r),
                      bottomRight: Radius.circular(25.9.r),
                    ),
                    color: Color(0xffF5F5F5)
                ),
                child: Text('Hi Kitsbase, Let me know you need help and you can ask us any questions.',style: TextStyles.roboto15RegularRed.copyWith(color: Colors.black),),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 17.w ),
                child: Text('10:00 AM',style: TextStyles.roboto13RegularGray,),
              )
            ],
          ),
        ],
      ),
    );
  }
}