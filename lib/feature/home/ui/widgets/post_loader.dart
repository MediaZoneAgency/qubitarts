import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/spacing.dart';
import 'package:qubitarts/core/theming/text_styles.dart';
import 'package:qubitarts/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/assets/images.dart';
import '../../../../core/theming/colors.dart';

class PostLoader extends StatelessWidget {
  const PostLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        containersColor: ColorsManager.boarderShadowColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 13.h),
          child: Container(
            decoration: BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.circular(21.4.r)),
            width: 304.44.h,
            //height: 367.h,
            child: Column(children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: 8.3.h, start: 17.w, end: 17.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 23.r,
                          child: Image.asset('assets/images/logo.png'),
                        ),
                        horizontalSpace(14.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Qubitarts',
                              style: TextStyles.lato20BoldBlack
                                  .copyWith(fontSize: 15.5.sp),
                            ),
                            Text(
                              '@admin',
                              style: TextStyles.inter6RegularBlack,
                            ),
                          ],
                        )
                      ],
                    ),
                    Icon(Icons.more_horiz_sharp)
                  ],
                ),
              ),
              verticalSpace(7.h),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 23.w,
                  end: 17.w,
                ),
                child: Text(
                  'title',
                  style: TextStyles.inter6RegularBlack
                      .copyWith(fontSize: 9.07.sp, color: Colors.black),
                ),
              ),
              verticalSpace(7.h),
              Container(
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(14.5.r),
                ),
                height: 251.h,
                width: 270.w,
                child: SizedBox(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      ImagesManager.fav,
                      width: 25.w,
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          ImagesManager.share,
                          width: 15.w,
                          height: 15.h,
                        ),
                        horizontalSpace(6.5.w),
                        Image.asset(
                          ImagesManager.save,
                          width: 15.w,
                          height: 15.h,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
