import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/core/routing/routes.dart';
import 'package:qubitarts/feature/home/ui/widgets/start_progress.dart';
import 'package:qubitarts/feature/login/ui/widgets/login_container.dart';
import 'package:qubitarts/feature/one_service/logic/one_service_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../generated/l10n.dart';
import 'line_progress.dart';

class ProjectCard extends StatelessWidget {
  final String id;
  final String title;
  final String startDate;
  final String status;
  // final List<String> stages;
  // final List<String> stageDates;
final String RequestId;
  const ProjectCard({
    Key? key,
    required this.id,
    required this.title,
    required this.startDate,
    required this.status,
    // required this.stages,
    // required this.stageDates,
    required this.RequestId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // OneServiceCubit.get(context).getRequest(RequestId!);
        context.pushNamed(Routes.oneServiceDetails,arguments: {'title':title,'startDate':startDate,'status':status,'RequestId':RequestId,});
        },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        padding:  const EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(blurRadius: 100,color: Color(0xffE2ECF5))],
          color: const Color(0xffFEE567),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xff2C2826),
                  child: Text(
                    id,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                 SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color:
                               Colors.black
                              ,
                        ),
                      ),


                    ],
                  ),
                ),
               const Icon(Icons.more_vert, color: Color(0xff363636)),
              ],
            ),
             SizedBox(height: 16.h),
            Row(children: [
              StartProgress(title:"${S.of(context).StartDate}:",startDate: startDate),
              horizontalSpace(40.w),
              StartProgress(title:"${S.of(context).Status}:",startDate: status)
            ],),

            const LineProgress(progress: 0.05,valueColor: Colors.black,),
            // Row(
            //   children: [
            //     SizedBox(
            //       width: 260.w,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: List.generate(
            //           stages.length,
            //               (index) => Column(
            //             children: [
            //               Text(
            //                 stages[index],
            //                 style: TextStyle(
            //                   fontSize: 12,
            //                   fontWeight: FontWeight.w600,
            //                   color: index == 0 ? Colors.blue : Colors.grey,
            //                 ),
            //               ),
            //               Text(
            //                 stageDates[index],
            //                 style: TextStyle(
            //                   fontSize: 12,
            //                   color: Colors.grey,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //    //Container(
            //    //  width: 77.w,
            //    //  height: 31.h,
            //    //  child: CircleAvatar(backgroundColor: Color(0xff76A5CF),child: Icon(Icons.edit,color: Colors.white,),),)
            //   ],
            // ),
            //

          ],
        ),
      ),
    );
  }
}


