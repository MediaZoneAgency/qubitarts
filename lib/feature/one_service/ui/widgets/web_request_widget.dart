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
import '../../../../core/widgts/time_packer.dart';
import '../../../../generated/l10n.dart';
import '../../../add_dMarkiting/ui/widgets/custom_range_slider.dart';
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
         ),verticalSpace(5),
         Text(S.of(context).Describewhatyourbusinessdoandanydetailsyouwantustoknow,style: TextStyles.inter9SemiBoldBlue.copyWith(color: Color(0xff44434375).withOpacity(0.44)),),
         verticalSpace(20),
         CustomDescribtionTextField(enabled:false,hintText: data.businessDescription!,backgroundColor: Color(0xffF9F9F9),borderColor:Color(0xffE4E4E4) ,containerHeight: 81.h,textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),borderRadius: 11.r,),
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
     CustomDescribtionTextField(enabled:false,hintText: data.preferredDomain!,backgroundColor: Color(0xffF9F9F9),borderColor:Color(0xffE4E4E4) ,containerHeight: 82.h,textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),borderRadius: 11.r),
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
     CustomDescribtionTextField(enabled:false,hintText:data.businessVision!,  backgroundColor: Color(0xffF9F9F9), borderColor: Color(0xffE4E4E4), containerHeight: 81.h, textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),),
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

