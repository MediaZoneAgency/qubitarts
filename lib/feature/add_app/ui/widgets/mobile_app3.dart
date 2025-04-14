import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/widgts/custom_describtion_text_field.dart';
import 'package:qubitarts/feature/add_website/ui/widgets/head_page.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/choose_one.dart';
import '../../../../core/widgts/time_packer.dart';

import '../../../../generated/l10n.dart';
import '../../logic/apps_cubit.dart';

class MobileApps3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 18.w, top: 39.h, end: 16.w),
      child: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeadPage(title: S.of(context).MobileApp,),
            Text(
              S.of(context).WillprovidehighresolutionApplication,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.6.sp),
            ),
            horizontalSpace(17.5.h),

            BlocBuilder<AppsCubit, AppsState>(
              builder: (context, state) {
                return ChooseBetween(selectedValue:AppsCubit.get(context).isYes, onSelect: (String isYesSelected) {  AppsCubit.get(context).toggleStateYes(isYesSelected);}, choices: ['Yes','No'],);
              },
            ),
            verticalSpace(20),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            verticalSpace(26),
            Text(
              S.of(context).WhichplatformstargetiOSAndroidboth,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.8.sp,color: Color(0xff1F2429)),
            ),

        BlocBuilder<AppsCubit, AppsState>(
  builder: (context, state) {
    return ChooseBetween(selectedValue:AppsCubit.get(context).isIos,onSelect: (String isIosSelected) {  AppsCubit.get(context).toggleStatePlatform(isIosSelected);}, choices: ['ios','Android','Both'],);
  },
)
          ]),
        ],
      ),);
  }}