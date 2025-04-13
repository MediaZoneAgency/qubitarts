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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 11.w),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                decoration: BoxDecoration(
                    color: Color(0xffE2ECF5),
                    borderRadius: BorderRadius.circular(24.r)),
                child: Column(
                  children: [
                    RequestBrief(brief: '',),
                    verticalSpace(30),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PdfsContainer(
                          pdfImage: 'assets/images/ques.png',
                          pdfName: S.of(context).Quotation,
                        ),
                        PdfsContainer(
                          pdfImage: 'assets/images/contract.png',
                          pdfName: S.of(context).Contract,
                        ),
                        PdfsContainer(
                            pdfImage: 'assets/images/payment.png',
                            pdfName: S.of(context).Payment)
                      ],
                    ),
                   // verticalSpace(48.h),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(S.of(context).Gallary,
                    //         style: TextStyles.lato17SemiBoldLightBlack.copyWith(
                    //             color: Color(0xff000000).withOpacity(0.55))),
                    //     verticalSpace(9.h),
                    //     Container(
                    //       height: 245.h,
                    //       width: 327.w,
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(17.r),
                    //           color: Colors.white,
                    //           image: DecorationImage(
                    //               image:
                    //                   AssetImage('assets/images/gallary.png'),
                    //               fit: BoxFit.fill)),
                    //     ),
                    //   ],
                    // ),
                    // MeetingDetails(),
                    // verticalSpace(5.h),
                    // Container(
                    //   margin: EdgeInsets.symmetric(horizontal: 5.w),
                    //   padding: EdgeInsetsDirectional.only(
                    //       start: 20.w, top: 24.h, bottom: 24.h, end: 4.w),
                    //   width: 327.w,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20.4.r),
                    //       color: Color(0xffffffff)),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text(
                    //         S.of(context).TimeFrame,
                    //         style: TextStyles.lato17MediumBlack,
                    //       ),
                    //       verticalSpace(8.h),
                    //       BlocBuilder<OneServiceCubit, OneServiceState>(
                    //         builder: (context, state) {
                    //           return Column(
                    //             children: [
                    //               TeamsTimeProcess(
                    //                 teamName: 'UI UX',
                    //                 teamDeadline: '20-12-2024',
                    //                 teamPercentage: 175.h,
                    //               ),
                    //               TeamsTimeProcess(
                    //                   teamName: 'Edits', teamDeadline: '20-12-2024', teamPercentage: 179.5.h
                    //               ),
                    //               TeamsTimeProcess(
                    //                 teamName: 'Development', teamDeadline: '20-12-2024', teamPercentage: 138.h,
                    //               ),
                    //               TeamsTimeProcess(
                    //                 teamName: 'Testing', teamDeadline: '20-12-2024', teamPercentage: 170.4.h,
                    //               ),
                    //               TeamsTimeProcess(
                    //                 teamName: 'Publishing', teamDeadline: '20-12-2024', teamPercentage: 154.48.h,
                    //               )
                    //             ],
                    //           );
                    //         },
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // verticalSpace(35.h),
                    // Text(S.of(context).SeepreviousWorks,style: TextStyles.inter18SemiBoldGray,),
                    verticalSpace(15),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 25.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),),
                      child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      HeadPage(title: widget.title,),
                      Text(
                        S.of(context).WhatisYourBusinessName,
                        style: TextStyles.inter25SemiBoldBlack,
                      ),
                      horizontalSpace(7),
                      Text(S.of(context).WriteyourBusinessorCompanyName,
                          style: TextStyles.inter9SemiBoldBlue
                              .copyWith(color: Color(0xff44434375).withOpacity(0.44))),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.only(end: 25.0.w, top: 12.h, bottom: 20.h),
                        child: CustomDescribtionTextField(hintText: S.of(context).MediZone,enabled: false,backgroundColor: Color(0xffF9F9F9),),
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.1),
                        thickness: 1,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).ChooseIndustry,
                            style: TextStyles.inter25SemiBoldBlack,
                          ),verticalSpace(5),
                          Text(S.of(context).WhatindustryYourBusinessis,style: TextStyles.inter9SemiBoldBlue.copyWith(color: Color(0xff44434375).withOpacity(0.44)),),
                          verticalSpace(20),
                          Padding(
                            padding:  EdgeInsetsDirectional.only(end: 120.0.w),
                            child: CustomChooseList(customText: S.of(context).PickanIndustry, list: [], onSelected: (String ) {  },),
                          ),
                        ],
                      )
                    ]),
                        )
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
