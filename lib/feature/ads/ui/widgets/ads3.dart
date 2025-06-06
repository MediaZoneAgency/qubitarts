import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../core/widgts/time_packer.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';
import '../../logic/ads_cubit.dart';

class Ads3 extends StatefulWidget {
  @override
  State<Ads3> createState() => _Ads3State();
}

class _Ads3State extends State<Ads3> {
  TextEditingController controller = TextEditingController();
  void initState() {
    super.initState();
    final cubit=AdsCubit.get(context);
controller.text=cubit.Usp;

    controller.addListener(() {
      cubit.Usp = controller.text;
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
        padding: EdgeInsetsDirectional.only(
            start: 18.w, top: 39.h, end: 19.w, bottom: 10.h),
        child: ListView(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeadPage(
              title: S.of(context).Ads,
            ),
            Text(
              S.of(context).Whatisyouruniquesellingproposition ,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
            ),verticalSpace(33),
            CustomDescribtionTextField(

              controller: controller,
              hintText: S.of(context).TypeHere,
              backgroundColor: Color(0xffF9F9F9),
              borderColor: Color(0xffE4E4E4),
              containerHeight: 81.h,
              textStyle:
              TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
            ),verticalSpace(20),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            Padding(
              padding:  EdgeInsets.only(top: 16.0.h,bottom: 7.h),
              child: Text(
                S.of(context).WhattimelinelaunchingtheProject,
                style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
              ),
            ),
            Text(S.of(context).Choosedeadline,
                style: TextStyles.inter9SemiBoldBlue
                    .copyWith(color: Color(0xff44434375).withOpacity(0.44))),
            verticalSpace(24),
            BlocBuilder<AdsCubit,AdsState>(
              builder: (context, state) {
                return CustomTimePacker(selectDate: (DateTime selectedDate) { AdsCubit.get(context).selectLaunchDate(selectedDate); }, selectedDate: AdsCubit.get(context).selectedDeadlineDate);
              },
            )
          ])
        ]));
  }
}
