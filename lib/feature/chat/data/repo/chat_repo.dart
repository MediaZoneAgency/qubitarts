import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qubitarts/feature/chat/data/model/user_msg_model.dart';

class ChatRepo {
  Future<void> sendMessage({required UserMsgModel data}) async {
    try{
final chatMsg = await FirebaseFirestore.instance.collection('chat_messages').add(data.toMap());
print(chatMsg);
    }catch(e){
      print(e);
    }
  }
}