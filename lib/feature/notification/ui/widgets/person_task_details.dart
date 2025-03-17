
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class PersonTaskDetails extends StatelessWidget {
  final String name;
  final String job;
  final String profileImage;
  final String date;
  const PersonTaskDetails({super.key, required this.name, required this.job, required this.profileImage, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                  //backgroundColor: Colors.white,
                  radius: 30.r,
                  backgroundImage:
                      AssetImage(profileImage)),
              horizontalSpace(20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyles.helveticaNeue14GrayRegular.copyWith(color: Colors.black)),
                  verticalSpace(7.h),
                  Container(
                      padding: EdgeInsets.only(
                          top: 5.h, left: 6.w, right: 8.w, bottom: 5.h),
                      width: 60.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                          color: ColorsManager.white.withOpacity(.1),
                          borderRadius: BorderRadius.circular(17.r),
                        //  border: Border.all(color: ColorsManager.darkGray)
                      ),
                      child: Text(job,style: TextStyles.helveticaNeue14GrayRegular.copyWith(color: Color(0xff1F8A15)),textAlign: TextAlign.center,),
                      ),
                ],
              ),
            ],
          ),
            Text(date,style: TextStyles.helveticaNeue14GrayRegular.copyWith(fontSize: 12.sp),)
        ],
      ),
    );
  }
}
