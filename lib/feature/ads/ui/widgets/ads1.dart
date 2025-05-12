import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/choose_item.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';
import '../../logic/ads_cubit.dart';

class Ads1 extends StatefulWidget {
  const Ads1({super.key});

  @override
  State<Ads1> createState() => _Ads1State();
}

class _Ads1State extends State<Ads1> {

  TextEditingController controller = TextEditingController();
  void initState() {
    super.initState();
final cubit=AdsCubit.get(context);
controller.text=cubit.businessGoal;
    // Add a listener to update domainName in AppsCubit
    controller.addListener(() {
      cubit.businessGoal = controller.text;
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
      child: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeadPage(
              title: S.of(context).Ads,
            ),
            Text(
              S.of(context).Whatareyourbusinessgoalsandobjectivesfordigitalmarketing,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
            ),
            verticalSpace(33.h),
            CustomDescribtionTextField(

              controller: controller,
              hintText: S.of(context).TypeHere,
              backgroundColor: Color(0xffF9F9F9),
              borderColor: Color(0xffE4E4E4),
              containerHeight: 81.h,
              textStyle:
              TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
            ),
            verticalSpace(20.h),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            Text(
              S.of(context).Whatsocialmediaplatformsaremostrelevantforyourbusiness,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
            ),
            horizontalSpace(14.5.h),
            BlocBuilder<AdsCubit, AdsState>(
              builder: (context, state) {
                return ChooseItemScreen(
                    featureList: AdsCubit.get(context).Platform,
                    toggleFeature: (String feature) {
                      AdsCubit.get(context).togglePlatforms(feature);
                    },
                    selectedFeatures: AdsCubit.get(context).selectedPlatform);
              },
            ),
          ]),
        ],
      ),
    );
  }
}