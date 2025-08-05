import 'package:flutter/material.dart';


class Background extends StatelessWidget {
  const Background({
    super.key, required this.backgroundImage,
  });
final String backgroundImage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 852.h,
      width: double.infinity,
      child: Image.asset(
        fit: BoxFit.fill,
        backgroundImage,
      ),
    );
  }
}