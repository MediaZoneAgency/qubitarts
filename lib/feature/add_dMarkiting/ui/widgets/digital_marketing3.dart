import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/theming/colors.dart';
import 'package:qubitarts/feature/add_dMarkiting/logic/dmarketing_cubit.dart';
import 'package:qubitarts/feature/add_dMarkiting/ui/widgets/upload_file.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/Custom_Choose.dart';
import '../../../../core/widgts/choose_item.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../core/widgts/time_packer.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';
import 'custom_range_slider.dart';

class DMarketing3 extends StatefulWidget {
  const DMarketing3({super.key});

  @override
  State<DMarketing3> createState() => _DMarketing3State();
}

class _DMarketing3State extends State<DMarketing3> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final cubit = DmarketingCubit.get(context);
    controller.text = cubit.brandGuideline;

    controller.addListener(() {
      cubit.brandGuideline = controller.text;
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
      padding: EdgeInsetsDirectional.only(start: 18.w, top: 39.h, end: 19.w, bottom: 30.h),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadPage(title: S.of(context).DigitalMarketing),
            Text(
              S.of(context).Doyouhavebrandingguidelines,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
            ),
            verticalSpace(10.h),
            BlocBuilder<DmarketingCubit, DmarketingState>(
              builder: (context, state) {
                return UploadFile(
                  height: 67.h,
                  background: const Color(0xffF6F6F6),
                  Uploed: () {
                    DmarketingCubit.get(context).getPdfAndUpload();
                  },
                );
              },
            ),
            verticalSpace(10.h),
            CustomDescribtionTextField(
              controller: controller,
              hintText: S.of(context).TypeHere,
              backgroundColor: const Color(0xffF9F9F9),
              borderColor: const Color(0xffE4E4E4),
              containerHeight: 42.5.h,
              textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
              borderRadius: 11.r,
            ),
            verticalSpace(20.h),
            Divider(color: Colors.black.withOpacity(0.1), thickness: 1),
            verticalSpace(26.h),
            Text(
              S.of(context).Whatsocialmediaplatformsaremostrelevantforyourbusiness,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 17.8.sp),
            ),
            verticalSpace(7.h),
            Text(
              S.of(context).YouCanChooseMany,
              style: TextStyles.inter9SemiBoldBlue.copyWith(
                color: const Color(0xff44434375).withOpacity(0.44),
              ),
            ),
            verticalSpace(13.h),
            BlocBuilder<DmarketingCubit, DmarketingState>(
              builder: (context, state) {
                final cubit = DmarketingCubit.get(context);
                return ChooseItemScreen(
                  featureList: cubit.Platform,
                  selectedFeatures: cubit.selectedPlatform,
                  toggleFeature: cubit.togglePlatforms,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
