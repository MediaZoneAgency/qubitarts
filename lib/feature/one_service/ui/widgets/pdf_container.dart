import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';

class PdfsContainer extends StatelessWidget {
  const PdfsContainer({
    super.key, required this.pdfImage, required this.pdfName, required this.pdfString,
  });
  final String pdfImage;
  final String pdfName;
  final String pdfString;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          pdfName,
          style: TextStyles.lato15SemiBoldLightBlack
              .copyWith(color: Colors.black.withOpacity(0.55)),
        ),
        verticalSpace(10.h),
       GestureDetector(
         onTap: () async
         {
           final Uri url = Uri.parse(pdfString);
           if (await canLaunchUrl(url)) {
             await launchUrl(url, mode: LaunchMode.externalApplication);
           } else {
             throw 'Could not launch $url';
           }

         },
          child: Container(height: 96.h,
            width: 106.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(pdfImage,))),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 32.h,horizontal: 17.w),

              decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(11.r),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(-1.6, 1.6),
                        color: Color(0x40000000),
                        spreadRadius: 3.48,
                        blurRadius: 26.5
                    )
                  ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/pdf.png',width: 15.w,height: 15.h,),
                  Text('Download Pdf',style: TextStyles.lato21MediumBlack.copyWith(fontSize: 6.57.sp),)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}