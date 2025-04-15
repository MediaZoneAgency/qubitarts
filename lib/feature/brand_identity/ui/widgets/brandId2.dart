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

class BrandIdentity2 extends StatefulWidget {
  const BrandIdentity2({super.key});

  @override
  State<BrandIdentity2> createState() => _BrandIdentity2State();
}

class _BrandIdentity2State extends State<BrandIdentity2> {
  TextEditingController controller = TextEditingController();

  void initState() {
    super.initState();

    // Add a listener to update domainName in AppsCubit
    controller.addListener(() {
      BrandIdentityCubit.get(context).brandGuidelines = controller.text;
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
              S.of(context).Whatcolorpalettebrandcolorsavoid,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
            )
            ,
            verticalSpace(7),
            BlocBuilder<BrandIdentityCubit, BrandIdentityState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: BrandIdentityCubit.get(context)
                          .colorPalette
                          .map((palette) {
                    // final isSelected = selectedPaletteId == palette.id;
                    return GestureDetector(
                      onTap: () {
                        BrandIdentityCubit.get(context)
                            .toggleStatePalette(palette);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: BrandIdentityCubit.get(context)
                                        .selectedColorPalette ==
                                    palette
                                ? Color(0xffD8D8D8)
                                : Colors.transparent,
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
                  }).toList()),
                );
              },
            ),

            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            //verticalSpace(16.h),
            Padding(
              padding: EdgeInsets.only(top: 16.0.h, bottom: 11.h),
              child: Text(
                S.of(context).Doyouhavebrandingguidelines,
                style:
                    TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
              ),
            ),

            Padding(
              padding: EdgeInsetsDirectional.only(top: 18.h, bottom: 20.h),
              child: CustomDescribtionTextField(
                enabled: false,
                hintText: S.of(context).TypeHere,
                backgroundColor: Color(0xffF9F9F9),
                borderColor: Color(0xffE4E4E4),
                containerHeight: 42.h,
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
