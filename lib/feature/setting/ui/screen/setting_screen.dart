import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/core/localization/localization_cubit.dart';
import 'package:qubitarts/core/theming/colors.dart';
import 'package:qubitarts/core/theming/text_styles.dart';

import '../../../../core/db/cached_app.dart';
import '../../../../core/db/cash_helper.dart';
import '../../../../core/routing/routes.dart';
import '../../../../generated/l10n.dart';
import '../../../profile/logic/profile_cubit.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: Padding(
        padding: EdgeInsetsDirectional.only(top: 25.88.h, start: 26.56.w),
        child: ListView(
          children: [
            buildSettingContainer(S.of(context).Settings, const Icon(Icons.arrow_back_outlined),(){context.pop();}),
            // buildSettingContainer(S.of(context).Notifications,
            //     SvgPicture.asset('assets/icons/notification@3x.svg'),(){}),
            // buildSettingContainer(
            //     S.of(context).RateApp, SvgPicture.asset('assets/icons/star@3x.svg'),(){}),
            buildSettingContainer(
                S.of(context).Dark, SvgPicture.asset('assets/icons/dark-mode@3x.svg'),(){}),
            BlocBuilder<LocalizationCubit,LocalizationState>(
  builder: (context, state) {
    return buildSettingContainer(
                S.of(context).Language, Text(S.of(context).Eng,style: TextStyles.inter16LightBlack,),(){LocalizationCubit.get(context).toggleLanguage();});
  },
),
            buildSettingContainer(S.of(context).PrivacyPolicy,
                SvgPicture.asset('assets/icons/privacy@3x.svg'),(){}),
            buildSettingContainer(S.of(context).TermsandConditions,
                SvgPicture.asset('assets/icons/terms and policy@3x.svg'),(){}),
            // buildSettingContainer(
            //     S.of(context).FeedBack, SvgPicture.asset('assets/icons/feedback@3x.svg'),(){}),
            // buildSettingContainer(
            //     S.of(context).CookiesPolicy, SvgPicture.asset('assets/icons/cookies@3x.svg'),(){}),
            BlocBuilder<ProfileCubit, ProfileState>(
  builder: (context, state) {
    return buildSettingContainer(
                S.of(context).Logout, SvgPicture.asset('assets/icons/logout@3x.svg'),()async{
              ProfileCubit.get(context).signOut();
              await  CashHelper.clear();
              CachedApp.clearCache();
              context.pushNamedAndRemoveUntil(Routes.loginScreen, predicate: (Route<dynamic> route) { return false; });
            });
  },
),
          ],
        ),
      ),
    );
  }

  Container buildSettingContainer(String title, Widget icon,Function() onPressed) {
    return Container(
      height: 47.h,
      margin: EdgeInsets.only(bottom: 20.h),
      child: Row(
        children: [
          IconButton(
              onPressed: () {onPressed();},
              padding: EdgeInsetsDirectional.only(end: 17.w),
              icon: icon),
          Text(
            title,
            style: TextStyles.notoSans17MediumBlack,
          ),

        ],
      ),
    );
  }
}
