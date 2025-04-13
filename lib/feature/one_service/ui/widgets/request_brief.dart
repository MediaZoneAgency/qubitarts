import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';

class RequestBrief extends StatelessWidget {
  const RequestBrief({
    super.key, required this.brief,
  });
final String brief;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).RequestBrief,style: TextStyles.lato20BoldBlack.copyWith(fontSize: 17.sp),),
        verticalSpace(4.h),
        SizedBox(width:278.w,child: Text(brief,style: TextStyles.lato18SemiBoldDarkBlack.copyWith(fontSize: 10.sp),))
      ],);
  }
}