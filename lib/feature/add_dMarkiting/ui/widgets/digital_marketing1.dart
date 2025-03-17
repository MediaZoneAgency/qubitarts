import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/spacing.dart';
import 'package:qubitarts/core/theming/text_styles.dart';
import 'package:qubitarts/feature/add_website/ui/widgets/head_page.dart';

import '../../../../core/widgts/Custom_Choose.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../logic/dmarketing_cubit.dart';

class DMarketing1 extends StatefulWidget {
  const DMarketing1({super.key});

  @override
  State<DMarketing1> createState() => _DMarketing1State();
}

class _DMarketing1State extends State<DMarketing1> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  void initState() {
    super.initState();

    // Add a listener to update domainName in AppsCubit
    controller.addListener(() {
      DmarketingCubit.get(context).businessGoal = controller.text;
    });
    controller1.addListener(() {
      DmarketingCubit.get(context).usp = controller.text;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 18.w, top: 39.h, end: 19.w),
      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeadPage(
              title: S.of(context).DigitalMarketing,
            ),
            Text(
              S
                  .of(context)
                  .Whatareyourbusinessgoalsandobjectivesfordigitalmarketing,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
            ),
            verticalSpace(7),
            Text(S.of(context).WriteYourbusinessgoalsandobjectivesbriefly,
                style: TextStyles.inter9SemiBoldBlue
                    .copyWith(color: Color(0xff44434375).withOpacity(0.44))),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  end: 25.0.w, top: 12.h, bottom: 20.h),
              child: CustomDescribtionTextField(
                controller: controller,
                hintText: S.of(context).TypeHere,
                backgroundColor: Color(0xffF9F9F9),
                borderColor: Color(0xffE4E4E4),
                containerHeight: 81.h,
                textStyle:
                    TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            Text(
              S.of(context).Whatisyouruniquesellingproposition,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
            ),
            verticalSpace(7),
            Text(S.of(context).writeyouruniquesellingproposition,
                style: TextStyles.inter9SemiBoldBlue
                    .copyWith(color: Color(0xff44434375).withOpacity(0.44))),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  end: 25.0.w, top: 12.h, bottom: 20.h),
              child: CustomDescribtionTextField(
                controller: controller1,
                hintText: S.of(context).TypeHere,
                backgroundColor: Color(0xffF9F9F9),
                borderColor: Color(0xffE4E4E4),
                containerHeight: 50.h,
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
