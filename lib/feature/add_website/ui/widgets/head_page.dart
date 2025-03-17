import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';

class HeadPage extends StatelessWidget {
  const HeadPage({
    super.key, required this.title,
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.inter23MediumBlack,
        ),
        verticalSpace(10.h),
        SizedBox(
          width: 161.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).stStep,
                style: TextStyles.inter9SemiBoldBlue,
              ),
              Text(
                S.of(context).BusinessDetails,
                style: TextStyles.inter9SemiBoldBlue,
              )
            ],
          ),
        ),
        verticalSpace(36.h),
      ],
    );
  }
}