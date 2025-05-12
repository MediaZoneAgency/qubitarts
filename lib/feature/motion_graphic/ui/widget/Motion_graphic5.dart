import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/feature/add_dMarkiting/ui/widgets/upload_file.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/choose_item.dart';
import '../../../../core/widgts/choose_one.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../core/widgts/time_packer.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';
import '../../logic/motion_graphic_cubit.dart';

class MotionGraphic5 extends StatefulWidget {
  @override
  State<MotionGraphic5> createState() => _MotionGraphic5State();
}

class _MotionGraphic5State extends State<MotionGraphic5> {
  TextEditingController controller = TextEditingController();
  void initState() {
    super.initState();
final cubit=MotionGraphicCubit.get(context);
controller.text=cubit.visionForMarketing;
    // Add a listener to update domainName in AppsCubit
    controller.addListener(() {
      cubit.visionForMarketing = controller.text;
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
              title: S.of(context).MotionGraphic,
            ),
            Text(
              S.of(context).Doscriptorstoryboardready,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
            ),
            horizontalSpace(7.h),
            Text(S.of(context).YouCanChooseMany,
                style: TextStyles.inter9SemiBoldBlue
                    .copyWith(color: Color(0xff44434375).withOpacity(0.44))),

            BlocBuilder<MotionGraphicCubit, MotionGraphicState>(
              builder: (context, state) {
                return ChooseBetween(
                  selectedValue: MotionGraphicCubit.get(context).isYes,
                  onSelect: (String selectedValue) {
                    MotionGraphicCubit.get(context)
                        .toggleStateYes(selectedValue);
                  },
                  choices: [S.of(context).Yes, S.of(context).No],
                );
              },
            ),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            //verticalSpace(16.h),
            Padding(
              padding: EdgeInsets.only(top: 16.0.h, bottom: 7.h),
              child: Text(
                S.of(context).Isthereaboutyourvisionfordigitalmarketing,
                style:
                    TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 18.h, bottom: 20.h),
              child: CustomDescribtionTextField(
                enabled: true,
                controller: controller,
                hintText: S.of(context).TypeHere,
                backgroundColor: Color(0xffF9F9F9),
                borderColor: Color(0xffE4E4E4),
                containerHeight: 82.h,
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
