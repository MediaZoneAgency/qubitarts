
import 'package:flutter/material.dart';

import '../../../../core/assets/images.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final String time;
  final bool isUser;

  const ChatBubble({
    super.key,
    required this.text,
    required this.time,
    this.isUser = false,
  });


  const ChatBubble.typing({
    Key? key,
  })  : text = 'Analyzing…',
        time = '',
        isUser = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final bg = isUser ? Colors.pink.shade50 : Colors.grey.shade200;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment:
        isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isUser)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.black,
                    child: Image.asset(ImagesManager.logo),
                  ),
                ),

              // The message bubble
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isUser ? 12 : 0),
                      topRight: Radius.circular(isUser ? 0 : 12),
                      bottomLeft: const Radius.circular(12),
                      bottomRight: const Radius.circular(12),
                    ),
                  ),
                  child: Text(text, style: const TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
          // Timestamp
          if (time.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 50, right: 50),
              child: Text(
                time,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ),
        ],
      ),
    );
  }
}
