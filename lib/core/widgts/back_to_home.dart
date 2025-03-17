import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/core/routing/routes.dart';

import '../assets/images.dart';

class BackToHomeButton extends StatelessWidget {
  const BackToHomeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 24.0.w, top: 11.h),
        child: GestureDetector(
            onTap: () {
              context.pushNamedAndRemoveUntil(Routes.navigationBar, predicate: (route) => false);
            },
            child: Image.asset(
              ImagesManager.back,
              fit: BoxFit.scaleDown,
              width: 30.w,
              height: 30.h,
            )),
      ),
    );
  }
}