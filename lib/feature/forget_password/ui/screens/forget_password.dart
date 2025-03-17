
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/extensions.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/app_text_button.dart';
import '../../../../generated/l10n.dart';

class ForgetPasswordScreen extends StatelessWidget{
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
    SafeArea(child:
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(S.of(context).ForgotPassword,style: TextStyles.lato28DarkBlackBold.copyWith(color: Color(0xff2A2A2A)),),
        verticalSpace(10),
        Text(S.of(context).ChooseRecovery,style: TextStyles.lato20grayRegular,textAlign: TextAlign.center,),
        verticalSpace(37),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [AppTextButton(
          backgroundColor: Color(0xff1B1B1B),
          borderRadius: 30.r,
          buttonHeight: 47.h,
          buttonWidth: 122.w,
          buttonText: S.of(context).Email, textStyle: TextStyles.lato18WhiteRegular,
            onPressed: () {  },),
          horizontalSpace(17),
          AppTextButton(
            backgroundColor: Color(0xff1B1B1B),
            borderRadius: 30.r,
            buttonHeight: 47.h,
            buttonWidth: 122.w,
            buttonText: S.of(context).Phone, textStyle: TextStyles.lato18WhiteRegular,
            onPressed: () {  context.pushNamed(Routes.phoneRecover);},)
        ],)
      ],),),
    );
  }
}