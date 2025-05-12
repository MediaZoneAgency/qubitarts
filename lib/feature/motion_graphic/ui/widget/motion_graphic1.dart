import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/choose_item.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';
import '../../logic/motion_graphic_cubit.dart';

class MotionGraphic1 extends StatefulWidget {
  @override
  State<MotionGraphic1> createState() => _MotionGraphic1State();
}

class _MotionGraphic1State extends State<MotionGraphic1> {
  TextEditingController controller = TextEditingController();
  void initState() {
    super.initState();
    final cubit=MotionGraphicCubit.get(context);
    controller.text=cubit.primaryGoal;
    // Add a listener to update domainName in AppsCubit
    controller.addListener(() {
      cubit.primaryGoal = controller.text;
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
      child: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeadPage(
              title: S.of(context).MotionGraphic,
            ),
            Text(
              S.of(context).Whatprimarygoalofvideo,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
            ),
            horizontalSpace(7.h),
            Text(S.of(context).whatprimarygoalgraphic,
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
                containerHeight: 82.h,
                textStyle:
                    TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            Text(
              S.of(context).Describeidealcustomer,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
            ),
            horizontalSpace(7.h),
            BlocBuilder<MotionGraphicCubit, MotionGraphicState>(
              builder: (context, state) {
                return ChooseItemScreen(
                  featureList: MotionGraphicCubit.get(context).Customer,
                  toggleFeature: (String selectedCustomer) {
                    MotionGraphicCubit.get(context)
                        .toggleSelectedCustomer(selectedCustomer);
                  },
                  selectedFeatures:
                      MotionGraphicCubit.get(context).selectedCustomer,
                );
              },
            )
          ]),
        ],
      ),
    );
  }
}
