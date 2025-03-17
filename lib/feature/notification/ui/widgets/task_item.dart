
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/feature/notification/ui/widgets/person_task_details.dart';
import 'package:qubitarts/feature/notification/ui/widgets/replyment.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/app_text_button.dart';
import '../../data/model/task_model.dart';
import 'notification_description.dart';

class TaskItem extends StatelessWidget {

  const TaskItem(
      {super.key, required this.tasks,
      });
final TaskModel tasks;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity.w,
        height: 402.h,
        padding:  EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        margin:  EdgeInsets.symmetric(horizontal: 15.w, ),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            blurRadius: 62.2,
            offset: Offset(0, 21),
            color: Colors.black.withOpacity(0.06),
          )],
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(26.r),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                PersonTaskDetails(
                  name: tasks.name1,
                  job: tasks.job1,
                  profileImage: tasks.profileImage1,
                  date: tasks.date1),
              NotificationDescription(
                description:
                    tasks.description,
                compImage: tasks.compImage,
              ),
              Divider(
                color: Color(0xffd8dae529).withOpacity(0.16),
                thickness: .2,
                indent: 8,
                endIndent: 8,
              ),
                PersonTaskDetails(
                  name: tasks.name2,
                  job: tasks.job2,
                  profileImage: tasks.profileImage2,
                  date: tasks.date2),
                Replyment(
                  replyment:
                      tasks.replyment),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextButton(buttonText: tasks.replyment1, textStyle: TextStyles.helveticaNeue14GrayRegular.copyWith(color: Color(0xff343434)), onPressed:() {
                  
                },
                buttonWidth: 150.w,
                buttonHeight: 47.h,
                borderRadius: 104.r,
                backgroundColor: const Color(0xffEBECF0),
                verticalPadding: 10.h,
                ),
                AppTextButton(buttonText: tasks.replyment2, textStyle: TextStyles.helveticaNeue14GrayRegular.copyWith(color: Colors.white), onPressed:() {
                  
                },
                buttonWidth: 150.w,
                buttonHeight: 47.h,
                borderRadius: 104.r,
                backgroundColor: const Color(0xff343434),
                verticalPadding: 10.h,
                ),
                    
                  ],
                ),
              )
            ]));
  }
}
