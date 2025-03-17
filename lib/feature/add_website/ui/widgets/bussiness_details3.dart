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
import '../../logic/add_website_cubit.dart';

class BusinessDetails3 extends StatefulWidget {
  @override
  State<BusinessDetails3> createState() => _BusinessDetails3State();
}

class _BusinessDetails3State extends State<BusinessDetails3> {
  TextEditingController controller = TextEditingController();
  void initState() {
    super.initState();

    // Add a listener to update domainName in AppsCubit
    controller.addListener(() {
      AddWebsiteCubit.get(context).preferredDomain = controller.text;
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
      padding: EdgeInsetsDirectional.only(start: 18.w, top: 39.h, end: 19.w,bottom: 10.h),
      child: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeadPage(title: S.of(context).Website,),
            Text(
              S.of(context).Whatfeaturesorfunctionalitiesdoyouneedcontactformsecommerceblog,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
            ),
            horizontalSpace(14.5.h),

            BlocBuilder<AddWebsiteCubit, AddWebsiteState>(
              builder: (context, state) {
                return ChooseItemScreen(featureList: AddWebsiteCubit.get(context).Features, toggleFeature: (String feature){AddWebsiteCubit.get(context).toggleFeature(feature);}, selectedFeatures:AddWebsiteCubit.get(context).selectedFeatures);
              },
            ),
            verticalSpace(20.h),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            Text(
              S.of(context).Whatisyourpreferreddomainnameifyouhaveone,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
            ),
            verticalSpace(7.h),
            Text(S.of(context).WriteDomainifyouHave,style: TextStyles.inter9SemiBoldBlue.copyWith(color: Color(0xff44434375).withOpacity(0.44)),),
          verticalSpace(33.h),
          CustomDescribtionTextField(hintText: S.of(context).TypeHere,backgroundColor: Color(0xffF9F9F9),borderColor:Color(0xffE4E4E4) ,containerHeight: 82.h,textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),borderRadius: 11.r,controller: controller,),
          ]),
        ],
      ),
    );
  }
}

