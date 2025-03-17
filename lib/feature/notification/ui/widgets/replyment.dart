
import 'package:flutter/material.dart';

import '../../../../core/theming/text_styles.dart';

class Replyment extends StatelessWidget {
  final String replyment;
  const Replyment({super.key, required this.replyment});

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 300,
            child: Text(replyment, style: TextStyles.helveticaNeue14GrayRegular,
            softWrap: true,
                    overflow: TextOverflow.visible,
                  
            ),
          );
  }
}