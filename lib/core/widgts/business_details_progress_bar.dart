
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';

class BusinessDetailsProgressBar extends StatelessWidget {
  final int currentPageIndex;
  final int totalPages;

  final double width;

  const BusinessDetailsProgressBar({
    Key? key,
    required this.currentPageIndex,
    required this.totalPages, required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 15.h),
      child: Column(children: [
      // Align(
      //   alignment: Alignment.topLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 32.0),
      //     child:
      //         Text(customText, style: TextStyles.font9DarkBlackBold),
      //   ),
      // ),
        if (currentPageIndex < totalPages)Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            ...List.generate(totalPages, (index) {
              return AnimatedContainer(duration: Duration(milliseconds: 300)
              ,
                height: 3.08.h,
                width: width,
                margin:EdgeInsets.symmetric(horizontal: 3.w),
                decoration: BoxDecoration(
                  color: index <= currentPageIndex
                      ? ColorsManager.lightGray
                      : ColorsManager.typographyDark20, // Filled and unfilled stages
                  borderRadius: BorderRadius.circular(4.r),
                ),
              );
            }),


          ],
        )
      ]),
    );
  }
}
