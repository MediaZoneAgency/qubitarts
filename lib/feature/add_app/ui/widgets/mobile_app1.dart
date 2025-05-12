import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/spacing.dart';
import 'package:qubitarts/core/widgts/choose_item.dart';
import 'package:qubitarts/core/widgts/custom_describtion_text_field.dart';
import 'package:qubitarts/feature/add_website/ui/widgets/head_page.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../logic/apps_cubit.dart';

class MobileApp1 extends StatefulWidget {
  const MobileApp1({super.key});

  @override
  State<MobileApp1> createState() => _MobileApp1State();
}

class _MobileApp1State extends State<MobileApp1> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final cubit = AppsCubit.get(context);
    controller.text = cubit.domainName;

    controller.addListener(() {
      cubit.domainName = controller.text;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _buildFeatureSelector(AppsCubit cubit) {
    return ChooseItemScreen(
      featureList: cubit.Features,
      toggleFeature: cubit.toggleFeature,
      selectedFeatures: cubit.selectedFeatures,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = AppsCubit.get(context);

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(18.w, 39.h, 19.w, 10.h),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadPage(title: S.of(context).MobileApp),
              Text(
                S.of(context).Whatisyourpreferreddomainnameifyouhaveone,
                style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
              ),
              verticalSpace(7),
              Text(
                S.of(context).WriteDomainifyouHave,
                style: TextStyles.inter9SemiBoldBlue.copyWith(
                  color: const Color(0xff44434375).withOpacity(0.44),
                ),
              ),
              verticalSpace(33),
              CustomDescribtionTextField(
                controller: controller,
                hintText: S.of(context).TypeHere,
                backgroundColor: const Color(0xffF9F9F9),
                borderColor: const Color(0xffE4E4E4),
                containerHeight: 81.h,
                textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
              ),
              verticalSpace(20),
              Divider(
                color: Colors.black.withOpacity(0.1),
                thickness: 1,
              ),
              Text(
                S.of(context)
                    .Whatfeaturesorfunctionalitiesdoyouneedcontactformsecommerceblog,
                style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
              ),
              verticalSpace(14.5.h),
              BlocBuilder<AppsCubit, AppsState>(
                builder: (_, __) => _buildFeatureSelector(cubit),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
