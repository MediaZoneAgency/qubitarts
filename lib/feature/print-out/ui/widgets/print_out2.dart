import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/feature/print-out/logic/print_out_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/choose_item.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../add_dMarkiting/ui/widgets/upload_file.dart';
import '../../../add_website/ui/widgets/head_page.dart';

class PrintOut2 extends StatefulWidget {
  const PrintOut2({super.key});

  @override
  State<PrintOut2> createState() => _PrintOut2State();
}

class _PrintOut2State extends State<PrintOut2> {
  TextEditingController controller = TextEditingController();

  void initState() {
    super.initState();

    // Add a listener to update domainName in AppsCubit
    controller.addListener(() {
      PrintOutCubit.get(context).brandGuidelines = controller.text;
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
              title: S.of(context).PrintOuts,
            ),
            Text(
              S.of(context).IsanyPreferredPaperType,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
            ),
            horizontalSpace(7.h),
            BlocBuilder<PrintOutCubit, PrintOutState>(
              builder: (context, state) {
                return ChooseItemScreen(
                  featureList: PrintOutCubit.get(context).paperType,
                  toggleFeature: (String selectedFontStyle) {
                    PrintOutCubit.get(context)
                        .toggleSelectedPaperType(selectedFontStyle);
                  },
                  selectedFeatures:
                      PrintOutCubit.get(context).selectedPaperType,
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

            UploadFile(height: 67.h, background: Color(0xffF6F6F6)),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 18.h, bottom: 20.h),
              child: CustomDescribtionTextField(
                controller: controller,
                hintText: S.of(context).TypeMoreDetails,
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
