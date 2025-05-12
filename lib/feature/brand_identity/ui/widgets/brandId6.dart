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

class BrandIdentity6 extends StatefulWidget {
  const BrandIdentity6({super.key});

  @override
  State<BrandIdentity6> createState() => _BrandIdentity6State();
}

class _BrandIdentity6State extends State<BrandIdentity6> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final cubit = BrandIdentityCubit.get(context);
    controller.text = cubit.visionForDigital;

    controller.addListener(() {
      cubit.visionForDigital = controller.text;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _buildBrandVisualSelector(BrandIdentityCubit cubit) {
    return ChooseItemScreen(
      featureList: cubit.brandVisual,
      selectedFeatures: cubit.selectedBrandVisual,
      toggleFeature: cubit.toggleSelectedBrandVisual,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BrandIdentityCubit.get(context);

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(18.w, 39.h, 19.w, 19.h),
      child: ListView(
        children: [
          HeadPage(title: S.of(context).BrandIdentity),

          Text(
            S.of(context).Howdescribeyourbrand,
            style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
          ),
          verticalSpace(11),

          BlocBuilder<BrandIdentityCubit, BrandIdentityState>(
            builder: (_, __) => _buildBrandVisualSelector(cubit),
          ),

          verticalSpace(11),
          Divider(color: Colors.black.withOpacity(0.1), thickness: 1),
          verticalSpace(16),

          Text(
            S.of(context).Isthereanythingaboutyourvisionfordigitalmarketing,
            style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
          ),
          verticalSpace(7),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 18.h),
            child: CustomDescribtionTextField(
              controller: controller,
              hintText: S.of(context).TypeHere,
              backgroundColor: const Color(0xffF9F9F9),
              borderColor: const Color(0xffE4E4E4),
              containerHeight: 73.h,
              textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
