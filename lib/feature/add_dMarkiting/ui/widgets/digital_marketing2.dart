import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/feature/add_dMarkiting/logic/dmarketing_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/time_packer.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';
import 'custom_range_slider.dart';

class DMarketing2 extends StatelessWidget {
  const DMarketing2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 18.w, top: 39.h, end: 19.w),
      child: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeadPage(
              title: S.of(context).DigitalMarketing,
            ),
            Text(
              S.of(context).Whatisyourbudgetfordigitalmarketingefforts,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
            ),
            BlocBuilder<DmarketingCubit, DmarketingState>(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(
                      end: 25.0.w, top: 12.h, bottom: 20.h),
                  child: CustomRangeSlider(
                    currentRangeValues:
                        DmarketingCubit.get(context).currentRangeValues,
                    onChanged: (RangeValues values) {
                      DmarketingCubit.get(context).changeRangeValues(values);
                    },
                  ),
                );
              },
            ),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            verticalSpace(26),
            Text(
              S.of(context).WhattimelinelaunchingtheProject,
              style:
                  TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 17.8.sp),
            ),
            Text(
              S.of(context).Choosedeadline,
              style: TextStyles.inter9SemiBoldBlue
                  .copyWith(color: Color(0xff44434375).withOpacity(0.44)),
            ),
            verticalSpace(13),
            BlocBuilder<DmarketingCubit, DmarketingState>(
              builder: (context, state) {
                return CustomTimePacker(
                  selectDate: (DateTime selectedDate) {
                    DmarketingCubit.get(context).selectLaunchDate(selectedDate);
                  },
                  selectedDate:
                      DmarketingCubit.get(context).selectedDeadlineDate,
                );
              },
            )
          ]),
        ],
      ),
    );
  }
}
