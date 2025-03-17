
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/extensions.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/app_text_button.dart';
import '../../../../generated/l10n.dart';

class PhoneRecoveryScreen extends StatelessWidget{
  const PhoneRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
    SafeArea(child:
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).Phone,style: TextStyles.lato28DarkBlackBold.copyWith(fontSize: 20.sp,color: Color(0xff2A2A2A)),),
        Text('011*******99',style: TextStyles.lato28DarkBlackBold.copyWith(fontSize: 20.sp,color: Color(0xff2A2A2A)),),
        verticalSpace(25),
        Text(S.of(context).RecoverySent,
          style: TextStyles.lato28DarkBlackBold.copyWith(fontSize: 20.sp,color: Color(0xff2A2A2A)),textAlign: TextAlign.center,),
        verticalSpace(37),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [AppTextButton(
            backgroundColor: Color(0xff1B1B1B),
            borderRadius: 30.r,
            buttonHeight: 47.h,
            buttonWidth: 122.w,
            buttonText: S.of(context).Resend, textStyle: TextStyles.lato18WhiteRegular, onPressed: () {
              context.pushNamed(Routes.resetPassword);
          },),
            horizontalSpace(17),
            AppTextButton(
              backgroundColor: Color(0xff1B1B1B),
              borderRadius: 30.r,
              buttonHeight: 47.h,
              buttonWidth: 122.w,
              buttonText: S.of(context).Login, textStyle: TextStyles.lato18WhiteRegular, onPressed: () {
              context.pushNamed(Routes.loginScreen);
            },)
          ],)
      ],),),
    );
  }
}