import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/feature/add_app/data/model/app_request_model.dart';
import 'package:qubitarts/feature/add_dMarkiting/data/model/digital_request_model.dart';
import 'package:qubitarts/feature/add_website/data/model/web_request_model.dart';
import 'package:qubitarts/feature/ads/data/model/ads_request_model.dart';
import 'package:qubitarts/feature/brand_identity/data/model/brand_request_model.dart';
import 'package:qubitarts/feature/motion_graphic/data/model/motion_graphic_model.dart';
import 'package:qubitarts/feature/print-out/data/model/printout_request_model.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/Custom_Choose.dart';
import '../../../../core/widgts/choose_item.dart';
import '../../../../core/widgts/choose_one.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';

class WebRequestDetailsWidget extends StatelessWidget{
  const WebRequestDetailsWidget({super.key, required this.data});
final WebRequestModel data;
  @override
  Widget build(BuildContext context) {
 return Container(
   padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 25.h),
   decoration: BoxDecoration(
     color: Colors.white,
     borderRadius: BorderRadius.circular(20.r),),
   child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
     HeadPage(title: data.type!,),
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
       child: CustomDescribtionTextField(hintText: data.businessName!,enabled: false,backgroundColor: Color(0xffF9F9F9),),
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
           child: CustomChooseList(customText: data.industry!, list: [], onSelected: (String ) {  },),
         ),
         Divider(
           color: Colors.black.withOpacity(0.1),
           thickness: 1,
         )
       ],
     ),
     Text(
       S.of(context).IsYourBusinessNeworOldintheMarket,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 20.sp),
     ),
     horizontalSpace(14.5),

     ChooseBetween(selectedValue:data.businessState!, onSelect: (String isYesSelected) {  }, choices: ['New','Old'],)
     ,Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),verticalSpace(19),
     Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
           S.of(context).DescribeYourBusiness,
           style: TextStyles.inter25SemiBoldBlack,
         ),verticalSpace(5.h),
         Text(S.of(context).Describewhatyourbusinessdoandanydetailsyouwantustoknow,style: TextStyles.inter9SemiBoldBlue.copyWith(color: Color(0xff44434375).withOpacity(0.44)),),
         verticalSpace(20.h),
         CustomDescribtionTextField(hintText: data.businessDescription!,backgroundColor: Color(0xffF9F9F9),borderColor:Color(0xffE4E4E4) ,containerHeight: 81.h,textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),borderRadius: 11.r,),
       ],
     ),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     Text(
       S.of(context).Whatfeaturesorfunctionalitiesdoyouneedcontactformsecommerceblog,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
     ),
     horizontalSpace(14.5),
     ChooseItemScreen(featureList: ['Online Payment','Notifications','Booking','Registration','Interior Design','Clothing',' Automotive'], toggleFeature: (String feature){}, selectedFeatures:data.websiteFeatures!),
     verticalSpace(20),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     Text(
       S.of(context).Whatisyourpreferreddomainnameifyouhaveone,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
     ),
     verticalSpace(7),
     Text(S.of(context).WriteDomainifyouHave,style: TextStyles.inter9SemiBoldBlue.copyWith(color: Color(0xff44434375).withOpacity(0.44)),),
     verticalSpace(33),
     CustomDescribtionTextField(hintText: data.preferredDomain!,backgroundColor: Color(0xffF9F9F9),borderColor:Color(0xffE4E4E4) ,containerHeight: 82.h,textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),borderRadius: 11.r),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     Text(
       S.of(context).Willprovideimagesforthewebsite,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.6.sp),
     ),
     horizontalSpace(17.5),
     ChooseBetween(selectedValue:data.ProvideHighResoImage!, onSelect: (String isYesSelected) {  }, choices: ['Yes','No'],),
     verticalSpace(36),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     verticalSpace(26),
     Text(
       S.of(context).Isthereanythingaboutyourvisionfordigitalmarketing,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 17.8.sp),
     ),
     verticalSpace(23),
     CustomDescribtionTextField(hintText:data.businessVision!,  backgroundColor: Color(0xffF9F9F9), borderColor: Color(0xffE4E4E4), containerHeight: 81.h, textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),),
   ]),
 );
  }
}
class AppRequestDetailsWidget extends StatelessWidget{
  const AppRequestDetailsWidget({super.key, required this.data});
final AppRequestModel data;
  @override
  Widget build(BuildContext context) {
 return  Container(
   padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 25.h),
   decoration: BoxDecoration(
     color: Colors.white,
     borderRadius: BorderRadius.circular(20.r),),
   child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
     HeadPage(title: data.type!,),
     Text(
       S.of(context).WhatisYourBusinessName,
       style: TextStyles.inter25SemiBoldBlack,
     ),
     horizontalSpace(7),
     Text(
       S.of(context).Whatisyourpreferreddomainnameifyouhaveone,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
     ),
     verticalSpace(7),
     Text(
       S.of(context).WriteDomainifyouHave,
       style: TextStyles.inter9SemiBoldBlue
           .copyWith(color: Color(0xff44434375).withOpacity(0.44)),
     ),
     verticalSpace(33),
     CustomDescribtionTextField(


       hintText: data.domainName!,
       backgroundColor: Color(0xffF9F9F9),
       borderColor: Color(0xffE4E4E4),
       containerHeight: 81.h,
       textStyle:
       TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
     ),
     verticalSpace(20),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     Text(
       S.of(context).Whatfeaturesorfunctionalitiesdoyouneedcontactformsecommerceblog,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
     ),
     horizontalSpace(14.5.h),
     ChooseItemScreen(
         featureList: ['Online Payment','Notifications','Booking','Registration','Interior Design','Clothing',' Automotive'],
         toggleFeature: (String feature) {

         },
         selectedFeatures:data.features),
   ]),
 );
  }
}class AdsRequestDetailsWidget extends StatelessWidget{
  const AdsRequestDetailsWidget({super.key, required this.data});
final AdsRequestModel data;
  @override
  Widget build(BuildContext context) {
 return Container();
  }
}class MotionRequestDetailsWidget extends StatelessWidget{
  const MotionRequestDetailsWidget({super.key, required this.data});
final MotionGraphicModel data;
  @override
  Widget build(BuildContext context) {
 return Container();
  }
}class BrandRequestDetailsWidget extends StatelessWidget{
  const BrandRequestDetailsWidget({super.key, required this.data});
final BrandRequestModel data;
  @override
  Widget build(BuildContext context) {
 return Container();
  }
}class PrintRequestDetailsWidget extends StatelessWidget{
  const PrintRequestDetailsWidget({super.key, required this.data});
final PrintoutRequestModel data;
  @override
  Widget build(BuildContext context) {
 return Container();
  }
}class DigitalRequestDetailsWidget extends StatelessWidget{
  const DigitalRequestDetailsWidget({super.key, required this.data});
final DigitalRequestModel data;
  @override
  Widget build(BuildContext context) {
 return Container();
  }
}