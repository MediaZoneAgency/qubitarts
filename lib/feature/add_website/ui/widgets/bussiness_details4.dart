

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/feature/add_website/ui/widgets/head_page.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/choose_one.dart';
import '../../../../core/widgts/time_packer.dart';
import '../../../../generated/l10n.dart';
import '../../logic/add_website_cubit.dart';

class BusinessDetails4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.only(start: 18.w, top: 39.h, end: 16.w),
    child: ListView(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        HeadPage(title: S.of(context).Website,),
        Text(
        S.of(context).Doassistancewithdomainregistration,
        style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
        ),
        horizontalSpace(17.5.h),

        BlocBuilder<AddWebsiteCubit, AddWebsiteState>(
        builder: (context, state) {
        return ChooseBetween(selectedValue:AddWebsiteCubit.get(context).needAssistant, onSelect: (String isYesSelected) {  AddWebsiteCubit.get(context).toggleStateAssistant(isYesSelected);}, choices: ['Need Assistance','don\'t Need Assistance'],);
        },
        ),
        verticalSpace(36.h),
        Divider(
        color: Colors.black.withOpacity(0.1),
        thickness: 1,
        ),
          verticalSpace(26.h),
          Text(
            S.of(context).Whattimelinelaunchingthewebsite,
            style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 17.8.sp),
          ),
          Text(S.of(context).Choosedeadline,style: TextStyles.inter9SemiBoldBlue.copyWith(color: Color(0xff44434375).withOpacity(0.44)),),
        verticalSpace(13.h),
          BlocBuilder<AddWebsiteCubit, AddWebsiteState>(
          builder: (context, state) {
        return CustomTimePacker(selectDate: (DateTime selectedDate) { AddWebsiteCubit.get(context).selectLaunchDate(selectedDate); }, selectedDate: AddWebsiteCubit.get(context).selectedDeadlineDate,);
          },
        )
        ]),
      ],
    ),);
  }}