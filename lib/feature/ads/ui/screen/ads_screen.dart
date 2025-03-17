
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/extensions.dart';

import '../../../../core/function/snack_bar.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/app_text_button.dart';
import '../../../../core/widgts/business_details_progress_bar.dart';
import '../../../../generated/l10n.dart';
import '../../logic/ads_cubit.dart';

class AdsDetails extends StatelessWidget {
  const AdsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9E9E9),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/website-background.png',
                ),
                fit: BoxFit.fill)),
        child: SafeArea(
            child: Column(
              children: [
                verticalSpace(20.h),
                Center(
                    child: Image.asset(
                      'assets/images/logo-white.png',
                      height: 40.h,
                      width: 171.5.w,
                    )),
                BlocBuilder<AdsCubit, AdsState>(
                  builder: (context, state) {
                    return BusinessDetailsProgressBar(
                      currentPageIndex:
                      AdsCubit.get(context).currentPageIndex, //changed

                      totalPages: AdsCubit.get(context).pages.length,

                      width: 62.w,
                    );
                  },
                ),
                BlocBuilder<AdsCubit, AdsState>(
                  builder: (context, state) {
                    return AdsCubit.get(context).currentPageIndex == 4?SizedBox():Container(
                      margin: EdgeInsets.only(bottom: 24.h),
                      decoration: BoxDecoration(
                          color: const Color(0x26d9d9d9),
                          borderRadius: BorderRadius.circular(57.r)),
                      width: 327.w,
                      height: 42.h,
                      child: Center(
                          child: Text(
                            S.of(context).SwipeLeftForNextQuestion,
                            style: TextStyles.inter12SemiBoldWhite,
                          )),
                    );
                  },
                ),
                BlocBuilder<AdsCubit, AdsState>(
                  builder: (context, state) {
                    return Swiper(
                      loop: false,
                      physics: AdsCubit.get(context).currentPageIndex == 0
                          ? const NeverScrollableScrollPhysics() // Stop scrolling left
                          : (AdsCubit.get(context).currentPageIndex ==
                          AdsCubit.get(context).pages.length - 1
                          ? const NeverScrollableScrollPhysics() // Stop scrolling right
                          : const ScrollPhysics()),
                      onIndexChanged: (index) {
                        AdsCubit.get(context).changeIndex(index);
                      },

                      indicatorLayout: PageIndicatorLayout.WARM,
                      containerHeight: 542.h,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(33.r),
                              color: ColorsManager.white),
                          child: AdsCubit.get(context).pages[index],
                        );
                      },
                      itemCount: AdsCubit.get(context).pages.length,
                      itemWidth: 327.0.w,
                      itemHeight: 500.0.h,
                      layout: SwiperLayout.TINDER,
                    );
                  },
                ),
                verticalSpace(26.h),
                BlocBuilder<AdsCubit, AdsState>(
                    builder: (context, state) {
                      return AdsCubit.get(context).currentPageIndex == 4
                          ? AppTextButton(
                        buttonText: S.of(context).Done,
                        textStyle: TextStyles.inter12SemiBoldWhite,
                        onPressed: () {
                          if(AdsCubit.get(context).checkSendRequest()){
                            context.pushReplacementNamed(Routes.addAppFinalScreen);
                            AdsCubit.get(context).addAppRequest();
                          }
                          else  {return showSnackBar(context: context, text: S.of(context).Allfieldmustnotbeempty, color: Colors.red,style: TextStyles.inter12SemiBoldWhite);}

                          //AdsCubit.get(context).addAdsRequest();
                        },
                        backgroundColor: Color(0x26D9D9D9),
                        buttonWidth: 184.w,
                        buttonHeight: 42.h,
                        borderRadius: 52.r,
                      )
                          : SizedBox();
                    })
              ],
            )),
      ),
    );
  }
}