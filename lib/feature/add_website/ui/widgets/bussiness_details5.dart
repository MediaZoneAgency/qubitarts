import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/widgts/custom_describtion_text_field.dart';
import 'package:qubitarts/feature/add_website/ui/widgets/head_page.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/choose_one.dart';
import '../../../../core/widgts/time_packer.dart';
import '../../../../generated/l10n.dart';
import '../../logic/add_website_cubit.dart';

class BusinessDetails5 extends StatefulWidget {
  @override
  State<BusinessDetails5> createState() => _BusinessDetails5State();
}

class _BusinessDetails5State extends State<BusinessDetails5> {
  TextEditingController controller = TextEditingController();
  void initState() {
    super.initState();

    // Add a listener to update domainName in AppsCubit
    controller.addListener(() {
      AddWebsiteCubit.get(context).businessVision = controller.text;
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
      padding: EdgeInsetsDirectional.only(start: 18.w, top: 39.h, end: 16.w,bottom: 10.h),
      child: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeadPage(title: S.of(context).Website,),
            Text(
             S.of(context).Willprovideimagesforthewebsite,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 15.6.sp),
            ),
            horizontalSpace(17.5),

            BlocBuilder<AddWebsiteCubit, AddWebsiteState>(
              builder: (context, state) {
                return ChooseBetween(selectedValue:AddWebsiteCubit.get(context).isYes, onSelect: (String isYesSelected) {  AddWebsiteCubit.get(context).toggleStateYes(isYesSelected);}, choices: ['Yes','No'],);
              },
            ),
            verticalSpace(36),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            verticalSpace(26),
            Text(
              S.of(context).Isthereanythingaboutyourvisionfordigitalmarketing,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 17.8.sp),
            ),
            verticalSpace(23),
            CustomDescribtionTextField(hintText:S.of(context).TypeHere, controller: controller, backgroundColor: Color(0xffF9F9F9), borderColor: Color(0xffE4E4E4), containerHeight: 81.h, textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),),
          ]),
        ],
      ),);
  }}