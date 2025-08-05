import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:qubitarts/feature/ai_chat/logic/chat_cubit.dart';
import 'package:qubitarts/feature/ai_chat/logic/chat_state.dart';
import 'package:qubitarts/feature/ai_chat/ui/widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AiChatCubit cubit = context.read<AiChatCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Ai Chat', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<AiChatCubit, AiChatState>(
                builder: (context, state) {
                  final loading = state is AiChatLoading;
                   final messages = <ChatMessage>[
                    if (state is AiChatSuccess) ...state.messages,
                    if (state is AiChatLoading) ...state.messages,
                  ];

                  final count = messages.length + (loading ? 1 : 0);

                  return ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    itemCount: count,
                    itemBuilder: (_, idx) {
                      if (loading && idx == count - 1) {
                        return const ChatBubble.typing();
                      }
                      final msg = messages[idx];
                      return ChatBubble(
                        text: msg.text,
                        time: DateFormat('hh:mm a').format(msg.timestamp),
                        isUser: msg.isUser,
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        hintText: 'Write a comment',
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                      ),
                      onSubmitted: (_) => _send(cubit),
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.blue),
                    onPressed: () => _send(cubit),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _send(AiChatCubit cubit) {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    cubit.sendMessage(text);
    _controller.clear();
  }
}
