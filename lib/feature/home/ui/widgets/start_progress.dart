import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/text_styles.dart';

class StartProgress extends StatelessWidget {
  const StartProgress({
    super.key,
    required this.startDate, required this.title, this.titleTextStyle, this.textStyle,
  });
  final String title;
  final String startDate;
  final TextStyle? titleTextStyle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleTextStyle??TextStyles.lato18SemiBoldDarkBlack.copyWith(fontSize: 6.sp),
        ),
        Text(
          startDate,
          style: textStyle??TextStyles.lato18SemiBoldDarkBlack.copyWith(fontSize: 16.sp),
        )
      ],
    );
  }
}