import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';
import '../../logic/ads_cubit.dart';

class Ads5 extends StatefulWidget {
  @override
  State<Ads5> createState() => _Ads5State();
}

class _Ads5State extends State<Ads5> {
  TextEditingController controller = TextEditingController();
  void initState() {
    super.initState();

    // Add a listener to update domainName in AppsCubit
    controller.addListener(() {
      AdsCubit.get(context).visionforMarketing = controller.text;
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.only(start: 18.w, top: 39.h, end: 19.w),
        child: ListView(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeadPage(
              title: S.of(context).Ads,
            ),
            Text(
              S.of(context).Isthereanythingaboutyourvisionfordigitalmarketing,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
            ),
            verticalSpace(28.h),
            CustomDescribtionTextField(

              controller: controller,
              hintText: S.of(context).TypeHere,
              backgroundColor: Color(0xffF9F9F9),
              borderColor: Color(0xffE4E4E4),
              containerHeight: 81.h,
              textStyle:
              TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
            )
          ])
        ]));
  }
}
