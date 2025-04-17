import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/spacing.dart';
import 'package:qubitarts/core/theming/text_styles.dart';
import 'package:qubitarts/core/widgts/app_text_button.dart';
import 'package:qubitarts/feature/one_service/logic/one_service_cubit.dart';

import '../../../../core/widgts/Custom_Choose.dart';
import '../../../../core/widgts/back_to_home.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';
import '../widgets/meeting_details.dart';
import '../widgets/pdf_container.dart';
import '../widgets/request_brief.dart';
import '../widgets/service_name_state.dart';

class OneServiceScreen extends StatefulWidget {
  const OneServiceScreen({Key? key, required this.title, required this.startDate, required this.status, required this.RequestId});
  final String title;
  final String startDate;
  final String status;
  final String RequestId;
  @override
  State<OneServiceScreen> createState() => _OneServiceScreenState();
}

class _OneServiceScreenState extends State<OneServiceScreen> {
  @override
  void didChangeDependencies() {
    //print('requestisd${widget.RequestId}');
    // TODO: implement didChangeDependencies
    OneServiceCubit.get(context).getRequest(widget.RequestId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackToHomeButton(),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 40.w, top: 20.h, bottom: 34.h),
                    child: Image.asset(
                      'assets/images/agency.png',
                      height: 40.h,
                      width: 171.5.w,
                    ),
                  )
                ],
              ),
              ServiceNameAndState(title: widget.title, startDate: widget.startDate, status: widget.status,),
              verticalSpace(20),
              AnimatedContainer(
                duration: Duration(seconds: 10),
                margin: EdgeInsets.symmetric(horizontal: 11.w),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                decoration: BoxDecoration(
                    color: Color(0xffE2ECF5),
                    borderRadius: BorderRadius.circular(24.r)),
                child: Column(
                  children: [
                    //RequestBrief(brief: '',),
                    verticalSpace(30),
                     BlocBuilder<OneServiceCubit,OneServiceState>(
  builder: (context, state) {
    if(state is GetRequestSuccess){
    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OneServiceCubit.get(context).request['quotationPDF']!=''?PdfsContainer(
                          pdfImage: 'assets/images/ques.png',
                          pdfName: S.of(context).Quotation, pdfString: OneServiceCubit.get(context).request['quotationPDF'],
                        ):SizedBox.shrink(),
                        OneServiceCubit.get(context).request['contractPDF']!=''?PdfsContainer(
                          pdfImage: 'assets/images/contract.png',
                          pdfName: S.of(context).Contract, pdfString: OneServiceCubit.get(context).request['contractPDF'],
                        ):SizedBox.shrink(),
                        OneServiceCubit.get(context).request['PaymentPDF']!=''?PdfsContainer(
                            pdfImage: 'assets/images/payment.png',
                            pdfName: S.of(context).Payment, pdfString: OneServiceCubit.get(context).request['PaymentPDF'],):SizedBox.shrink()
                      ],
                    );}
    return CircularProgressIndicator(color: Color(0xffFEDC32),);
  },
),

                    verticalSpace(15),
BlocBuilder<OneServiceCubit,OneServiceState>(builder: (context,state){
  if(state is GetRequestSuccess){
  return OneServiceCubit.get(context).checkRequestType(widget.title);}
  return CircularProgressIndicator(color: Color(0xffFEDC32),);
})

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TeamsTimeProcess extends StatelessWidget {
  const TeamsTimeProcess({
    super.key,
    required this.teamName,
    required this.teamDeadline,
    required this.teamPercentage,
  });
  final String teamName;
  final String teamDeadline;
  final double teamPercentage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.symmetric(vertical: 9.h) ,
      height: 15.h,
      //width: 282.6.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(teamName,
              style: TextStyles.lato17MediumBlack.copyWith(fontSize: 11.78.sp)),
          Container(
            margin: EdgeInsets.only(left: 4.w, right: 15.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.4.r),
              color: Color(0xffEE8924),
            ),
            height: 3.8.h,
            child: Row(
              children: [
                horizontalSpace(teamPercentage),
              ],
            ),
          ),
          Text(
            teamDeadline,
            style: TextStyles.lato16MediumGray.copyWith(fontSize: 10.sp),
          )
        ],
      ),
    );
  }
}
