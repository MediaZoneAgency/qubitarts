import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubitarts/feature/chat/logic/chat_cubit.dart';
import 'package:qubitarts/feature/chat/data/model/user_msg_model.dart';
import 'package:qubitarts/core/db/cash_helper.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit()..checkChat(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Chat')),
        backgroundColor: Colors.white,
        body: Column(
          children: [

            // 1) Expanded area for messages
            Expanded(
              child: BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  if (state is ChatLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is ChatErrorState) {
                    return Center(child: Text('Something went wrong.'));
                  }
                  // Once ready or updated, hook into the message stream:
                  if (state is ChatReadyState || state is ChatMessagesUpdatedState) {
                    return StreamBuilder<List<UserMsgModel>>(
                      stream: context.read<ChatCubit>().streamChatMessages(),
                      builder: (context, snap) {
                        if (snap.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snap.hasError) {
                          return Center(child: Text('Error loading chat.'));
                        }
                        final msgs = snap.data ?? [];
                        // Reverse list if you want newest at bottom or top
                        return ListView.builder(
                          reverse: true,
                          padding: EdgeInsets.all(8),
                          itemCount: msgs.length,
                          itemBuilder: (_, i) {
                            final msg = msgs[i];
                            final currentUserId = CashHelper.getStringScoured(key: Keys.token);
                            final isUser = msg.user.id == currentUserId;
                            return Align(
                              alignment: isUser
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: isUser
                                      ? Colors.blue.shade100
                                      : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(msg.text),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                  // Fallback
                  return SizedBox();
                },
              ),
            ),

            // 2) Input field + send button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      final text = _controller.text.trim();
                      if (text.isNotEmpty) {
                        context.read<ChatCubit>().sendMessage(text);
                        _controller.clear();
                      }
                    },
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
