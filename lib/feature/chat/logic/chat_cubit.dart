import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qubitarts/feature/chat/data/model/user_msg_model.dart';
import 'package:qubitarts/feature/chat/data/repo/chat_repo.dart';

import '../../../core/db/cash_helper.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  static ChatCubit get(context) => BlocProvider.of(context);

  List<UserMsgModel> msgList = [];

  void sendMessage(String msg) async {
    String? userId = await CashHelper.getStringScoured(key: Keys.token);

    if (userId == null) {
      emit(ChatErrorState());
      print("User ID not found");
      return;
    }

    // Create the message model
    UserMsgModel newMessage = UserMsgModel(
      text: msg,
      timestamp: Timestamp.fromDate(DateTime.now()),
      user: FirebaseFirestore.instance.collection('users').doc(userId),
      chat: FirebaseFirestore.instance.collection('chats').doc('28kgmRNOm4lD07ROLcVD'),
    );

    // Add the new message to the list and update the UI
    msgList.add(newMessage);
    print(msgList);
    emit(ChatMessagesUpdatedState());

    // Send the message to Firestore
    try {
      await ChatRepo().sendMessage(data: newMessage);
    } catch (e) {
      emit(ChatErrorState());
    }
  }
}

