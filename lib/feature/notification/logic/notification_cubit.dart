import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../data/model/task_model.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());
  static NotificationCubit get(context)=>BlocProvider.of(context);
  final List<TaskModel> tasks = [
    TaskModel(replyment1: 'Decline', replyment2: 'Complain', name1: 'Mr Haythem', name2: 'Waleed Mohamed', job1: 'CEO', job2: 'Prog', profileImage1: 'assets/images/person1.png', profileImage2: 'assets/images/person2.png', date1: 'Mar 13, 2022', date2:'Mar 13, 2022', description: 'Please prepare the last phase of the UI/UX design for propaganda!', compImage: 'assets/images/Thumbnail.png', replyment: 'You have a complaint from Line developments, you have to reply to them..'),
    TaskModel(replyment1: 'Decline', replyment2: 'Complain', name1: 'Mr Haythem', name2: 'Waleed Mohamed', job1: 'CEO', job2: 'Prog', profileImage1: 'assets/images/person1.png', profileImage2: 'assets/images/person2.png', date1: 'Mar 13, 2022', date2:'Mar 13, 2022', description: 'Please prepare the last phase of the UI/UX design for propaganda!', compImage: 'assets/images/Thumbnail.png', replyment: 'You have a complaint from Line developments, you have to reply to them..')

    //TaskModel('Decline', 'Complain', 'Mr Haythem', 'Waleed Mohamed',  'CEO', 'Prog', 'assets/images/person1.png', 'assets/images/person2.png','Mar 13, 2022', 'Mar 13, 2022', 'Please prepare the last phase of the UI/UX design for propaganda!','assets/images/Thumbnail.png','You have a complaint from Line developments, you have to reply to them..')
    //,//TaskModel('Decline', 'Complain', 'Mr Haythem', 'Waleed Mohamed',  'CEO', 'Prog', 'assets/images/person1.png', 'assets/images/person2.png','Mar 13, 2022', 'Mar 13, 2022', 'Please prepare the last phase of the UI/UX design for propaganda!','assets/images/Thumbnail.png','You have a complaint from Line developments, you have to reply to them..')

  ];
}
