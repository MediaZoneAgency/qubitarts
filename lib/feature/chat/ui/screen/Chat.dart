import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:qubitarts/core/localization/localization_cubit.dart';
import 'package:qubitarts/feature/chat/logic/chat_cubit.dart';

import '../widgets/chat_bar.dart';
import '../widgets/chat_text_field.dart';
import '../widgets/user_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void didChangeDependencies(){
    ChatCubit.get(context).checkChat();
  }

  TextEditingController controller = TextEditingController();
  late Color backgroundColor;
  bool isTyping = false;
  @override
  void initState() {
    super.initState();
    // Initialize background color based on initial controller value
    backgroundColor =
        controller.text.isEmpty ? const Color(0xffD9D9D9) : Colors.white;

    // Add listener to controller to detect text changes
    controller.addListener(_updateController);
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
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Stack(children: [
              Padding(
                padding: EdgeInsetsDirectional.only(top: 30.h, bottom: 40.h),
                child: ListView.builder(
                    itemCount: ChatCubit.get(context).msgList.length,
                    itemBuilder: (context, index) {
                      return Align(
                          alignment: LocalizationCubit.get(context).locale == Locale('en')?Alignment.topRight:Alignment.topLeft,
                          child: UserChatBubble(
                            text: ChatCubit.get(context).msgList[index].text,
                            time: DateFormat('hh:mm a').format(
                                ChatCubit.get(context).msgList[index].timestamp.toDate(),
                            ),
                          ));
                    }),
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
      },
    );
  }
}
