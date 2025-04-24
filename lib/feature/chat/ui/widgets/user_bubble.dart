import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/localization_cubit.dart';
import '../../../../core/theming/text_styles.dart';
import 'msg_bubble.dart';

class UserChatBubble extends StatelessWidget {
  const UserChatBubble({super.key, this.text, this.time});
  final String? text;
  final String? time;

  @override
  Widget build(BuildContext context) {
    final isEnglish = LocalizationCubit.get(context).locale == const Locale('en');

    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 36.w, end: 35.w, top: 16.h, bottom: 19.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          MessageBubble(
            text: text ?? '',
            backgroundColor: const Color(0xffFFECEF),
            textStyle: TextStyles.roboto15RegularRed,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.9.r),
              topRight: Radius.circular(25.9.r),
              bottomLeft: Radius.circular(isEnglish ? 25.9.r : 4.3.r),
              bottomRight: Radius.circular(isEnglish ? 4.3.r : 25.9.r),
            ),
            padding: EdgeInsetsDirectional.only(
              start: 13.w, top: 23.h, end: 15.w, bottom: 25.h,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            time ?? '',
            style: TextStyles.roboto13RegularGray,
          ),
        ],
      ),
    );
  }
}
