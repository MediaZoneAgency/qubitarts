import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/feature/print-out/logic/print_out_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/app_text_button.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/service_request_card.dart';

class PrintOut5  extends StatelessWidget{
  const PrintOut5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE9E9E9),
        body: BlocBuilder<PrintOutCubit,PrintOutState>(
  builder: (context, state) {
    return Container(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 25.w),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/website-background.png',
                  ),
                  fit: BoxFit.cover)),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.start, // Center-align the text
                  text: TextSpan(
                      style:  TextStyle(
                        fontSize: 60.sp, // Base font size
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: S.of(context).Finally,
                          style: TextStyle(
                            fontWeight: FontWeight.w300, // White color for "Finally"
                          ),
                        ),
                        TextSpan(
                          text: S.of(context).We,
                          style: TextStyle(
                            fontWeight: FontWeight.w300, // White color for "we"
                          ),
                        ),
                        TextSpan(
                          text: S.of(context).have,
                          style: TextStyle(
                            fontWeight: FontWeight.w500, // White color for "have"
                          ),
                        ),
                        TextSpan(
                          text: S.of(context).Finished,
                          style: TextStyle(
                            fontWeight: FontWeight.w500, // Pink color for "Finished"
                          ),
                        )]),
                )
                ,
                ServiceRequestCard(
                  padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 30.h),
                  id: 1.toString(),
                  title: PrintOutCubit.get(context).printoutRequestModel.type!,
                  startDate: DateFormat('dd MMM yyyy').format((PrintOutCubit.get(context).printoutRequestModel.createdTime!)).toString()??"",
                  status: PrintOutCubit.get(context).printoutRequestModel.status!,
                  stages: const ["UI UX", "Development", "Testing", "Publish"],
                  stageDates: const ["25/1", "30/1", "12/2", "25/3"],
                )
                ,     Padding(
                  padding: EdgeInsetsDirectional.only(start: 9.w,bottom: 70.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Text('Request no. 573',style: TextStyles.lato18WhiteRegular.copyWith(fontSize: 17.7.sp),),
                      verticalSpace(16),
                      //Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when ',style: TextStyles.lato18WhiteRegular.copyWith(fontSize: 17.7.sp),)
                    ],),
                ),
                Center(child: AppTextButton(buttonText: S.of(context).BackToHome, textStyle: TextStyles.lato18WhiteRegular.copyWith(fontSize: 16.sp), onPressed: (){
                  context.pushNamedAndRemoveUntil(Routes.navigationBar, predicate: (Route<dynamic> route) { return false; });
                },backgroundColor: Colors.white10,buttonHeight: 55.h,buttonWidth: 199.w,borderRadius: 48.r,)),
                verticalSpace(11)
              ]),
        );
  },
));
  }
}