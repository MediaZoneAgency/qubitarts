import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qubitarts/core/theming/colors.dart';

import 'font_weight.dart';

class TextStyles {
  static TextStyle poppins12RegularBlack = GoogleFonts.plusJakartaSans(
      fontSize: 12.sp,
      fontWeight: FontWeightHelper.regular,
      color: Colors.black.withOpacity(0.7));
  static TextStyle poppins14MediumPurple = GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.medium,
      color: Color(0xff5D345C));
  static TextStyle poppins10SemiBoldWhite = GoogleFonts.poppins(
      fontSize: 10.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: ColorsManager.white.withOpacity(0.9));
  static TextStyle plusJakartaSans48ExtraBoldWhite =
      GoogleFonts.plusJakartaSans(
          fontSize: 48.sp,
          fontWeight: FontWeightHelper.extraBold,
          color: Colors.white);
  static TextStyle inter28ExtraBoldBlack = GoogleFonts.inter(
      fontSize: 28.sp,
      fontWeight: FontWeightHelper.extraBold,
      color: Colors.black);
  static TextStyle inter20LightWhite = GoogleFonts.inter(
      fontSize: 20.sp, fontWeight: FontWeightHelper.light, color: Colors.white);
  static TextStyle inter22RegularWhite = GoogleFonts.inter(
      fontSize: 22.sp,
      fontWeight: FontWeightHelper.regular,
      color: Colors.white);
  static TextStyle inter40BoldWhite = GoogleFonts.inter(
      fontSize: 40.sp, fontWeight: FontWeightHelper.bold, color: Colors.white);
  static TextStyle lato18SemiBoldDarkBlack = GoogleFonts.lato(
      fontSize: 18.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: ColorsManager.darkBlack);
  static TextStyle lato15SemiBoldGray = GoogleFonts.lato(
      fontSize: 15.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: Colors.black.withOpacity(0.4));
  static TextStyle lato26RegularDarkBlack = GoogleFonts.lato(
      fontSize: 26.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManager.typographyColor);
  static TextStyle lato21MediumBlack = GoogleFonts.comicNeue(
      fontSize: 21.sp,
      color: Color(0xff343434),
      fontWeight: FontWeightHelper.medium);
  static TextStyle lato17MediumBlack = GoogleFonts.lato(
      fontSize: 16.7.sp,
      color: Color(0xff343434),
      fontWeight: FontWeightHelper.medium);
  static TextStyle lato20ExtraBoldBlack = GoogleFonts.lato(
      fontSize: 20.sp,
      color: ColorsManager.black,
      fontWeight: FontWeightHelper.extraBold);

  static TextStyle poppins14SemiBoldDarkPurple = GoogleFonts.poppins(
      fontSize: 14.sp,
      color: ColorsManager.darkPurple,
      fontWeight: FontWeightHelper.semiBold);

  static TextStyle lato16MediumGray = GoogleFonts.lato(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.medium,
      color: ColorsManager.gray50);

  static TextStyle lato28DarkBlackBold = GoogleFonts.lato(
      fontSize: 28.sp,
      fontWeight: FontWeightHelper.bold,
      color: Color(0xff2A2A2A));
  static TextStyle lato44DarkBlackBold = GoogleFonts.lato(
      fontSize: 44.sp,
      fontWeight: FontWeightHelper.extraExtraBold,
      color: Color(0xff1E1A18));

  static TextStyle lato20grayRegular = GoogleFonts.lato(
      fontSize: 20.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManager.gray80);

  static TextStyle lato18WhiteRegular = GoogleFonts.lato(
      fontSize: 18.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManager.white);

  static TextStyle lato15DarkBlackRegular = GoogleFonts.lato(
      fontSize: 15.sp,
      fontWeight: FontWeightHelper.regular,
      color: Color(0xff2a2a2a2a));

  static TextStyle helveticaNeue14GrayRegular = GoogleFonts.comicNeue(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      color: Color(0xff8A8E9E));

  static TextStyle lato12grayRegular = GoogleFonts.lato(
      fontSize: 12.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManager.gray80);

  static TextStyle lato20BoldBlack = GoogleFonts.lato(
      fontSize: 20.sp,
      fontWeight: FontWeightHelper.bold,
      color: ColorsManager.black);

  static TextStyle lato12grayBold = GoogleFonts.lato(
      fontSize: 12.4.sp,
      fontWeight: FontWeightHelper.bold,
      color: Color(0xff222222));
  static TextStyle poppins60MediumWhite = GoogleFonts.poppins(
      fontSize: 60.sp,
      fontWeight: FontWeightHelper.extraExtraBold,
      color: Colors.white);
  static TextStyle inter6RegularBlack = GoogleFonts.inter(
      fontSize: 6.sp,
      fontWeight: FontWeightHelper.regular,
      color: Colors.black.withOpacity(0.39));

  static TextStyle lato33BoldBlack = GoogleFonts.lato(
      fontSize: 33.sp,
      fontWeight: FontWeightHelper.bold,
      color: Color(0xff000000));

  static TextStyle roboto12RegularBlack = GoogleFonts.roboto(
      fontSize: 12.5.sp,
      fontWeight: FontWeightHelper.regular,
      color: Colors.black);
  static TextStyle roboto14RegularBlack = GoogleFonts.roboto(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      color: Colors.black.withOpacity(0.28));

  static TextStyle poppins17SemiBoldBlack = GoogleFonts.poppins(
      fontSize: 17.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: Color(0xff262422));

  static TextStyle poppins11SemiBoldred = GoogleFonts.poppins(
      fontSize: 11.4.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: Color(0xffC5331E));

  static TextStyle lato14SemiBoldWhite = GoogleFonts.lato(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: ColorsManager.white);

  static TextStyle inter12SemiBoldWhite = GoogleFonts.inter(
      fontSize: 12.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: ColorsManager.white);

  static TextStyle inter23MediumBlack = GoogleFonts.inter(
      fontSize: 23.sp,
      fontWeight: FontWeightHelper.medium,
      color: Colors.black);

  static TextStyle inter9SemiBoldBlue = GoogleFonts.inter(
      fontSize: 9.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: ColorsManager.blue);

 static TextStyle inter25SemiBoldBlack = GoogleFonts.inter(
     fontSize: 25.sp,
     fontWeight: FontWeightHelper.semiBold,
     color: Color(0xff1F2429));

  static TextStyle firaSans12mediumdarkgray = GoogleFonts.firaSans(
      fontSize: 12.sp,
      fontWeight: FontWeightHelper.medium,
      color: Color(0xff6F6F6F));

  static TextStyle inter16RegularWhite = GoogleFonts.inter(
      fontSize: 16.sp,
      color: Colors.white,
      fontWeight: FontWeightHelper.regular);

  static TextStyle workSans21SemiBoldWhite = GoogleFonts.workSans(
      fontSize: 21.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: Colors.white);

  static TextStyle lato15SemiBoldLightBlack = GoogleFonts.lato(
      fontSize: 15.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: Color(0xff000000));

  static TextStyle lato17SemiBoldLightBlack = GoogleFonts.lato(
      fontSize: 17.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: Color(0xff000000));

  static TextStyle lato10SemiBoldDarkWhite = GoogleFonts.lato(
      fontSize: 10.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: Color(0x2bffffff));

  static TextStyle lato10SemiBoldWhite = GoogleFonts.lato(
      fontSize: 10.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: Color(0xffeaeaea));

  static TextStyle inter18SemiBoldGray= GoogleFonts.inter(fontSize: 18.8.sp,
      fontWeight: FontWeightHelper.semiBold,color: Color(0xcc000000));

  static TextStyle DmSans7grayRegular= GoogleFonts.dmSans(fontSize: 7.sp,fontWeight: FontWeightHelper.regular,color: Color(
      0x8c222222));

  static TextStyle inter17BoldBlack= GoogleFonts.inter(fontSize: 17.sp,fontWeight: FontWeightHelper.bold,color: Color(0xff000000));

  static  TextStyle inter17RegularGray= GoogleFonts.inter(fontSize: 17.sp,fontWeight: FontWeightHelper.regular,color: Color(
      0x87000000));

  static  TextStyle notoSans17MediumBlack= GoogleFonts.notoSans(fontSize: 17.sp,fontWeight: FontWeightHelper.medium,color: Colors.black);

  static  TextStyle  roboto13RegularGray= GoogleFonts.roboto(fontSize: 13.sp,fontWeight: FontWeightHelper.regular,color: Color(0xff757575));

  static TextStyle roboto15RegularRed= GoogleFonts.roboto(fontSize: 15.sp,fontWeight: FontWeightHelper.regular,color: Color(0xffDF1525));

  static TextStyle inter16LightBlack=GoogleFonts.inter(fontSize: 16.sp,fontWeight: FontWeightHelper.light);
}