enabled: false,
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
     horizontalSpace(14.5),
     ChooseItemScreen(
         featureList: ['Online Payment','Notifications','Booking','Registration','Interior Design','Clothing',' Automotive'],
         toggleFeature: (String feature) {

         },
         selectedFeatures:data.features),
     verticalSpace(20),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     verticalSpace(26),
     Text(
       S.of(context).Doassistancewithdomainregistration,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
     ),
     horizontalSpace(17.5),

     ChooseBetween(selectedValue:data.assistance!, onSelect: (String isYesSelected) {  }, choices: ['Need Assistance','Don\'t Need Assistance'],),
     verticalSpace(20),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     verticalSpace(26),
     Text(
       S.of(context).WhattimelinelaunchingApplication,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 17.8.sp),
     ),
     Text(S.of(context).Choosedeadline,style: TextStyles.inter9SemiBoldBlue.copyWith(color: Color(0xff44434375).withOpacity(0.44)),),
     verticalSpace(13),
     CustomTimePacker(selectDate: (DateTime selectedDate) {  }, selectedDate: data.launchDate!,),
     Text(
       S.of(context).WillprovidehighresolutionApplication,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.6.sp),
     ),
     horizontalSpace(17.5),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     ChooseBetween(selectedValue:data.willProvideHighResolutionImage!, onSelect: (String isYesSelected) {  }, choices: ['Yes','No'],),
     verticalSpace(20),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     verticalSpace(26),
     Text(
       S.of(context).WhichplatformstargetiOSAndroidboth,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.8.sp,color: Color(0xff1F2429)),
     ),

     ChooseBetween(selectedValue:data.iosOrAndroid!,onSelect: (String isIosSelected) { }, choices: ['ios','Android','Both'],),
     verticalSpace(20),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     verticalSpace(26),
     Text(
       S.of(context).Isthereanythingelseyoudliketoshareaboutourvisionfordigitalmarketing,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
     ),
     verticalSpace(17.5),
     CustomDescribtionTextField(
       enabled: false,
       hintText: data.visionDigitalMarketing!,
       backgroundColor: Color(0xffF9F9F9),
       borderColor: Color(0xffE4E4E4),
       containerHeight: 81.h,
       textStyle:
       TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
     )
   ]),
 );
  }
}
class AdsRequestDetailsWidget extends StatelessWidget{
  const AdsRequestDetailsWidget({super.key, required this.data});
final AdsRequestModel data;
  @override
  Widget build(BuildContext context) {
 return Container(
     padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 25.h),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20.r),),
    child:Column(children: [HeadPage(
      title: S.of(context).Ads,
    ),
      Text(
        S.of(context).Whatareyourbusinessgoalsandobjectivesfordigitalmarketing,
        style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
      ),
      verticalSpace(33),
      CustomDescribtionTextField(

enabled: false,
        hintText: data.businessGoal!,
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
        S.of(context).Whatsocialmediaplatformsaremostrelevantforyourbusiness,
        style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
      ),
      horizontalSpace(14.5),
      ChooseItemScreen(
          featureList: [
            'Instagram',
            'FaceBook',
            'X(twitter)',
            'SnapChat',
            'YouTube',
            'TikTok'
          ],
          toggleFeature: (String feature) {

          },
          selectedFeatures:data.releventPlatforms! ),verticalSpace(20),
      Divider(
        color: Colors.black.withOpacity(0.1),
        thickness: 1,
      ),Text(
        S.of(context).Whatisyourbudgetfordigitalmarketingefforts,
        style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
      ),
      CustomRangeSlider(
        currentRangeValues:
        _getValidRange(data.budgetRange!),
        onChanged: (RangeValues values) {

        },
      ),
      verticalSpace(20),
      Divider(
        color: Colors.black.withOpacity(0.1),
        thickness: 1,
      ),
      Padding(
        padding:  EdgeInsets.only(top: 16.0.h,bottom: 11.h),
        child: Text(
          S.of(context).Doyouhavebrandingguidelines,
          style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
        ),
      ),

      Padding(
        padding:
        EdgeInsetsDirectional.only( top: 18.h, bottom: 20.h),
        child:CustomDescribtionTextField(enabled: false,hintText:  data.brandGuideline!,backgroundColor: Color(0xffF9F9F9),borderColor:Color(0xffE4E4E4) ,containerHeight: 42.h,textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),),

      ),verticalSpace(20),
      Divider(
        color: Colors.black.withOpacity(0.1),
        thickness: 1,
      ),
      Text(
        S.of(context).Whatisyouruniquesellingproposition ,
        style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
      ),verticalSpace(33),
      CustomDescribtionTextField(


        hintText: data.uniqueSellingPropostion!,
        backgroundColor: Color(0xffF9F9F9),
        borderColor: Color(0xffE4E4E4),
        containerHeight: 81.h,
        textStyle:
        TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
      ),verticalSpace(20),
      Divider(
        color: Colors.black.withOpacity(0.1),
        thickness: 1,
      ),
      Padding(
        padding:  EdgeInsets.only(top: 16.0.h,bottom: 7.h),
        child: Text(
          S.of(context).WhattimelinelaunchingtheProject,
          style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
        ),
      ),
      Text(S.of(context).Choosedeadline,
          style: TextStyles.inter9SemiBoldBlue
              .copyWith(color: Color(0xff44434375).withOpacity(0.44))),
      verticalSpace(24),
      CustomTimePacker(selectDate: (DateTime selectedDate) {  }, selectedDate:data.launchDate! ),
      verticalSpace(20),
      Divider(
        color: Colors.black.withOpacity(0.1),
        thickness: 1,
      ),
      Text(
        S.of(context).Willyouberunningpaidadvertisingcampaigns,
        style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
      ),
      verticalSpace(14),

    ChooseItemScreen(featureList:[
    'Google ADS',
    'FaceBook ADS',
    'X(twitter)',
    'SnapChat',
    'YouTube',
    'TikTok'
    ], toggleFeature: (String  selectedCustomer) { }, selectedFeatures: data.campaignsPlatforms!,),
      verticalSpace(32),
      Divider(
        color: Colors.black.withOpacity(0.1),
        thickness: 1,
      ),
      Text(
        S.of(context).Describeidealcustomer,
        style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
      ),
      verticalSpace(7),

      ChooseItemScreen(featureList: [
        'Adults',
        'Children',
        'Women',
        'Students',
        'Elderly',
        'Arabians'
      ], toggleFeature: (String  selectedCustomer) {}, selectedFeatures: data.idealCustomer!,),
      Divider(
        color: Colors.black.withOpacity(0.1),
        thickness: 1,
      ),
      Text(
        S.of(context).Isthereanythingaboutyourvisionfordigitalmarketing,
        style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
      ),
      verticalSpace(28),
      CustomDescribtionTextField(
        enabled: false,
        hintText: data.visionDigitalMarketing!,
        backgroundColor: Color(0xffF9F9F9),
        borderColor: Color(0xffE4E4E4),
        containerHeight: 81.h,
        textStyle:
        TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
      )
    ],));
  }
}
class MotionRequestDetailsWidget extends StatelessWidget{
  const MotionRequestDetailsWidget({super.key, required this.data});
final MotionGraphicModel data;
  @override
  Widget build(BuildContext context) {
 return Container(
     padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 25.h),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20.r),),
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      HeadPage(title: data.type!,),
      Text(
      S.of(context).Whatprimarygoalofvideo,
      style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
    ),
        verticalSpace(7),
      Text(S.of(context).whatprimarygoalgraphic,
          style: TextStyles.inter9SemiBoldBlue
              .copyWith(color: Color(0xff44434375).withOpacity(0.44))),
      Padding(
        padding: EdgeInsetsDirectional.only(
            end: 25.0.w, top: 12.h, bottom: 20.h),
        child: CustomDescribtionTextField(
          enabled: false,
          hintText: data.primaryGoal!,
          backgroundColor: Color(0xffF9F9F9),
          borderColor: Color(0xffE4E4E4),
          containerHeight: 82.h,
          textStyle:
          TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
        ),
      ),verticalSpace(7),
      Divider(
        color: Colors.black.withOpacity(0.1),
        thickness: 1,
      ),horizontalSpace(7),
      Text(
        S.of(context).Describeidealcustomer,
        style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
      ),
        verticalSpace(7),
      ChooseItemScreen(
        featureList: ['Adults','Children','Women','Students','Elderly','Arabians'],
        toggleFeature: (String selectedCustomer) {

        },
        selectedFeatures:
        data.idealCustomer!,
      ),horizontalSpace(7),Divider(
        color: Colors.black.withOpacity(0.1),
        thickness: 1,
      ),verticalSpace(7),
      Text(
        S.of(context).Dohavespecificfontstyles,
        style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
      ),
        verticalSpace(7),
    ChooseItemScreen(featureList: ['Bold','Thin','Women','Sans-serif','Lato','Signature','Italic','Inter'], toggleFeature: (String  selectedFontStyle) { }, selectedFeatures: data.fontStyles!,),

      Divider(
        color: Colors.black.withOpacity(0.1),
        thickness: 1,
      ),
        verticalSpace(7),
      //verticalSpace(16.h),
      Padding(
        padding:  EdgeInsets.only(top: 16.0.h,bottom: 7.h),
        child: Text(
          S.of(context).Dohavebrandguidelinesorstyleguides,
          style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
        ),
      ),

      Padding(
        padding:
        EdgeInsetsDirectional.only( top: 18.h, bottom: 20.h),
        child:CustomDescribtionTextField(enabled: false,hintText: data.brandGuidelines!,backgroundColor: Color(0xffF9F9F9),borderColor:Color(0xffE4E4E4) ,containerHeight: 42.h,textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),),

      ),
      Text(
        S.of(context).Whatcolorpalettebrandcolorsavoid,
        style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
      ),
      horizontalSpace(7),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children:[
          'assets/images/platte1.png',
          'assets/images/platte2.png',
          'assets/images/platte3.png',
          'assets/images/platte4.png',
        ].map((palette) {
          // final isSelected = selectedPaletteId == palette.id;
          return GestureDetector(
            onTap: () {

            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),

              decoration: BoxDecoration(
                border: Border.all(
                  color:data.colorPalette==palette?Color(0xffD8D8D8):Colors.transparent,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(palette,height: 86.h,width: 86.w,),
            ),
          );
        }).toList()),),
        verticalSpace(7),
      Divider(
        color: Colors.black.withOpacity(0.1),
        thickness: 1,
      ),
      //verticalSpace(16.h),
      Padding(
        padding:  EdgeInsets.only(top: 16.0.h,bottom: 7.h),
        child: Text(
          S.of(context).WhattimelinelaunchingtheProject,
          style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
        ),
      ),
        verticalSpace(7),
      Text(S.of(context).Choosedeadline,
          style: TextStyles.inter9SemiBoldBlue
              .copyWith(color: Color(0xff44434375).withOpacity(0.44))),
      verticalSpace(24),
      CustomTimePacker(selectDate: (DateTime selectedDate) {  }, selectedDate: data.launchDate!),
        verticalSpace(7),
      Text(
        S.of(context).Whatmessagestoconvey,
        style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
      ),
      horizontalSpace(7),
      Padding(
        padding: EdgeInsetsDirectional.only(top: 18.h, bottom: 20.h),
        child: CustomDescribtionTextField(
          enabled: true,
          hintText: data.messagesToConvey!,
          backgroundColor: Color(0xffF9F9F9),
          borderColor: Color(0xffE4E4E4),
          containerHeight: 73.h,
          textStyle:
          TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
        ),
      ),
        verticalSpace(7),
      Divider(
        color: Colors.black.withOpacity(0.1),
        thickness: 1,
      ),
      //verticalSpace(16.h),
      Padding(
        padding: EdgeInsets.only(top: 16.0.h, bottom: 7.h),
        child: Text(
          S.of(context).Aretherespecifictextorphrases,
          style:
          TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
        ),
      ),
      Padding(
        padding: EdgeInsetsDirectional.only(top: 18.h, bottom: 20.h),
        child: CustomDescribtionTextField(
          enabled: false,
          hintText: data.specificTextOrPhrases!,
          backgroundColor: Color(0xffF9F9F9),
          borderColor: Color(0xffE4E4E4),
          containerHeight: 73.h,
          textStyle:
          TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
        ),
      ),Text(
        S.of(context).Doscriptorstoryboardready,
        style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
      ),
      horizontalSpace(7),
      Text(S.of(context).YouCanChooseMany,
          style: TextStyles.inter9SemiBoldBlue
              .copyWith(color: Color(0xff44434375).withOpacity(0.44))),

      ChooseBetween(
        selectedValue: data.assistanceCreatingScript!,
        onSelect: (String selectedValue) {

        },
        choices: ['Yes','No'],
      ),
      Divider(
        color: Colors.black.withOpacity(0.1),
        thickness: 1,
      ),
      //verticalSpace(16.h),
      Padding(
        padding: EdgeInsets.only(top: 16.0.h, bottom: 7.h),
        child: Text(
          S.of(context).Isthereaboutyourvisionfordigitalmarketing,
          style:
          TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
        ),
      ),
      Padding(
        padding: EdgeInsetsDirectional.only(top: 18.h, bottom: 20.h),
        child: CustomDescribtionTextField(
         enabled: false,
          hintText: data.visionForMarketing!,
          backgroundColor: Color(0xffF9F9F9),
          borderColor: Color(0xffE4E4E4),
          containerHeight: 82.h,
          textStyle:
          TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
        ),
      )
    ],));
  }
}
class BrandRequestDetailsWidget extends StatelessWidget{
  const BrandRequestDetailsWidget({super.key, required this.data});
final BrandRequestModel data;
  @override
  Widget build(BuildContext context) {
 return Container(
     padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 25.h),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20.r),),
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      HeadPage(title: data.type!,),
      Text(
        S.of(context).WhatisYourBusinessName,
        style: TextStyles.inter25SemiBoldBlack,
      ),
      horizontalSpace(7),
      Text(
        S.of(context).Describeidealcustomer,
        style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
      ),
      verticalSpace(7),

      ChooseItemScreen(featureList: [
        'Adults',
        'Children',
        'Women',
        'Students',
        'Elderly',
        'Arabians'
      ], toggleFeature: (String  selectedCustomer) {  }, selectedFeatures:data.idealCustomer!,),
      Divider(
        color: Colors.black.withOpacity(0.1),
        thickness: 1,
      ),
      Text(
        S.of(context).Whereyourbrandbeused,
        style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
      ),
      verticalSpace(7),

      ChooseItemScreen(featureList: [
        'website',
        'Social Media',
        'Print Materials',
        'Mobile App'
      ], toggleFeature: (String  selectedCustomer) {}, selectedFeatures: data.brandUsedPlaces!,),
      Text(
        S.of(context).Whatcolorpalettebrandcolorsavoid,
        style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
      ),
      verticalSpace(7),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: [
              'assets/images/platte1.png',
              'assets/images/platte2.png',
              'assets/images/platte3.png',
              'assets/images/platte4.png',
            ]
                .map((palette) {
              // final isSelected = selectedPaletteId == palette.id;
              return GestureDetector(
                onTap: () {

                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: data.palette ==
                          palette
                          ? Color(0xffD8D8D8)
                          : Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    palette,
                    height: 86.h,
                    width: 86.w,
                  ),
                ),
              );
            }).toList()),
      ),

      Divider(
        color: Colors.black.withOpacity(0.1),
        thickness: 1,
      ),
      //verticalSpace(16.h),
      Padding(
        padding: EdgeInsets.only(top: 16.0.h, bottom: 11.h),
        child: Text(
          S.of(context).Doyouhavebrandingguidelines,
          style:
          TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
        ),
      ),

      Padding(
        padding: EdgeInsetsDirectional.only(top: 18.h, bottom: 20.h),
        child: CustomDescribtionTextField(
          enabled: false,
          hintText: data.brandGuidelines!,
          backgroundColor: Color(0xffF9F9F9),
          borderColor: Color(0xffE4E4E4),
          containerHeight: 42.h,
          textStyle:
          TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
        ),
      ),

      Divider(
        color: Colors.black.withOpacity(0.1),
        thickness: 1,
      ),
      Text(
        S.of(context).Dohavespecificfontstyles,
        style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
      ),
      verticalSpace(7),
      ChooseItemScreen(featureList: [
        'Bold',
        'Thin',
        'Women',
        'Sans-serif',
        'Lato',
        'Signature',
        'Italic',
        'Inter'
      ], toggleFeature: (String  selectedFontStyle) {  }, selectedFeatures: data.fontStyles!,),

      Divider(
        color: Colors.black.withOpacity(0.1),
        thickness: 1,
      ),
      //verticalSpace(16.h),
      Padding(
        padding:  EdgeInsets.only(top: 16.0.h,bottom: 7.h),
        child: Text(
          S.of(context).WhattimelinelaunchingtheProject,
          style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
        ),
      ),
      Text(S.of(context).Choosedeadline,
          style: TextStyles.inter9SemiBoldBlue
              .copyWith(color: Color(0xff44434375).withOpacity(0.44))),
      verticalSpace(24),
      CustomTimePacker(selectDate: (DateTime selectedDate) {  }, selectedDate: data.launchDate!),
          Divider(
            color: Colors.black.withOpacity(0.1),
            thickness: 1,
          ),
          Text(
            S.of(context).Whatmessagestoconvey,
            style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
          ),
          verticalSpace(7),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 18.h, bottom: 20.h),
            child: CustomDescribtionTextField(
              enabled: false,
              hintText: data.messagesToConvey!,
              backgroundColor: Color(0xffF9F9F9),
              borderColor: Color(0xffE4E4E4),
              containerHeight: 73.h,
              textStyle:
              TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
            ),
          ),

          Divider(
            color: Colors.black.withOpacity(0.1),
            thickness: 1,
          ),
          //verticalSpace(16.h),
          Text(
            S.of(context).Aretherespecifictextorphrases,
            style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
          ),
          verticalSpace(7.h),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 18.h, bottom: 20.h),
            child: CustomDescribtionTextField(
              enabled: false,
              hintText: data.specificTextOrPhrases!,
              backgroundColor: Color(0xffF9F9F9),
              borderColor: Color(0xffE4E4E4),
              containerHeight: 73.h,
              textStyle:
              TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
            ),
          ),
          Text(
            S.of(context).Howdescribeyourbrand,
            style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
          ),
          verticalSpace(11),
          ChooseItemScreen(
            featureList: ['Minimalistic', 'Simple', 'Sophisticated'],
            toggleFeature: (String selectedBrandVisual) {

            },
            selectedFeatures:
            data.brandVisual!,
          ),
          verticalSpace(11),
          Divider(
            color: Colors.black.withOpacity(0.1),
            thickness: 1,
          ),
          verticalSpace(16),
          Text(
            S.of(context).Isthereanythingaboutyourvisionfordigitalmarketing,
            style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
          ),
          horizontalSpace(7),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 18.h, bottom: 20.h),
            child: CustomDescribtionTextField(
              enabled: false,
              hintText:data.yourVision!,
              backgroundColor: Color(0xffF9F9F9),
              borderColor: Color(0xffE4E4E4),
              containerHeight: 73.h,
              textStyle:
              TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
            ),
          )
    ]
    )
 );
  }
}
class PrintRequestDetailsWidget extends StatelessWidget{
  const PrintRequestDetailsWidget({super.key, required this.data});
final PrintoutRequestModel data;
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
       S.of(context).WhatstheTypePrintServiceNeeded,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
     ),
     verticalSpace(7),
     ChooseItemScreen(
       featureList: [
       "Business Card",
       "Brochures",
       "Flyers",
       "Posters",
       "Outdoors"
       ],
       toggleFeature: (String selectedCustomer) {

       },
       selectedFeatures: data.printoutTypes!,
     ),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     Text(
       S.of(context).QuantityNeeded,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
     ),
     verticalSpace(5),
     Text(S.of(context).ChooseQuantity,
         style: TextStyles.inter9SemiBoldBlue
             .copyWith(color: Color(0xff44434375).withOpacity(0.44))),
     verticalSpace(12),
     ChooseBetween(
       choices: [
         "50-100",
         "100-200",
         "500-1000",

       ],
       onSelect: (String selectedCustomer) {

       },
       selectedValue: data.quantityNeeded!,
     ),
     Padding(
       padding: EdgeInsetsDirectional.only(
           end: 25.0.w, top: 12.h, bottom: 20.h),
       child: CustomDescribtionTextField(
         enabled: false,
         hintText: data.quantityNeeded!,
         backgroundColor: Color(0xffF9F9F9),
         borderColor: Color(0xffE4E4E4),
         containerHeight: 43.h,
         textStyle:
         TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
       ),
     ),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     Text(
       S.of(context).IsanyPreferredPaperType,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
     ),
     verticalSpace(7),
     ChooseItemScreen(
       featureList: [
         "Glossy",
         "Matte",
         "Recycled",
         "Hard",
         "Soft"
       ],
       toggleFeature: (String selectedFontStyle) {

       },
       selectedFeatures:
       data.paperType!,
     ),

     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     //verticalSpace(16.h),
     Padding(
       padding: EdgeInsets.only(top: 16.0.h, bottom: 11.h),
       child: Text(
         S.of(context).Doyouhavebrandingguidelines,
         style:
         TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
       ),
     ),

     Padding(
       padding: EdgeInsetsDirectional.only(top: 18.h, bottom: 20.h),
       child: CustomDescribtionTextField(

         enabled: false,
         hintText: data.brandGuidelines!,
         backgroundColor: Color(0xffF9F9F9),
         borderColor: Color(0xffE4E4E4),
         containerHeight: 42.h,
         textStyle:
         TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
       ),
     ),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     verticalSpace(7),
     Text(
       S.of(context).SizeRequirements,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
     ),
     verticalSpace(7),

     CustomChooseList(customText: data.size!,
       onSelected: (String value) {

       },
       list: [],),
     verticalSpace(32),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     Padding(
       padding:  EdgeInsets.only(top: 16.0.h,bottom: 7.h),
       child: Text(
         S.of(context).WhattimelinelaunchingtheProject,
         style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
       ),
     ),
     Text(S.of(context).Choosedeadline,
         style: TextStyles.inter9SemiBoldBlue
             .copyWith(color: Color(0xff44434375).withOpacity(0.44))),
     verticalSpace(24),
     CustomTimePacker(selectDate: (DateTime selectedDate) {  }, selectedDate: data.dateLaunch!),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     Text(S.of(context).Isthereaboutyourvisionfordigitalmarketing,style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.7.sp),),

     Padding(
       padding:
       EdgeInsetsDirectional.only( top: 28.h,),
       child:CustomDescribtionTextField(hintText: data.visionForMarketing!,backgroundColor: Color(0xffF9F9F9),borderColor:Color(0xffE4E4E4) ,containerHeight: 73.h,textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),),

     )
   ]));
  }
}
class DigitalRequestDetailsWidget extends StatelessWidget{
  const DigitalRequestDetailsWidget({super.key, required this.data});
final DigitalRequestModel data;
  @override
  Widget build(BuildContext context) {
 return Container(
   padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 25.h),
   decoration: BoxDecoration(
     color: Colors.white,
     borderRadius: BorderRadius.circular(20.r),),
   child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
     HeadPage(title: data.type!,),Text(
       S.of(context)
           .Whatareyourbusinessgoalsandobjectivesfordigitalmarketing,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
     ),
     verticalSpace(7),
     Text(S.of(context).WriteYourbusinessgoalsandobjectivesbriefly,
         style: TextStyles.inter9SemiBoldBlue
             .copyWith(color: Color(0xff44434375).withOpacity(0.44))),
     Padding(
       padding: EdgeInsetsDirectional.only(
           end: 25.0.w, top: 12.h, bottom: 20.h),
       child: CustomDescribtionTextField(
         enabled: false,
         hintText: data.businessGoals!,
         backgroundColor: Color(0xffF9F9F9),
         borderColor: Color(0xffE4E4E4),
         containerHeight: 81.h,
         textStyle:
         TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
       ),
     ),

     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     verticalSpace(13),
     Text(
       S.of(context).Whatisyouruniquesellingproposition,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
     ),
     verticalSpace(7),
     Text(S.of(context).writeyouruniquesellingproposition,
         style: TextStyles.inter9SemiBoldBlue
             .copyWith(color: Color(0xff44434375).withOpacity(0.44))),
     Padding(
       padding: EdgeInsetsDirectional.only(
           end: 25.0.w, top: 12.h, bottom: 20.h),
       child: CustomDescribtionTextField(
         enabled: false,
         hintText: data.uniqueSelling!,
         backgroundColor: Color(0xffF9F9F9),
         borderColor: Color(0xffE4E4E4),
         containerHeight: 50.h,
         textStyle:
         TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
       ),
     ),
     verticalSpace(13),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),verticalSpace(13),
     Text(
       S.of(context).Whatisyourbudgetfordigitalmarketingefforts,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
     ),
     Padding(
       padding: EdgeInsetsDirectional.only(
           end: 25.0.w, top: 12.h, bottom: 20.h),
       child: CustomRangeSlider(
         currentRangeValues:
         _getValidRange(data.budget!),
         onChanged: (RangeValues values) {

         },
       ),
     ),

     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     verticalSpace(26),
     Text(
       S.of(context).WhattimelinelaunchingtheProject,
       style:
       TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 17.8.sp),
     ),
     Text(
       S.of(context).Choosedeadline,
       style: TextStyles.inter9SemiBoldBlue
           .copyWith(color: Color(0xff44434375).withOpacity(0.44)),
     ),
     verticalSpace(13),
     CustomTimePacker(
       selectDate: (DateTime selectedDate) {

       },
       selectedDate:
       data.dateLaunchTime!,
     ),
     verticalSpace(13),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     Text(
       S.of(context).Doyouhavebrandingguidelines,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
     ),

     CustomDescribtionTextField(enabled: false,hintText: data.brandGuideLines!,backgroundColor: Color(0xffF9F9F9),borderColor:Color(0xffE4E4E4) ,containerHeight: 42.5.h,textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),borderRadius: 11.r,),
     verticalSpace(13),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     verticalSpace(26),
     Text(
       S.of(context).Whatsocialmediaplatformsaremostrelevantforyourbusiness,
       style:
       TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 17.8.sp),
     ),
     Text(
       S.of(context).YouCanChooseMany,
       style: TextStyles.inter9SemiBoldBlue
           .copyWith(color: Color(0xff44434375).withOpacity(0.44)),
     ),
     verticalSpace(13),

     ChooseItemScreen(featureList: ['Instagram','FaceBook','X(twitter)','SnapChat','YouTube','TikTok'], toggleFeature: (String platform ) { }, selectedFeatures: data.platforms!),
     verticalSpace(13),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     verticalSpace(26),
     Text(
       S.of(context).Willyouberunningpaidadvertisingcampaigns,
       style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
     ),
     verticalSpace(4),
     Text(
       S.of(context).YouCanChooseMany,
       style: TextStyles.inter9SemiBoldBlue
           .copyWith(color: Color(0xff44434375).withOpacity(0.44)),
     ),
     verticalSpace(14),
     ChooseItemScreen(
       featureList: ['Instagram','FaceBook','X(twitter)','SnapChat','YouTube','TikTok'],
       toggleFeature: (String platform) {

       },
       selectedFeatures:
       data.paidCampaigns!,
     ),
     verticalSpace(13),
     Divider(
       color: Colors.black.withOpacity(0.1),
       thickness: 1,
     ),
     verticalSpace(26),
     Text(
       S.of(context).Isthereanythingaboutyourvisionfordigitalmarketing,
       style:
       TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 17.8.sp),
     ),
     CustomDescribtionTextField(
       enabled: false,
       hintText: data.visionForMarketing,
       backgroundColor: Color(0xffF9F9F9),
       borderColor: Color(0xffE4E4E4),
       containerHeight: 81.h,
       textStyle:
       TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
     ),
     verticalSpace(13),
   ]));
  }
}
RangeValues _getValidRange(String? budgetRangeStr) {
  try {
    if (budgetRangeStr == null || !budgetRangeStr.contains(',')) {
      return const RangeValues(0, 100);
    }

    final parts = budgetRangeStr.split(',');
    final start = double.tryParse(parts[0].trim()) ?? 0;
    final end = double.tryParse(parts[1].trim()) ?? 100;

    return RangeValues(start, end);
  } catch (e) {
    return const RangeValues(0, 100);
  }
}

