import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpWith extends StatelessWidget {
  const SignUpWith({
    super.key, required this.background, required this.image, required this.text, required this.textStyle,
  });
  final Color background;
  final TextStyle textStyle;
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.only(left: 6.5.w),
        height:33.4.h,width: 217.6.w,decoration: BoxDecoration(color: background,borderRadius: BorderRadius.circular(7.r)),child: Row(
        children: [
          Image.asset(image,height: 22.h,width: 22.w,),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 39.w),
            child: Text(text,style: textStyle,),
          ),
        ],
      ),),
    );
  }
}