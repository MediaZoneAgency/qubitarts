import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/theming/text_styles.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/line_progress.dart';
import '../../../home/ui/widgets/start_progress.dart';

class ServiceRequestCard extends StatelessWidget {
  final String id;
  final String title;
  final String startDate;
  final String status;
  final List<String> stages;
  final List<String> stageDates;
  final EdgeInsetsGeometry? padding;

  const ServiceRequestCard({
    Key? key,
    required this.id,
    required this.title,
    required this.startDate,
    required this.status,
    required this.stages,
    required this.stageDates, this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding??EdgeInsets.symmetric(horizontal: 27.w, vertical: 34.h),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 100, color: Color(0xffE2ECF5).withOpacity(0.03))
        ],
        color: Color(0xffE2ECF5).withOpacity(0.03),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xff76A5CF).withOpacity(0.2),
                child: Text(
                  id,
                  style: TextStyles.lato18SemiBoldDarkBlack
                      .copyWith(color: Colors.white,fontSize: 13.sp),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyles.lato18SemiBoldDarkBlack
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Icon(Icons.more_vert, color: Colors.white),
            ],
          ),
          verticalSpace(17.h),
          Row(
            children: [
              StartProgress(title: S.of(context).StartDate, startDate: startDate,titleTextStyle: TextStyles.lato14SemiBoldWhite.copyWith(fontSize: 6.sp,color: Colors.white54),textStyle: TextStyles.lato14SemiBoldWhite.copyWith(fontSize: 17.4.sp),),
              horizontalSpace(40.w),
              StartProgress(title:S.of(context).Status , startDate: status,titleTextStyle: TextStyles.lato14SemiBoldWhite.copyWith(fontSize: 6.sp,color: Colors.white54),textStyle: TextStyles.lato14SemiBoldWhite.copyWith(fontSize: 17.4.sp),)
            ],
          ),
          LineProgress(
            progress: 0.05,
            valueColor: Color(0xffCCFB67),
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(
                  'assets/images/imageteam.png',
                  height: 33.h,
                  width: 33.h,
                ),
              ),
              horizontalSpace(8.w),
              Text(
                S.of(context).TeamWork,
                style: TextStyles.lato14SemiBoldWhite
                    .copyWith(fontSize: 11.68.sp, color: Color(0xffE2E2E2)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
