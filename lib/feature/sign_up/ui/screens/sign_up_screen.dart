import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/error/error_handler.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/core/helpers/spacing.dart';
import 'package:qubitarts/core/routing/routes.dart';
import 'package:qubitarts/core/theming/colors.dart';
import 'package:qubitarts/core/theming/text_styles.dart';
import 'package:qubitarts/core/widgts/app_text_button.dart';
import 'package:qubitarts/feature/sign_up/ui/widgets/signup_States.dart';

import '../../../../core/theming/font_weight.dart';
import '../../../../generated/l10n.dart';
import '../widgets/signup_container.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.grayWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        child: ListView(children: [
          Padding(
            padding:  EdgeInsetsDirectional.only(top: 27.h,start:101.w,bottom: 38.h ),
            child: Text(S.of(context).CreateAccount,style: TextStyles.lato26RegularDarkBlack,),
          ),
          SignUPContainer(),
      verticalSpace(11.h),
      Container(height: 186.h,width: 367.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(34.r),color: ColorsManager.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Padding(
            padding:  EdgeInsetsDirectional.only(top: 23.h,bottom: 18.h),
            child: Text(S.of(context).SIGNIN,style: TextStyles.lato20ExtraBoldBlack,),
          ),
            Text(S.of(context).Alreadyhaveanaccount,style: TextStyles.poppins14MediumPurple,),
            verticalSpace(8.5.h),
            AppTextButton(borderRadius: 13.r,buttonHeight: 42.4.h,buttonWidth: 261.w,backgroundColor: Color(0xffEDEDED),buttonText: S.of(context).Login, textStyle:TextStyles.poppins14MediumPurple.copyWith(color: Color(0xff331D4C),fontWeight: FontWeightHelper.extraBold), onPressed: () { context.pushNamed(Routes.loginScreen); },)
          ],),)
        ,]
        ),
      ),
    );
  }
}
