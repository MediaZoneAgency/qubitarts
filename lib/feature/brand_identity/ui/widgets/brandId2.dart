import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/feature/brand_identity/logic/brand_identity_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';

class BrandIdentity2 extends StatefulWidget {
  const BrandIdentity2({super.key});

  @override
  State<BrandIdentity2> createState() => _BrandIdentity2State();
}

class _BrandIdentity2State extends State<BrandIdentity2> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final cubit = BrandIdentityCubit.get(context);
    controller.text = cubit.brandGuidelines;

    controller.addListener(() {
      cubit.brandGuidelines = controller.text;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _buildColorPaletteSelector(BrandIdentityCubit cubit) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: cubit.colorPalette.map((palette) {
          final isSelected = cubit.selectedColorPalette == palette;
          return GestureDetector(
            onTap: () => cubit.toggleStatePalette(palette),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? const Color(0xffD8D8D8) : Colors.transparent,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                palette,
                height: 86.h,
                width: 86.w,
              ),
            ),
          );
        }).toList(),
      ),
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
            S.of(context).Whatcolorpalettebrandcolorsavoid,
            style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
          ),
          verticalSpace(7),

          BlocBuilder<BrandIdentityCubit, BrandIdentityState>(
            builder: (_, __) => _buildColorPaletteSelector(cubit),
          ),

          Divider(color: Colors.black.withOpacity(0.1), thickness: 1),
          Padding(
            padding: EdgeInsets.only(top: 16.h, bottom: 11.h),
            child: Text(
              S.of(context).Doyouhavebrandingguidelines,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 18.h),
            child: CustomDescribtionTextField(
              controller: controller,
              hintText: S.of(context).TypeHere,
              backgroundColor: const Color(0xffF9F9F9),
              borderColor: const Color(0xffE4E4E4),
              containerHeight: 42.h,
              textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
