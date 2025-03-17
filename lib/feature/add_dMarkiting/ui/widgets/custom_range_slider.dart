import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../logic/dmarketing_cubit.dart';

class CustomRangeSlider extends StatelessWidget {
  const CustomRangeSlider({
    super.key, required this.currentRangeValues, this.onChanged,
  });
final RangeValues currentRangeValues;
final Function(RangeValues)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        rangeTrackShape: RoundedRectRangeSliderTrackShape(),

        activeTrackColor: ColorsManager.yellow,
        inactiveTrackColor: const Color(0xffF1F1F1),
        thumbColor: Color(0xffACACAC),
        overlayColor: ColorsManager.yellow.withOpacity(0.2),
        valueIndicatorColor: Colors.black, // Label background color
        valueIndicatorTextStyle: TextStyle(
          color: Colors.white, // Label text color
          fontWeight: FontWeight.bold,
        ),
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0.r),
        overlayShape:  RoundSliderOverlayShape(overlayRadius: 20.0.r),
        valueIndicatorShape:  PaddleSliderValueIndicatorShape(), // Customize shape here
      ),
      child: RangeSlider(
        min: 0,
        max: 100,
        divisions: 10,
        labels: RangeLabels(
          currentRangeValues.start.toString(),
          currentRangeValues.end.toString(),
        ),
        values: currentRangeValues,
        onChanged: onChanged,
      ),
    );
  }
}