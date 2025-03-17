
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/extensions.dart';

import '../../../../core/theming/text_styles.dart';


class ChatBar extends StatelessWidget {
  const ChatBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.h,
      color: Colors.white,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){context.pop();}, icon: Icon(Icons.home,color: Colors.black,)),
            Text('Support',style: TextStyles.poppins17SemiBoldBlack,),
            IconButton(onPressed: (){},icon: Icon(Icons.search,color: Colors.black,))
          ]),
    );
  }
}