
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/core/theming/colors.dart';
import 'package:qubitarts/core/widgts/app_text_form_field.dart';
import 'package:qubitarts/feature/forget_password/logic/forget_password_cubit.dart';

import '../../../../core/function/snack_bar.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/app_text_button.dart';
import '../../../../generated/l10n.dart';

class ForgetPasswordScreen extends StatefulWidget{
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController email =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
    BlocBuilder<ForgetPasswordCubit,ForgetPasswordState>(

      builder: (context,state) {
        if(state is SendEmailLoadingState){return const Center(child: CircularProgressIndicator());}
        else if (state is SendEmailSuccessState){
          context.pop();
          showSnackBar(
            context: context,
            text: S.of(context).EmailSendCheckyourEmail,
          );
        }
        return SafeArea(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(S.of(context).ForgotPassword,style: TextStyles.lato28DarkBlackBold.copyWith(color: Color(0xff2A2A2A)),),
            verticalSpace(10),
            Text(S.of(context).ChooseRecovery,style: TextStyles.lato20grayRegular,textAlign: TextAlign.center,),
            verticalSpace(37),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: AppTextFormField(hintText: S.of(context).example,controller: email,),
            ),
            verticalSpace(20),
            AppTextButton(buttonWidth: 100,backgroundColor: ColorsManager.gray20,buttonText: S.of(context).Done, textStyle:TextStyles.inter17BoldBlack, onPressed: (){
              ForgetPasswordCubit.get(context).sendEmailToReset(email.text);
            })
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [AppTextButton(
            //   backgroundColor: Color(0xff1B1B1B),
            //   borderRadius: 30.r,
            //   buttonHeight: 47.h,
            //   buttonWidth: 122,
            //   buttonText: S.of(context).Email, textStyle: TextStyles.lato18WhiteRegular,
            //     onPressed: () {  },),
            //   horizontalSpace(17),
            //   AppTextButton(
            //     backgroundColor: Color(0xff1B1B1B),
            //     borderRadius: 30.r,
            //     buttonHeight: 47.h,
            //     buttonWidth: 122,
            //     buttonText: S.of(context).Phone, textStyle: TextStyles.lato18WhiteRegular,
            //     onPressed: () {  context.pushNamed(Routes.phoneRecover);},)
            // ],)
          ],),);
      }
    ),
    );
  }
}