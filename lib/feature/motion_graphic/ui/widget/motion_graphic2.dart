import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/feature/add_dMarkiting/ui/widgets/upload_file.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/choose_item.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';
import '../../logic/motion_graphic_cubit.dart';

class MotionGraphic2 extends StatefulWidget{
  @override
  State<MotionGraphic2> createState() => _MotionGraphic2State();
}

class _MotionGraphic2State extends State<MotionGraphic2> {
  TextEditingController controller = TextEditingController();
  void initState() {
    super.initState();

    // Add a listener to update domainName in AppsCubit
    controller.addListener(() {
      MotionGraphicCubit.get(context).brandGuidelines = controller.text;
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
      padding: EdgeInsetsDirectional.only(start: 18.w, top: 39.h, end: 19.w,bottom: 19.h),
      child: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadPage(title: S.of(context).MotionGraphic,),
                Text(
                  S.of(context).Dohavespecificfontstyles,
                  style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
                ),
                horizontalSpace(7.h),
                BlocBuilder<MotionGraphicCubit, MotionGraphicState>(
                  builder: (context, state) {
                    return ChooseItemScreen(featureList: MotionGraphicCubit.get(context).fontStyle, toggleFeature: (String  selectedFontStyle) {MotionGraphicCubit.get(context).toggleSelectedFontStyle(selectedFontStyle);  }, selectedFeatures: MotionGraphicCubit.get(context).selectedFontStyle,);
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
                    S.of(context).Dohavebrandguidelinesorstyleguides,
                    style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
                  ),
                ),

                UploadFile(height: 67.h, background:Color(0xffF6F6F6)),
                Padding(
                  padding:
                  EdgeInsetsDirectional.only( top: 18.h, bottom: 20.h),
                  child:CustomDescribtionTextField(controller:controller,hintText: S.of(context).TypeHere,backgroundColor: Color(0xffF9F9F9),borderColor:Color(0xffE4E4E4) ,containerHeight: 42.h,textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),),

                ),
              ]),
        ],
      ),
    );
  }
}