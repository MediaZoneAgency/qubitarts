import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/feature/brand_identity/logic/brand_identity_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/choose_item.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';


class BrandIdentity1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 18.w, top: 39.h, end: 19.w),
      child: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadPage(title: S.of(context).BrandIdentity,),
                Text(
                  S.of(context).Describeidealcustomer,
                  style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
                ),
                verticalSpace(7.h),

                BlocBuilder<BrandIdentityCubit, BrandIdentityState>(
                  builder: (context, state) {
                    return ChooseItemScreen(featureList: BrandIdentityCubit.get(context).Customer, toggleFeature: (String  selectedCustomer) {BrandIdentityCubit.get(context).toggleSelectedCustomer(selectedCustomer);  }, selectedFeatures: BrandIdentityCubit.get(context).selectedCustomer,);
                  },
                ),
                Divider(
                  color: Colors.black.withOpacity(0.1),
                  thickness: 1,
                ),
                Text(
                  S.of(context).Whereyourbrandbeused,
                  style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
                ),
                verticalSpace(7.h),

                BlocBuilder<BrandIdentityCubit, BrandIdentityState>(
                  builder: (context, state) {
                    return ChooseItemScreen(featureList: BrandIdentityCubit.get(context).places, toggleFeature: (String  selectedCustomer) {BrandIdentityCubit.get(context).toggleSelectedPlaces(selectedCustomer);  }, selectedFeatures: BrandIdentityCubit.get(context).selectedPlaces,);
                  },
                )
              ]),
        ],
      ),
    );
  }
}