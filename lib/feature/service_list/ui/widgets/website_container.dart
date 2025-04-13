import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/error/error_handler.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/core/routing/routes.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';

class WebsiteContainer extends StatelessWidget {
  const WebsiteContainer({
    super.key, required this.onTap,
  });
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsets.only(left: 11.w, top: 20.h, bottom: 18.h, right: 14.w),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(19.5.r)),
        height: 134.h,
        width: 337.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).Website,
                  overflow: TextOverflow.clip,
                  style:
                      TextStyles.lato20BoldBlack.copyWith(fontSize: 28.77.sp),
                ),
                Text(
                  '',
                  style: TextStyles.inter6RegularBlack,
                )
              ],
            ),
            Image.asset(
              'assets/images/website.png',
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }
}
