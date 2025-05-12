import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:qubitarts/core/localization/localization_cubit.dart';
import 'package:qubitarts/feature/chat/logic/chat_cubit.dart';

import '../../data/model/user_msg_model.dart';
import '../widgets/chat_bar.dart';
import '../widgets/chat_text_field.dart';
import '../widgets/support_bubble.dart';
import '../widgets/user_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  TextEditingController controller = TextEditingController();
  late Color backgroundColor;
  bool isTyping = false;

  @override
  void initState() {
    super.initState();
       //lChatCubit.get(context).checkChat(); // Safe to access context here
    backgroundColor =
    controller.text.isEmpty ? const Color(0xffD9D9D9) : Colors.white;
    controller.addListener(_updateController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ChatCubit.get(context).checkChat(); // Safe to access context here
  }


  void _updateController() {
    setState(() {
      backgroundColor =
      controller.text.isEmpty ? const Color(0xffF5F5F5) : Colors.white;
      isTyping = controller.text.isEmpty ? false : true;
    });
  }

  @override
  void dispose() {
    controller.removeListener(_updateController);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              if (state is ChatLoadingState || ChatCubit.get(context).chatId == null) {
                return Center(child: CircularProgressIndicator(color: Colors.amber,));
              }

              // ✅ Only show StreamBuilder when chatId is ready
              return StreamBuilder<List<UserMsgModel>>(
                stream: ChatCubit.get(context).streamChatMessages(),
                builder: (context, snapshot) {
                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   return const Center(child: CircularProgressIndicator());
                  // }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No messages yet"));
                  }

                  final messages = snapshot.data!;
                  return ListView.builder(
                    reverse: true,
                    padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final msg = messages[index];
                      final isUser = msg.user.path == "users/w6DRYgaA1ofwvK2CFgLZgHCtOfh1";

                      return isUser
                          ? SupportChatBubble(
                        text: msg.text,
                        time: formatTimestamp(msg.timestamp),
                      )
                          : UserChatBubble(
                        text: msg.text,
                        time: formatTimestamp(msg.timestamp),
                      );
                    },
                  );
                },
              );
            },
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ChatBar(),
              ChatTextField(
                isTyping: isTyping,
                controller: controller,
                backgroundColor: backgroundColor,
                sendMessage: () {
                  //ChatCubit.get(context).getLastMsg(controller.text.trim());
                  ChatCubit.get(context)
                      .sendMessage(controller.text.trim());
                  controller.clear();
                },
              )
            ],
          )
        ]),
      ),
    );
  }
}

String formatTimestamp(Timestamp timestamp) {
  final dateTime = timestamp.toDate();
  final hours = dateTime.hour.toString().padLeft(2, '0');
  final minutes = dateTime.minute.toString().padLeft(2, '0');
  return "$hours:$minutes";
}