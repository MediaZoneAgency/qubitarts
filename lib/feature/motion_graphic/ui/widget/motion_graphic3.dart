import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/feature/add_dMarkiting/ui/widgets/upload_file.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/choose_item.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../core/widgts/time_packer.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';
import '../../logic/motion_graphic_cubit.dart';

class MotionGraphic3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 18.w, top: 39.h, end: 19.w,bottom: 19.h),
      child: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadPage(title: S.of(context).MotionGraphic,),
                Text(
                  S.of(context).Whatcolorpalettebrandcolorsavoid,
                  style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
                ),
                horizontalSpace(7),
                BlocBuilder<MotionGraphicCubit, MotionGraphicState>(
                  builder: (context, state) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: MotionGraphicCubit.get(context).colorPalette.map((palette) {
                     // final isSelected = selectedPaletteId == palette.id;
                      return GestureDetector(
                        onTap: () {
                          MotionGraphicCubit.get(context).toggleStatePalette(palette);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),

                          decoration: BoxDecoration(
                            border: Border.all(
                              color:MotionGraphicCubit.get(context).selectedColorPalette==palette?Color(0xffD8D8D8):Colors.transparent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(palette,height: 86.h,width: 86.w,),
                        ),
                      );
                    }).toList()),);
                  },
                ),

                Divider(
                  color: Colors.black.withOpacity(0.1),
                  thickness: 1,
                ),
                //verticalSpace(16.h),
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
                verticalSpace(24.h),
                BlocBuilder<MotionGraphicCubit, MotionGraphicState>(
  builder: (context, state) {
    return CustomTimePacker(selectDate: (DateTime selectedDate) { MotionGraphicCubit.get(context).selectLaunchDate(selectedDate); }, selectedDate: MotionGraphicCubit.get(context).selectedDeadlineDate);
  },
)


              ]),
        ],
      ),
    );
  }
}