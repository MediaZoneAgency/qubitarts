import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/localization_cubit.dart';
import '../../../../core/theming/text_styles.dart';
import 'msg_bubble.dart';

class SupportChatBubble extends StatelessWidget {
  const SupportChatBubble({super.key, this.text, this.time});
  final String? text;
  final String? time;

  @override
  Widget build(BuildContext context) {
    final isEnglish = LocalizationCubit.get(context).locale == const Locale('en');

    return Padding(
      padding: EdgeInsetsDirectional.only(top: 16.h, bottom: 19.h, ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: 23.r,
            child: Image.asset('assets/images/logo.png'),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7, // 70% of screen width
                ),

                child: MessageBubble(
                  text: text ?? '',
                  backgroundColor: const Color(0xffF5F5F5),
                  textStyle: TextStyles.roboto15RegularRed.copyWith(color: Colors.black),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.9.r),
                    topRight: Radius.circular(25.9.r),
                    bottomLeft: Radius.circular(isEnglish ? 4.3.r: 25.9.r ),
                    bottomRight: Radius.circular(isEnglish ?   25.9.r:4.3.r),
                  ),
                  padding: EdgeInsetsDirectional.only(
                    start: 13.w, top: 23.h, end: 15.w, bottom: 25.h,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 4.w),
                child: Text(
                  time ?? '',
                  style: TextStyles.roboto13RegularGray,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

