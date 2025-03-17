import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineProgress extends StatefulWidget{
  const LineProgress({super.key, required this.progress, this.valueColor});
final double progress;
final Color ?valueColor;
  @override
  State<LineProgress> createState() => _LineProgressState();
}

class _LineProgressState extends State<LineProgress> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 14.0.h,left: 12.w,right: 8.w,bottom: 30.h),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: widget.progress),
        duration: const Duration(milliseconds: 500),
        builder: (context, value, child) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(23.0), // Adjust the radius as needed
            child: LinearProgressIndicator(
              minHeight: 3.0, // Adjust the height as needed
              value: value,
              backgroundColor: const Color(0xffD9D9D9),
              valueColor: AlwaysStoppedAnimation<Color>(widget.valueColor ?? Color(0xffffffff)),
            ),
          );
        },
      ),
    );
  }
}