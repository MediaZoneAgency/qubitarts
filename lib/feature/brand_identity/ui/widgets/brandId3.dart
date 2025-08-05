import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/feature/brand_identity/logic/brand_identity_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/choose_item.dart';
import '../../../../core/widgts/time_packer.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';


class BrandIdentity3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 18.w, top: 39.h, end: 19.w,bottom: 19.h),
      child: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadPage(title: S.of(context).BrandIdentity,),
                Text(
                  S.of(context).Dohavespecificfontstyles,
                  style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
                ),
                verticalSpace(7),
                BlocBuilder<BrandIdentityCubit,BrandIdentityState>(
                  builder: (context, state) {
                    return ChooseItemScreen(featureList: BrandIdentityCubit.get(context).fontStyle, toggleFeature: (String  selectedFontStyle) {BrandIdentityCubit.get(context).toggleSelectedFontStyle(selectedFontStyle);  }, selectedFeatures: BrandIdentityCubit.get(context).selectedFontStyle,);
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
                BlocBuilder<BrandIdentityCubit,BrandIdentityState>(
                  builder: (context, state) {
                    return CustomTimePacker(selectDate: (DateTime selectedDate) { BrandIdentityCubit.get(context).selectLaunchDate(selectedDate); }, selectedDate: BrandIdentityCubit.get(context).selectedDeadlineDate);
                  },
                )


              ]),
        ],
      ),
    );
  }
}