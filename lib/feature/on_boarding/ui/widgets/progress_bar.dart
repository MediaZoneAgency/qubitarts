
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class ProgressBar extends StatelessWidget {
  final int currentPageIndex;
  final int totalPages;
final double height;
  final double width;

  const ProgressBar({
    Key? key,
    required this.currentPageIndex,
    required this.totalPages, required this.width, required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [

      if (currentPageIndex < totalPages)Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(totalPages, (index) {
            return AnimatedContainer(duration: Duration(milliseconds: 300)
            ,
              height: height,
              width: width,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index <= currentPageIndex
                    ? ColorsManager.white
                    : ColorsManager.white.withOpacity(0.3), // Filled and unfilled stages

              ),
            );
          }),

          
        ],
      )
    ]);
  }
}
