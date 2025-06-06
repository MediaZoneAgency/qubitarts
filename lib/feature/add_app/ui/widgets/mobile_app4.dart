import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';
import '../../logic/apps_cubit.dart';

class MobileApp4 extends StatefulWidget {
  const MobileApp4({super.key});

  @override
  State<MobileApp4> createState() => _MobileApp4State();
}

class _MobileApp4State extends State<MobileApp4> {
  final TextEditingController visionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final cubit = AppsCubit.get(context);
    visionController.text = cubit.visionForDigital;

    visionController.addListener(() {
      cubit.visionForDigital = visionController.text;
    });
  }

  @override
  void dispose() {
    visionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 18.w, top: 39.h, end: 16.w),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadPage(title: S.of(context).MobileApp),
              Text(
                S.of(context)
                    .Isthereanythingelseyoudliketoshareaboutourvisionfordigitalmarketing,
                style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
              ),
              verticalSpace(17.5),
              CustomDescribtionTextField(
                controller: visionController,
                hintText: S.of(context).TypeHere,
                backgroundColor: const Color(0xffF9F9F9),
                borderColor: const Color(0xffE4E4E4),
                containerHeight: 81.h,
                textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
