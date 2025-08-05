import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';

class HelloContainer extends StatelessWidget {
  const HelloContainer({
    super.key, required this.name,
  });
final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 285.w,
          //height: 89.h,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${S.of(context).Hello} ${name},',
                  style: TextStyles.lato44DarkBlackBold,
                ),
                TextSpan(
                  text: S.of(context).Nicetomeetyou,
                  style: TextStyles.lato44DarkBlackBold.copyWith(color: Color(
                      0x6e1a186e)),
                ),
              ],
            ),
          ),
        ),

        verticalSpace(29.5.h),
        Row(children: [],)
        // Row(
        //   children: [
        //     Text(S.of(context).Createdby,
        //         style: TextStyles.lato12grayRegular),
        //     horizontalSpace(3.w),
        //     CircleAvatar(
        //       radius: 8.5.r,
        //       child: Image.asset('assets/images/logo-mz.png'),
        //     ),
        //     horizontalSpace(2.w),
        //     Text(S.of(context).MediZone, style: TextStyles.lato12grayRegular.copyWith(color: Color(0xff46589C),fontWeight: FontWeightHelper.bold)),
        //   ],
        // )
      ],
    );
  }
}