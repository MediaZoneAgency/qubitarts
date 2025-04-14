import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';

class ChooseItemScreen extends StatefulWidget {
  const ChooseItemScreen(
      {super.key,
      required this.featureList,
      required this.toggleFeature,
      required this.selectedFeatures});
  final List featureList;
  final List<dynamic> selectedFeatures;

  final Function(String) toggleFeature;
  @override
  _ChooseItemScreenState createState() => _ChooseItemScreenState();
}

class _ChooseItemScreenState extends State<ChooseItemScreen> {
  late List features;
  @override
  void initState() {
    super.initState();
    features = widget.featureList; // Now widget can be accessed here
  }

  List<String> selectedFeatures = [];
  TextEditingController customFeatureController = TextEditingController();

  void toggleFeature(String feature) {
    widget.toggleFeature(feature);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 5.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 3.w,
            runSpacing: 1.h,
            children: features.map((feature) {
              return ChoiceChip(

                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xffD8D8D8),width: 0.5.w),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                ),
                label: Text(feature),
                selected: widget.selectedFeatures.contains(feature),
                onSelected: (selected) => toggleFeature(feature),
                selectedColor: ColorsManager.white,
                backgroundColor: Color(0xff2F2F2F),
                labelStyle: TextStyle(
                  fontSize: 9.8.sp,
                  color: widget.selectedFeatures.contains(feature)
                      ? Colors.black
                      : Colors.white,
                ),
              );
            }).toList(),
          ),
          //SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
