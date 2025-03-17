import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';

import '../../../../core/widgts/custom_describtion_text_field.dart';

import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';
import '../../logic/motion_graphic_cubit.dart';

class MotionGraphic4 extends StatefulWidget {
  @override
  State<MotionGraphic4> createState() => _MotionGraphic4State();
}

class _MotionGraphic4State extends State<MotionGraphic4> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  void initState() {
    super.initState();

    controller1.addListener(() {
      MotionGraphicCubit.get(context).messagesToConvey = controller1.text;
    });
    controller2.addListener(() {
      MotionGraphicCubit.get(context).specificTextOrPhrases = controller2.text;
    });
  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: 18.w, top: 39.h, end: 19.w, bottom: 19.h),
      child: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeadPage(
              title: S.of(context).MotionGraphic,
            ),
            Text(
              S.of(context).Whatmessagestoconvey,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
            ),
            horizontalSpace(7.h),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 18.h, bottom: 20.h),
              child: CustomDescribtionTextField(
                controller: controller1,
                hintText: S.of(context).TypeHere,
                backgroundColor: Color(0xffF9F9F9),
                borderColor: Color(0xffE4E4E4),
                containerHeight: 73.h,
                textStyle:
                    TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
              ),
            ),

            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            //verticalSpace(16.h),
            Padding(
              padding: EdgeInsets.only(top: 16.0.h, bottom: 7.h),
              child: Text(
                S.of(context).Aretherespecifictextorphrases,
                style:
                    TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 18.h, bottom: 20.h),
              child: CustomDescribtionTextField(
                controller: controller2,
                hintText: S.of(context).TypeHere,
                backgroundColor: Color(0xffF9F9F9),
                borderColor: Color(0xffE4E4E4),
                containerHeight: 73.h,
                textStyle:
                    TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
