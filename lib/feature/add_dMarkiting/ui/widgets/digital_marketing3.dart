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
  TextEditingController controller = TextEditingController();
  void initState() {
    super.initState();

    // Add a listener to update domainName in AppsCubit
    controller.addListener(() {
      DmarketingCubit.get(context).brandGuideline = controller.text;
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
      padding: EdgeInsetsDirectional.only(start: 18.w, top: 39.h, end: 19.w,bottom: 20.h),
      child: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeadPage(
              title:S.of(context).DigitalMarketing,
            ),
            Text(
              S.of(context).Doyouhavebrandingguidelines,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
            ),
            BlocBuilder<DmarketingCubit, DmarketingState>(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(
                      end: 25.0.w, top: 10.h, bottom: 10.h),
                  child: UploadFile(height: 67.h, background: Color(0xffF6F6F6)),
                );
              },
            ),
            CustomDescribtionTextField(controller:controller,hintText: S.of(context).TypeHere,backgroundColor: Color(0xffF9F9F9),borderColor:Color(0xffE4E4E4) ,containerHeight: 42.5.h,textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),borderRadius: 11.r,),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            verticalSpace(26.h),
            Text(
              S.of(context).Whatsocialmediaplatformsaremostrelevantforyourbusiness,
              style:
              TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 17.8.sp),
            ),
            Text(
             S.of(context).YouCanChooseMany,
              style: TextStyles.inter9SemiBoldBlue
                  .copyWith(color: Color(0xff44434375).withOpacity(0.44)),
            ),
            verticalSpace(13.h),
            BlocBuilder<DmarketingCubit, DmarketingState>(
              builder: (context, state) {
                return ChooseItemScreen(featureList: DmarketingCubit.get(context).Platform, toggleFeature: (String platform ) { DmarketingCubit.get(context).togglePlatforms(platform); }, selectedFeatures: DmarketingCubit.get(context).selectedPlatform,);
              },
            )
          ]),
        ],
      ),
    );
  }
}