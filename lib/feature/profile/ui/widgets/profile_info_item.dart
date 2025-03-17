import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';

class ProfileInfoItem extends StatelessWidget {
  const ProfileInfoItem({
    super.key,
    required this.title,
    required this.hintText,
    this.preIcon,
    this.lastIcon,
  });
  final String title;
  final String hintText;
  final String? preIcon;
  final String? lastIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 32.0.w, bottom: 16.3.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.poppins17SemiBoldBlack.copyWith(fontSize: 12.sp),
          ),
          verticalSpace(9.8.h),
          Container(
            width: 268.w,
            padding: EdgeInsetsDirectional.only(
                start: 13.w, top: 12.h, bottom: 12, end: 13.w),
            decoration: BoxDecoration(
                border:
                Border.all(color: const Color(0xffF1ECEC), width: 0.82.w),
                borderRadius: BorderRadius.circular(9.83.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    preIcon != null
                        ? Image.asset(
                      preIcon!,
                      width: 20.w,
                      height: 20.h,
                    )
                        : SizedBox(),
                    horizontalSpace(9.8.h),
                    Text(
                      hintText,
                      style: TextStyles.poppins12RegularBlack
                          .copyWith(color: Color(0xffABABAB)),
                    ),
                  ],
                ),
                lastIcon != null
                    ? Image.asset(
                  lastIcon!,
                  width: 20.w,
                  height: 20.h,
                )
                    : SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}