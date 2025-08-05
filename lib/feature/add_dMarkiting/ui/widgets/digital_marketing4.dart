import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/feature/add_dMarkiting/logic/dmarketing_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';

import '../../../../core/widgts/choose_item.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';

import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';

class DMarketing4 extends StatefulWidget {
  const DMarketing4({super.key});

  @override
  State<DMarketing4> createState() => _DMarketing4State();
}

class _DMarketing4State extends State<DMarketing4> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final cubit = DmarketingCubit.get(context);
    controller.text = cubit.visionformarketing;

    controller.addListener(() {
      cubit.visionformarketing = controller.text;
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
        start: 18.w,
        top: 39.h,
        end: 19.w,
        bottom: 30.h,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadPage(title: S.of(context).DigitalMarketing),
            Text(
              S.of(context).Willyouberunningpaidadvertisingcampaigns,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
            ),
            verticalSpace(4),
            Text(
              S.of(context).YouCanChooseMany,
              style: TextStyles.inter9SemiBoldBlue.copyWith(
                color: const Color(0xff44434375).withOpacity(0.44),
              ),
            ),
            verticalSpace(14),
            BlocBuilder<DmarketingCubit, DmarketingState>(
              builder: (context, state) {
                final cubit = DmarketingCubit.get(context);
                return ChooseItemScreen(
                  featureList: cubit.CampaignPlatform,
                  selectedFeatures: cubit.selectedCampaignPlatform,
                  toggleFeature: cubit.toggleCampaignPlatforms,
                );
              },
            ),
            verticalSpace(13),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            verticalSpace(26),
            Text(
              S.of(context).Isthereanythingaboutyourvisionfordigitalmarketing,
              style:
              TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 17.8.sp),
            ),
            verticalSpace(10),
            CustomDescribtionTextField(
              controller: controller,
              hintText: S.of(context).TypeHere,
              backgroundColor: const Color(0xffF9F9F9),
              borderColor: const Color(0xffE4E4E4),
              containerHeight: 81.h,
              textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
