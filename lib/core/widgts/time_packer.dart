import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theming/colors.dart';

class CustomTimePacker extends StatelessWidget {
  const CustomTimePacker({
    super.key,
    required this.selectDate, required this.selectedDate,
  });
  final String selectedDate;
 // final RequestMeeting widget;
  final Function (DateTime selectedDate)selectDate;
  @override
  Widget build(BuildContext context) {
    return Container(height:45.h,width:232.w,decoration: BoxDecoration(border: Border.all(color: ColorsManager.boarderShadowColor),color:Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(5.3.r )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Text(selectedDate,style: TextStyle(fontSize: 10.sp,color: Color(0xFF9D9D9D)),),
          horizontalSpace(30.w),
          IconButton(onPressed: (){
            showDatePicker(

              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2024),
              lastDate: DateTime(2035),
            ).then((selectedDate) {
              selectDate(selectedDate!);
            });
          }, icon: Icon(Icons.keyboard_arrow_up_outlined,color: Color(0xff141212),size: 15.sp,))
        ],),
    );
  }
}