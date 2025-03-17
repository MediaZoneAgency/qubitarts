import 'package:flutter/material.dart';

import '../../../../core/theming/text_styles.dart';

class EnterYour extends StatelessWidget {
  final String text;
  const EnterYour ({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyles.lato15DarkBlackRegular.copyWith(color: Color(0xff2A2A2A)),);
  }
}