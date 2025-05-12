import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/feature/print-out/logic/print_out_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/Custom_Choose.dart';
import '../../../../core/widgts/time_packer.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';

class PrintOut3 extends StatelessWidget {
  const PrintOut3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: 18.w, top: 39.h, end: 19.w, bottom: 19.h),
      child: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadPage(title: S.of(context).PrintOuts,),
            Text(
              S.of(context).SizeRequirements,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
            ),
            verticalSpace(7),
            Padding(
              padding: EdgeInsetsDirectional.only(end: 130.0.w, top: 10.h),
              child: BlocBuilder<PrintOutCubit,PrintOutState>(
                builder: (context, state) {
                  return CustomChooseList(customText: PrintOutCubit.get(context).selectedSize==''?S.of(context).ChooseSize:PrintOutCubit.get(context).selectedSize,
                    onSelected: (String value) {
                      PrintOutCubit.get(context).toggleSelectedSize(value);
                    },
                    list: PrintOutCubit.get(context).sizes,);
                },
              ),
            ),
            verticalSpace(32),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            Padding(
              padding:  EdgeInsets.only(top: 16.0.h,bottom: 7.h),
              child: Text(
                S.of(context).WhattimelinelaunchingtheProject,
                style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
              ),
            ),
            Text(S.of(context).Choosedeadline,
                style: TextStyles.inter9SemiBoldBlue
                    .copyWith(color: Color(0xff44434375).withOpacity(0.44))),
            verticalSpace(24.h),
            BlocBuilder<PrintOutCubit,PrintOutState>(
              builder: (context, state) {
                return CustomTimePacker(selectDate: (DateTime selectedDate) { PrintOutCubit.get(context).selectLaunchDate(selectedDate); }, selectedDate: PrintOutCubit.get(context).selectedDeadlineDate);
              },
            )
          ],)
      ],),
    );
  }
}