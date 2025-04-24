import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final TextStyle textStyle;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  const MessageBubble({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textStyle,
    required this.borderRadius,
    required this.padding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: Text(
        text,
        style: textStyle,
        overflow: TextOverflow.clip,
        softWrap: true,
      ),
    );
  }
}
