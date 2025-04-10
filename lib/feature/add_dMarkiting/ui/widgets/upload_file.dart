import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/assets/images.dart';
import '../../../../../core/helpers/spacing.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/theming/text_styles.dart';

class UploadFile extends StatelessWidget {
  const UploadFile({super.key, required this.height, required this.background, required this.Uploed});
  final double height;
  final Color background;
  final Function() Uploed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.86.r), color: background),
      //height: height,
      // width: 342.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: Uploed, icon: SvgPicture.asset(ImagesManager.fileAdd)),
          Text(
            S.of(context).Clicktoupload,
            style: TextStyles.DmSans7grayRegular,
          ),
          //verticalSpace(27),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(ImagesManager.pdf),
              SvgPicture.asset(ImagesManager.docx),
              SvgPicture.asset(ImagesManager.txt),
              SvgPicture.asset(ImagesManager.mb)
            ],
          )
        ],
      ),
    );
  }
}
