import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/app_text_form_field.dart';
import '../../../post_details/ui/widget/suffixIcons.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    required this.isTyping,
    required this.controller,
    required this.backgroundColor, this.sendMessage,
  });

  final bool isTyping;
  final Function()? sendMessage;
  final TextEditingController controller;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(color: Colors.white,boxShadow: [
        BoxShadow(
            offset: Offset(0, -1.08),
            color: Colors.black12,
            spreadRadius: 0,
            blurRadius:1.08
        )
      ]),
      child: Row(
        children: [
          IconButton(
              onPressed: () {}, icon: isTyping?Icon(Icons.add_box_outlined,color: Color(0xff646464),size: 21.sp,weight: 1.34,):Icon(Icons.camera_alt_outlined)),
          Padding(
            padding: EdgeInsets.only(top: 8.0.h,bottom: 14.h),
            child: AppTextFormField(
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 11.h),
              controller: controller,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffDDDDDD),
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(30.0.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsManager.lightGray,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(30.0.r),
              ),
              suffixIcon: isTyping?SizedBox():SuffixIcon(),
              hintText: 'Ask any thing',
              hintStyle: TextStyles.lato17MediumBlack.copyWith(fontSize: 13.4.sp),
              backgroundColor:backgroundColor,
              // height: 34.h,
              width: 292.w,
            ),
          ),
          isTyping?IconButton(onPressed: sendMessage, icon: Icon(Icons.send_outlined,color: Color(0xff646464),size: 18.sp,)):SizedBox()
        ],
      ),
    );
  }
}