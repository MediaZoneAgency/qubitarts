import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/feature/add_website/ui/widgets/head_page.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/choose_one.dart';
import '../../../../core/widgts/time_packer.dart';

import '../../../../generated/l10n.dart';
import '../../logic/apps_cubit.dart';

class MobileApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 18.w, top: 39.h, end: 16.w),
      child: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeadPage(title: S.of(context).MobileApp,),
            Text(
              S.of(context).Doassistancewithdomainregistration,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
            ),
            horizontalSpace(17.5.h),

            BlocBuilder<AppsCubit, AppsState>(
              builder: (context, state) {
                return ChooseBetween(selectedValue:AppsCubit.get(context).needAssistant, onSelect: (String isYesSelected) {  AppsCubit.get(context).toggleStateAssistant(isYesSelected);}, choices: ['Need Assistance','Don\'t Need Assistance'],);
              },
            ),
            verticalSpace(20.h),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            verticalSpace(26.h),
            Text(
              'What is the timeline for launching the Application?',
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 17.8.sp),
            ),
            Text(S.of(context).Choosedeadline,style: TextStyles.inter9SemiBoldBlue.copyWith(color: Color(0xff44434375).withOpacity(0.44)),),
            verticalSpace(13.h),
            BlocBuilder<AppsCubit, AppsState>(
              builder: (context, state) {
                return CustomTimePacker(selectDate: (DateTime selectedDate) { AppsCubit.get(context).selectLaunchDate(selectedDate); }, selectedDate: AppsCubit.get(context).selectedDeadlineDate,);
              },
            )
          ]),
        ],
      ),);
  }}