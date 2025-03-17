import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/spacing.dart';
import 'package:qubitarts/core/theming/text_styles.dart';
import 'package:qubitarts/feature/add_website/logic/add_website_cubit.dart';
import 'package:qubitarts/feature/add_website/ui/widgets/head_page.dart';

import '../../../../core/widgts/Custom_Choose.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../generated/l10n.dart';

class BusinessDetails1 extends StatefulWidget {
  @override
  State<BusinessDetails1> createState() => _BusinessDetails1State();
}

class _BusinessDetails1State extends State<BusinessDetails1> {
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void initState() {
    super.initState();

    // Add a listener to update domainName in AppsCubit
    controller.addListener(() {
      AddWebsiteCubit.get(context).businessName = controller.text;
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
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeadPage(
              title: S.of(context).Website,
            ),
            Text(
              S.of(context).WhatisYourBusinessName,
              style: TextStyles.inter25SemiBoldBlack,
            ),
            horizontalSpace(7.h),
            Text(S.of(context).WriteyourBusinessorCompanyName,
                style: TextStyles.inter9SemiBoldBlue
                    .copyWith(color: Color(0xff44434375).withOpacity(0.44))),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  end: 25.0.w, top: 12.h, bottom: 20.h),
              child: Form(

                key: formKey,
                child: CustomDescribtionTextField(

                  controller: controller,
                  hintText:S.of(context).TypeHere,
                  backgroundColor: Color(0xffF9F9F9),
                  borderColor: Color(0xffE4E4E4),
                  containerHeight: 59.5.h,
                  textStyle:
                      TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
                  borderRadius: 11.r,
                ),
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).ChooseIndustry,
                  style: TextStyles.inter25SemiBoldBlack,
                ),
                verticalSpace(5.h),
                Text(
                  S.of(context).WhatindustryYourBusinessis,
                  style: TextStyles.inter9SemiBoldBlue
                      .copyWith(color: Color(0xff44434375).withOpacity(0.44)),
                ),
                verticalSpace(20.h),
                BlocBuilder<AddWebsiteCubit, AddWebsiteState>(
                  builder: (context, state) {
                    return CustomChooseList(
                      customText: S.of(context).PickanIndustry,
                      list: AddWebsiteCubit.get(context).industries,
                      onSelected: (String selectedIndustry) {
                        AddWebsiteCubit.get(context)
                            .toggleSelectedSize(selectedIndustry);
                      },
                    );
                  },
                ),
              ],
            )
          ]),
        ],
      ),
    );
  }
}
