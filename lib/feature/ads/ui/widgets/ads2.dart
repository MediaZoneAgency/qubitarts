import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/choose_item.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../add_dMarkiting/ui/widgets/custom_range_slider.dart';
import '../../../add_dMarkiting/ui/widgets/upload_file.dart';
import '../../../add_website/ui/widgets/head_page.dart';
import '../../logic/ads_cubit.dart';

class Ads2 extends StatefulWidget {
  const Ads2({super.key});

  @override
  State<Ads2> createState() => _Ads2State();
}

class _Ads2State extends State<Ads2> {

  TextEditingController controller = TextEditingController();
  void initState() {
    super.initState();

    // Add a listener to update domainName in AppsCubit
    controller.addListener(() {
      AdsCubit.get(context).businessGoal = controller.text;
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
              S.of(context).Whatisyourbudgetfordigitalmarketingefforts,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
            ),
            BlocBuilder<AdsCubit, AdsState>(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(
                      end: 25.0.w, top: 12.h, bottom: 20.h),
                  child: CustomRangeSlider(
                    currentRangeValues:
                    AdsCubit.get(context).currentRangeValues,
                    onChanged: (RangeValues values) {
                      AdsCubit.get(context).changeRangeValues(values);
                    },
                  ),
                );
              },
            ),
            verticalSpace(20.h),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            Padding(
              padding:  EdgeInsets.only(top: 16.0.h,bottom: 11.h),
              child: Text(
                S.of(context).Doyouhavebrandingguidelines,
                style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
              ),
            ),

            UploadFile(height: 67.h, background:Color(0xffF6F6F6)),
            Padding(
              padding:
              EdgeInsetsDirectional.only( top: 18.h, bottom: 20.h),
              child:CustomDescribtionTextField(hintText:  S.of(context).TypeMoreDetails,backgroundColor: Color(0xffF9F9F9),borderColor:Color(0xffE4E4E4) ,containerHeight: 42.h,textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),),

            ),
          ]),
        ],
      ),
    );
  }
}