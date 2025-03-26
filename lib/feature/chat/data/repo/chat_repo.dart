import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qubitarts/feature/chat/data/model/user_msg_model.dart';

import '../../../../core/db/cash_helper.dart';

class ChatRepo {
  //String chatId='';

  Future<void> sendMessage({required UserMsgModel data}) async {
    String chatId= await checkChat();
    try{
final chatMsg = await FirebaseFirestore.instance.collection('chat_messages').add(data.toMap());
if(chatId!=''){await FirebaseFirestore.instance
    .collection('chats').doc(chatId).set({
  'last_message':data.text,
  'last_message_seen_by':data.user,
  'last_message_sent_by':data.user,
  'last_message_time':Timestamp.fromDate(DateTime.now()),
  'user_a': data.user,
  'user_b':FirebaseFirestore.instance.doc("/users/w6DRYgaA1ofwvK2CFgLZgHCtOfh1"),
  'users':[data.user,FirebaseFirestore.instance.doc("/users/w6DRYgaA1ofwvK2CFgLZgHCtOfh1")],
});}
else print(chatId);
//     .set({
//   'last_message':data.text,
//   'last_message_seen_by':data.user,
//   'user_a': data.user,
//   'user_b':FirebaseFirestore.instance.doc("/users/w6DRYgaA1ofwvK2CFgLZgHCtOfh1")
//
//   // Store user reference
//
// });
print(chatMsg);
    }catch(e){
      print(e);
    }
  }
  Future<String> checkChat() async {
    String chatId='';
    try {
      String? userId =await CashHelper.getStringScoured(key: Keys.token);

      if (userId == null) {
        print("User ID is null");
        return '';
      }
      DocumentReference userRef = FirebaseFirestore.instance.doc("/users/$userId");
      // Query Firestore to check if this user ID exists in the "chats" collection
      final querySnapshot = await FirebaseFirestore.instance
          .collection('chats')
          .where('user_a', isEqualTo: userRef)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        chatId= querySnapshot.docs.first.id;
        print("Chat already exists. Chat ID: $chatId");
        print("User exists in chats collection.");
        return chatId;
      } else {
        DocumentReference newChatRef = await FirebaseFirestore.instance
            .collection('chats')
            .add({
          // 'last_message':msg,
          // 'last_message_seen_by':userRef,
          // 'user_a': userRef,
          // 'user_b':FirebaseFirestore.instance.doc("/users/w6DRYgaA1ofwvK2CFgLZgHCtOfh1")

          // Store user reference

        });
chatId=newChatRef.id;
        print("New chat created. Chat ID: ${newChatRef.id}");

        //return newChatRef.id;
        print("User does not exist in chats collection.");
        return chatId;
      }
    } catch (e) {
      print("Error checking chat: ${e.toString()}");
      return '';
    }
  }

}