import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/spacing.dart';
import 'package:qubitarts/core/theming/text_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/theming/colors.dart';
import 'package:flutter/material.dart';

import '../../../home/ui/widgets/line_progress.dart';
import '../../../home/ui/widgets/start_progress.dart';
class ServiceCardLoader extends StatelessWidget {
  const ServiceCardLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Skeletonizer(
            containersColor: ColorsManager.boarderShadowColor,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
              padding:  EdgeInsets.all(16),
              decoration: BoxDecoration(
                //boxShadow: [BoxShadow(blurRadius: 100,color: Color(0xffE2ECF5))],
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xff2C2826),
                        child: Text(
                          'id',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'title    ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color:
                                Colors.black
                                ,
                              ),
                            ),


                          ],
                        ),
                      ),
                      Icon(Icons.more_vert, color: Color(0xff363636)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(children: [
                    const StartProgress(title:"Start Date:",startDate: 'startDate'),
                    horizontalSpace(40.w),
                    const StartProgress(title:"Status:",startDate: 'status')
                  ],),

                  LineProgress(progress: 0.7,valueColor: Colors.black,),
                  Row(
                    children: [
                      SizedBox(
                        width: 260.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'S.of(context).description',
                              style: TextStyles.helveticaNeue14GrayRegular,
                            ),
                          ],
                        ),
                      ),
                      //Container(
                      //  width: 77.w,
                      //  height: 31.h,
                      //  child: CircleAvatar(backgroundColor: Color(0xff76A5CF),child: Icon(Icons.edit,color: Colors.white,),),)
                    ],
                  ),


                ],
              ),
            ));
      },

    );
  }
}
