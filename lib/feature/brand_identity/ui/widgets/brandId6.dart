import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/feature/add_dMarkiting/ui/widgets/upload_file.dart';
import 'package:qubitarts/feature/brand_identity/logic/brand_identity_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/choose_item.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';

class BrandIdentity6 extends StatefulWidget {
  const BrandIdentity6({super.key});

  @override
  State<BrandIdentity6> createState() => _BrandIdentity6State();
}

class _BrandIdentity6State extends State<BrandIdentity6> {
  TextEditingController controller = TextEditingController();

  void initState() {
    super.initState();

    // Add a listener to update domainName in AppsCubit
    controller.addListener(() {
      BrandIdentityCubit.get(context).visionForDigital = controller.text;
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
          start: 18.w, top: 39.h, end: 19.w, bottom: 19.h),
      child: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeadPage(
              title: S.of(context).BrandIdentity,
            ),
            Text(
              S.of(context).Howdescribeyourbrand,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
            ),
            verticalSpace(11),
            BlocBuilder<BrandIdentityCubit, BrandIdentityState>(
              builder: (context, state) {
                return ChooseItemScreen(
                  featureList: BrandIdentityCubit.get(context).brandVisual,
                  toggleFeature: (String selectedBrandVisual) {
                    BrandIdentityCubit.get(context)
                        .toggleSelectedBrandVisual(selectedBrandVisual);
                  },
                  selectedFeatures:
                      BrandIdentityCubit.get(context).selectedBrandVisual,
                );
              },
            ),
            verticalSpace(11),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            verticalSpace(16),
            Text(
              S.of(context).Isthereanythingaboutyourvisionfordigitalmarketing,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
            ),
            horizontalSpace(7),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 18.h, bottom: 20.h),
              child: CustomDescribtionTextField(
                controller: controller,
                hintText: S.of(context).TypeHere,
                backgroundColor: Color(0xffF9F9F9),
                borderColor: Color(0xffE4E4E4),
                containerHeight: 73.h,
                textStyle:
                    TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
