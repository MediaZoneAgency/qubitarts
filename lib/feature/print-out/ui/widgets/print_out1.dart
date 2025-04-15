import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/feature/print-out/logic/print_out_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/choose_item.dart';
import '../../../../core/widgts/choose_one.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';

class PrintOut1 extends StatefulWidget {
  const PrintOut1({super.key});

  @override
  State<PrintOut1> createState() => _PrintOut1State();
}

class _PrintOut1State extends State<PrintOut1> {
  TextEditingController controller = TextEditingController();

  void initState() {
    super.initState();

    // Add a listener to update domainName in AppsCubit
    controller.addListener(() {
      PrintOutCubit.get(context).selectedQuantity= controller.text;
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
      padding: EdgeInsetsDirectional.only(start: 18.w, top: 39.h, end: 19.w),
      child: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeadPage(
              title: S.of(context).PrintOuts,
            ),
            Text(
              S.of(context).WhatstheTypePrintServiceNeeded,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
            ),
            verticalSpace(7),
            BlocBuilder<PrintOutCubit, PrintOutState>(
              builder: (context, state) {
                return ChooseItemScreen(
                  featureList: PrintOutCubit.get(context).printOutType,
                  toggleFeature: (String selectedCustomer) {
                    PrintOutCubit.get(context)
                        .toggleSelectedPrintType(selectedCustomer);
                  },
                  selectedFeatures: PrintOutCubit.get(context).selectedPrintOut,
                );
              },
            ),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            Text(
              S.of(context).QuantityNeeded,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.sp),
            ),
            verticalSpace(5),
            Text(S.of(context).ChooseQuantity,
                style: TextStyles.inter9SemiBoldBlue
                    .copyWith(color: Color(0xff44434375).withOpacity(0.44))),
            verticalSpace(12),
            BlocBuilder<PrintOutCubit, PrintOutState>(
              builder: (context, state) {
                return ChooseBetween(
                  choices: PrintOutCubit.get(context).Quantity,
                  onSelect: (String selectedCustomer) {
                    PrintOutCubit.get(context)
                        .toggleSelectedQuantity(selectedCustomer);
                  },
                  selectedValue: PrintOutCubit.get(context).selectedQuantity,
                );
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  end: 25.0.w, top: 12.h, bottom: 20.h),
              child: CustomDescribtionTextField(
                controller: controller,
                hintText: S.of(context).orTypeYouQuantityHere,
                backgroundColor: Color(0xffF9F9F9),
                borderColor: Color(0xffE4E4E4),
                containerHeight: 43.h,
                textStyle:
                    TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
