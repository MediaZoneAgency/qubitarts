import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/assets/images.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/font_weight.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';

class ProfileLoader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Skeletonizer(
     //containersColor: ColorsManager.boarderShadowColor,
       child:
   Row(
       children: [
         Text(
           'hello',
           style: TextStyles.lato18SemiBoldDarkBlack,
         ),
         Text(
            'Nice to meet you!',
           style: TextStyles.lato18SemiBoldDarkBlack,
         ),
       ],
     ));
  }

}