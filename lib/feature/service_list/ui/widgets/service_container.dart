import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/extensions.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';

class CustomServiceContainer extends StatelessWidget {
  const CustomServiceContainer({
    super.key, required this.title, required this.description, required this.image, required this.route,
  });
  final String title;
  final String description;
  final String image;
  final String route;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.pushNamed(route);
  //    Navigator.of(context).push(
  //    MaterialPageRoute(
  //      builder: (BuildContext context) => BlocProvider(
  //create: (context) => ServiceCubit(),
  //      child: ServicesScreen(),
  //     ),
  //    ),
  //  );
        },
      child: Container(
        margin: EdgeInsets.only(right: 6.w),
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(19.5.r)),
        padding: EdgeInsets.only(left: 12.w,top: 18.h,bottom: 8.h,right: 7.w),

        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              title,
              style:
              TextStyles.lato20BoldBlack.copyWith(fontSize: 14.77.sp),
            ),
            verticalSpace(3.h),
            Text(description,
              style: TextStyles.inter6RegularBlack.copyWith(fontSize: 3.sp),),
            verticalSpace(5.h),
            Container(
              height: 60.h,
              width: 120.w,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover),borderRadius: BorderRadius.circular(10.r)),
                child: SizedBox())
          ],
        ) ,),
    );
  }
}