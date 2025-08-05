

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/text_styles.dart';
class ChooseBetween extends StatefulWidget {
  const ChooseBetween({
    Key? key,
    required this.selectedValue,
    required this.onSelect,
    required this.choices,
  }) : super(key: key);

  final List<String> choices;
  final String selectedValue;
  final Function(String selectedValue) onSelect;

  @override
  State<ChooseBetween> createState() => _ChooseBetweenState();
}

class _ChooseBetweenState extends State<ChooseBetween> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.choices.length, (index) {
          final isSelected = widget.choices[index] == widget.selectedValue;

          return GestureDetector(
            onTap: () {
              widget.onSelect(widget.choices[index]);
            },
            child: Container(
              margin: EdgeInsetsDirectional.only(
                top: 16.h,
                bottom: 16.h,
                start: 10.w,
              ),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : const Color(0xffF9F9F9),
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: const Color(0xffE4E4E4),
                  width: 0.34.w,
                ),
              ),
              child: Text(
                widget.choices[index],
                style: isSelected
                    ? TextStyles.lato18SemiBoldDarkBlack.copyWith(
                  color: Colors.white,
                  fontSize: 9.4.sp,
                )
                    : TextStyles.lato18SemiBoldDarkBlack.copyWith(
                  fontSize: 9.4.sp,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

