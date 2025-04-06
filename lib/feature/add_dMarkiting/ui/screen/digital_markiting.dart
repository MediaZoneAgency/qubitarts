import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/error/error_handler.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/core/helpers/spacing.dart';
import 'package:qubitarts/core/routing/routes.dart';
import 'package:qubitarts/core/theming/text_styles.dart';
import 'package:qubitarts/core/widgts/app_text_button.dart';
import 'package:qubitarts/core/widgts/back_to_home.dart';
import 'package:qubitarts/feature/add_dMarkiting/logic/dmarketing_cubit.dart';
import 'package:qubitarts/feature/add_website/logic/add_website_cubit.dart';

import '../../../../core/widgts/custom_service_container_image.dart';
import '../../../../generated/l10n.dart';


class AddDMarketingScreen extends StatelessWidget {
  const AddDMarketingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9E9E9),
      body: ListView(
        children: [
          Row(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackToHomeButton(),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 40.w, top: 20.h, bottom: 34.h),
                child: Image.asset(
                  'assets/images/agency.png',
                  height: 40.h,
                  width: 171.5.w,
                ),
              )
            ],
          ),
        CustomServiceImage(serviceImage: 'assets/images/digital-markiting.png',),
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: 27.w, top: 34.h, bottom: 22.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).DigitalMarketingService,
                  style: TextStyles.lato18SemiBoldDarkBlack
                      .copyWith(fontSize: 26.sp),
                ),
                verticalSpace(14.h),
                Text(
                  S.of(context).OpentheFinXStockapptogetstartedand,
                  style:
                  TextStyles.roboto12RegularBlack.copyWith(fontSize: 14.sp),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 20.w, top: 13.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).BrainStormingtheidea,
                        style: TextStyles.roboto14RegularBlack,
                      ),
                      Text(
                        S.of(context).DesigningtheWebsite,
                        style: TextStyles.roboto14RegularBlack,
                      ),
                      Text(
                        S.of(context).Approvingtheproject,
                        style: TextStyles.roboto14RegularBlack,
                      ),
                      Text(
                        S.of(context).Developingthewebsite,

                        style: TextStyles.roboto14RegularBlack,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Center(
              child: Text(
                S.of(context).SeepreviousWorks,
                style: TextStyles.lato15SemiBoldGray,
              )),
          verticalSpace(15.h),
          BlocBuilder<DmarketingCubit, DmarketingState>(
            builder: (context, state) {
              return SizedBox(
                height: 104.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(DmarketingCubit.get(context).pervious[index],),fit: BoxFit.cover
                            ),
                            boxShadow: [BoxShadow(offset: Offset(0, 4),
                              blurRadius: 4.r,
                              spreadRadius: 0,
                              color: Colors.black.withOpacity(0.07),
                            )],
                            borderRadius: BorderRadius.circular(24.r)
                        ),
                        height: 104.h,
                        width: 156.w,
                        child: SizedBox(),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return horizontalSpace(14.w);
                    },
                    itemCount: DmarketingCubit.get(context).pervious.length),
              );
            },
          ),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 145.0.w,vertical: 24.h),
            child: AppTextButton(
              buttonText: S.of(context).Start,
              textStyle: TextStyles.lato14SemiBoldWhite,
              onPressed: () {
                context.pushNamed(Routes.addDMarketingDetailsScreen);
              },
              backgroundColor: Color(0xff2B2B2B),
              //buttonWidth: 103.w,
              buttonHeight: 35.h,
              borderRadius: 12.r,
            ),
          )
        ],
      ),
    );
  }
}