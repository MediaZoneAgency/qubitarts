import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/theming/text_styles.dart';
import 'package:qubitarts/feature/notification/logic/notification_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../widgets/task_item.dart';

class NotificationScreen  extends StatelessWidget{
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text('Notifications',style: TextStyles.lato21MediumBlack,),),
      body: SafeArea(
        child: ListView.separated(
          itemCount: NotificationCubit.get(context).tasks.length,
          itemBuilder: (context, index) {
            //final task = tasks[index];
            return TaskItem(
              tasks:NotificationCubit.get(context).tasks[index] ,
            );
          }, separatorBuilder: (BuildContext context, int index) {
          return verticalSpace(12.h);
        },
        ),
      ),);
  }
}