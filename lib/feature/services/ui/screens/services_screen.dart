import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/assets/images.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/core/helpers/spacing.dart';
import 'package:qubitarts/feature/services/logic/service_cubit.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/back_to_home.dart';
import '../widgets/service_card.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      body: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BackToHomeButton(),
              horizontalSpace(41.w),
              Column(
                children: [
                  Image.asset(
                    ImagesManager.agencyLogo,
                    width: 193.w,
                    height: 193.h,
                  ),
                  Text(
                    'Our Services',
                    style: TextStyles.lato18SemiBoldDarkBlack
                        .copyWith(fontSize: 26.sp),
                  )
                ],
              ),
              verticalSpace(16.h),

            ],
          ),
          BlocBuilder<ServiceCubit, ServiceState>(
            builder: (context, state) {
              return ListView.separated(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsetsDirectional.only(start: 20.w,end: 24.w),
                      child: ServiceCard(
                        item: ServiceCubit.get(context).data[index], onTap: () {context.pushNamed(ServiceCubit.get(context).data[index].route);},
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return verticalSpace(24.h);
                  },
                  itemCount: ServiceCubit.get(context).data.length);
            },
          )
        ],
      ),
    );
  }
}
