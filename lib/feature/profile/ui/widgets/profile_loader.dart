import 'package:flutter/material.dart';

import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/theming/text_styles.dart';

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