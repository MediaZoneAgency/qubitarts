import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';

import '../../../../../generated/l10n.dart';
import '../theming/text_styles.dart';
class CustomChooseList extends StatefulWidget {
  const CustomChooseList({
    super.key,
    required this.customText,
    this.shadow,
    required this.list,
    required this.onSelected,
  });

  final String customText;
  final List<BoxShadow>? shadow;
  final List<String> list;
  final Function(String) onSelected;

  @override
  State<CustomChooseList> createState() => _CustomChooseListState();
}

class _CustomChooseListState extends State<CustomChooseList> {
  String? selectedItem;

  @override
  void initState() {
    super.initState();
    // Initialize selected item to the first in the list, or null if the list is empty
    selectedItem = widget.list.isNotEmpty ? widget.list.first : null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27.h,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: Colors.black.withOpacity(0.1), width: 0.7.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          horizontalSpace(12.w),
          Text(
            widget.customText,
            style: TextStyles.firaSans12mediumdarkgray,
          ),
          DropdownButton<String>(
            dropdownColor: Colors.white,
            //value: selectedItem,
            style: TextStyles.lato12grayBold,
            onChanged: (String? newValue) {
              if (newValue != null) {

                widget.onSelected(newValue);
              }
            },
            items: widget.list.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: TextStyles.firaSans12mediumdarkgray),
              );
            }).toList(),
            underline: const SizedBox(), // Hide the underline
          ),
        ],
      ),
    );
  }
}
