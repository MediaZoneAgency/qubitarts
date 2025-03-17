import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';

class RequestBrief extends StatelessWidget {
  const RequestBrief({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Request Brief',style: TextStyles.lato20BoldBlack.copyWith(fontSize: 17.sp),),
        verticalSpace(4.h),
        SizedBox(width:278.w,child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',style: TextStyles.lato18SemiBoldDarkBlack.copyWith(fontSize: 10.sp),))
      ],);
  }
}