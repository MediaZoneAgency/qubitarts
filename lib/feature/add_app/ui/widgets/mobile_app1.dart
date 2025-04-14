import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/spacing.dart';
import 'package:qubitarts/core/widgts/choose_item.dart';
import 'package:qubitarts/core/widgts/choose_one.dart';
import 'package:qubitarts/core/widgts/custom_describtion_text_field.dart';
import 'package:qubitarts/feature/add_website/ui/widgets/head_page.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../logic/apps_cubit.dart';

class mobileapp1 extends StatefulWidget {
  const mobileapp1({super.key});

  @override
  State<mobileapp1> createState() => _mobileapp1State();
}

class _mobileapp1State extends State<mobileapp1> {

  TextEditingController controller = TextEditingController();
  void initState() {
    super.initState();

    // Add a listener to update domainName in AppsCubit
    controller.addListener(() {
      AppsCubit.get(context).domainName = controller.text;
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
              title: S.of(context).MobileApp,
            ),
            Text(
              S.of(context).Whatisyourpreferreddomainnameifyouhaveone,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
            ),
            verticalSpace(7),
            Text(
              S.of(context).WriteDomainifyouHave,
              style: TextStyles.inter9SemiBoldBlue
                  .copyWith(color: Color(0xff44434375).withOpacity(0.44)),
            ),
            verticalSpace(33.h),
            CustomDescribtionTextField(

              controller: controller,
              hintText: S.of(context).TypeHere,
              backgroundColor: Color(0xffF9F9F9),
              borderColor: Color(0xffE4E4E4),
              containerHeight: 81.h,
              textStyle:
                  TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
            ),
            verticalSpace(20.h),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            Text(
              S.of(context).Whatfeaturesorfunctionalitiesdoyouneedcontactformsecommerceblog,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
            ),
            horizontalSpace(14.5.h),
            BlocBuilder<AppsCubit, AppsState>(
              builder: (context, state) {
                return ChooseItemScreen(
                    featureList: AppsCubit.get(context).Features,
                    toggleFeature: (String feature) {
                      AppsCubit.get(context).toggleFeature(feature);
                    },
                    selectedFeatures: AppsCubit.get(context).selectedFeatures);
              },
            ),
          ]),
        ],
      ),
    );
  }
}
