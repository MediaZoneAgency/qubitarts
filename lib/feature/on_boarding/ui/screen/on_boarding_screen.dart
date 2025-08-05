import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/core/helpers/spacing.dart';
import 'package:qubitarts/core/routing/routes.dart';
import 'package:qubitarts/core/theming/colors.dart';
import 'package:qubitarts/core/widgts/app_text_button.dart';
import 'package:qubitarts/feature/on_boarding/ui/widgets/slides.dart';

import '../../../../core/assets/images.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/background_widget.dart';
import '../../../../generated/l10n.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Background(backgroundImage: ImagesManager.background,),
          SafeArea(
              child: ListView(

            children: [
              Padding(
                padding:EdgeInsetsDirectional.only(top: 25.h,start: 154.w,bottom: 62.5.h),
                child: Text(
                  S.of(context).Welcome,
                  style: TextStyles.inter20LightWhite,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 18.w,bottom: 6.h),
                child: Text(S.of(context).Choose,style: TextStyles.inter22RegularWhite.copyWith(color: Colors.white.withOpacity(0.11)),),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 18.w,bottom: 18.h),
                child: Text(S.of(context).WhatYouNeed,style: TextStyles.inter40BoldWhite,),
              ),
              SizedBox(

                height: 364.h,
                child:Slides(),
              ),
              verticalSpace(25.h),
              Center(child: AppTextButton(buttonText: S.of(context).Skip, textStyle: TextStyles.lato18SemiBoldDarkBlack, onPressed: (){context.pushReplacementNamed(Routes.signUpScreen);},backgroundColor:ColorsManager.gray20,borderRadius: 28.6.r,buttonHeight: 49.h,buttonWidth: 156.w,))
            ],
          ))
        ],
      ),
    );
  }
}
