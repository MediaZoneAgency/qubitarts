import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSwitch extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    Key? key,
    this.initialValue = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool isToggled;

  @override
  void initState() {
    super.initState();
    isToggled = widget.initialValue;
  }

  void toggleSwitch() {
    setState(() {
      isToggled = !isToggled;
    });
    widget.onChanged(isToggled);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSwitch,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 61.w,
        height: 24.h,

        decoration: BoxDecoration(
          color:  Colors.black ,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Stack(
          children: [
            // Left Icon
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              //left: isToggled ? 50 : 4,
              //top: 4,
              child: AnimatedContainer(
                padding: EdgeInsets.all(4),
                duration: const Duration(milliseconds: 300),
                width: 25.w,
                height: 25.h,
                decoration: BoxDecoration(
                  color:  Colors.white ,
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/images/support.png',width: 10.w,height: 10.h,fit: BoxFit.scaleDown,),
              ),
            ),
            // Right Icon

              Positioned(
                right: 10.w,

                top: 4.h,
                child: Icon(
                  Icons.keyboard_double_arrow_right,
                  color: Colors.grey,
                  size: 18,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
