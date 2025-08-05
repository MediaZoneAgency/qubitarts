import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/spacing.dart';
import 'package:qubitarts/core/theming/text_styles.dart';
import 'package:qubitarts/core/widgts/custom_describtion_text_field.dart';
import 'package:qubitarts/feature/add_website/logic/add_website_cubit.dart';
import 'package:qubitarts/feature/add_website/ui/widgets/head_page.dart';

import '../../../../core/widgts/choose_one.dart';
import '../../../../generated/l10n.dart';

class BusinessDetails2 extends StatefulWidget {
  @override
  State<BusinessDetails2> createState() => _BusinessDetails2State();
}

class _BusinessDetails2State extends State<BusinessDetails2> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    final cubit = AddWebsiteCubit.get(context);

    controller.text = cubit.businessDescription;


    controller.addListener(() {
      cubit.businessDescription = controller.text;
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
          start: 18.w, top: 39.h, end: 19.w, bottom: 10.h),
      child: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeadPage(
              title: S.of(context).Website,
            ),
            Text(
              S.of(context).IsYourBusinessNeworOldintheMarket,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 20.sp),
            ),
            horizontalSpace(14.5.h),
            BlocBuilder<AddWebsiteCubit, AddWebsiteState>(
              builder: (context, state) {
                return ChooseBetween(
                  selectedValue: AddWebsiteCubit.get(context).isNew,
                  onSelect: (String isYesSelected) {
                    AddWebsiteCubit.get(context).toggleState(isYesSelected);
                  },
                  choices: const ['New', 'Old'],
                );
              },
            ),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            verticalSpace(19.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).DescribeYourBusiness,
                  style: TextStyles.inter25SemiBoldBlack,
                ),
                verticalSpace(5.h),
                Text(
                  S
                      .of(context)
                      .Describewhatyourbusinessdoandanydetailsyouwantustoknow,
                  style: TextStyles.inter9SemiBoldBlue
                      .copyWith(color: Color(0xff44434375).withOpacity(0.44)),
                ),
                verticalSpace(20.h),
                CustomDescribtionTextField(
                  hintText: S.of(context).TypeHere,
                  backgroundColor: Color(0xffF9F9F9),
                  borderColor: Color(0xffE4E4E4),
                  containerHeight: 81.h,
                  textStyle:
                      TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
                  borderRadius: 11.r,
                  controller: controller,
                  enabled: true,
                ),
              ],
            )
          ]),
        ],
      ),
    );
  }
}
