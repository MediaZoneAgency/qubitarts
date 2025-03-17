import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/choose_item.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';
import '../../logic/ads_cubit.dart';

class Ads4 extends StatelessWidget {
  const Ads4({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 18.w, top: 39.h, end: 19.w),
      child: ListView(
          children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      HeadPage(title: S.of(context).Ads,),
            Text(
              S.of(context).Willyouberunningpaidadvertisingcampaigns,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
            ),
            verticalSpace(14.h),

            BlocBuilder<AdsCubit, AdsState>(
              builder: (context, state) {
                return ChooseItemScreen(featureList: AdsCubit.get(context).campaignPlatform, toggleFeature: (String  selectedCustomer) {AdsCubit.get(context).toggleSelectedCampaign(selectedCustomer);  }, selectedFeatures: AdsCubit.get(context).selectedCampaignPlatform,);
              },
            ),
            verticalSpace(32.h),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
    Text(
    S.of(context).Describeidealcustomer,
    style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
    ),
            verticalSpace(7.h),

    BlocBuilder<AdsCubit, AdsState>(
    builder: (context, state) {
    return ChooseItemScreen(featureList: AdsCubit.get(context).Customer, toggleFeature: (String  selectedCustomer) {AdsCubit.get(context).toggleSelectedCustomer(selectedCustomer);  }, selectedFeatures: AdsCubit.get(context).selectedCustomer,);
    },
    ),
    ])]));
  }
}