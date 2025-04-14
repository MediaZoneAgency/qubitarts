import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/error/error_handler.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/core/helpers/spacing.dart';
import 'package:qubitarts/core/routing/routes.dart';
import 'package:qubitarts/core/theming/text_styles.dart';
import 'package:qubitarts/core/widgts/app_text_button.dart';
import 'package:qubitarts/feature/add_website/logic/add_website_cubit.dart';

import '../../../../core/function/snack_bar.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgts/business_details_progress_bar.dart';
import '../../../../generated/l10n.dart';
import '../../logic/apps_cubit.dart';

class MobileAppDetails extends StatelessWidget {
  const MobileAppDetails({Key? key}) : super(key: key);

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
            child: ListView(
              children: [
                verticalSpace(20),
                Center(
                    child: Image.asset(
                      'assets/images/logo-white.png',
                      height: 40.h,
                      width: 171.5.w,
                    )),
                BlocBuilder<AppsCubit, AppsState>(
                  builder: (context, state) {
                    return BusinessDetailsProgressBar(
                      currentPageIndex:
                      AppsCubit.get(context).currentPageIndex, //changed

                      totalPages: AppsCubit.get(context).pages.length,

                      width: 62.w,
                    );
                  },
                ),
                BlocBuilder<AppsCubit, AppsState>(
                  builder: (context, state) {
                    return AppsCubit.get(context).currentPageIndex == 3?SizedBox():
                    Container(
                      margin: EdgeInsets.only(bottom: 24.h,left: 26.w,right: 26.w),
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
                BlocBuilder<AppsCubit, AppsState>(
                  builder: (context, state) {
                    return Swiper(
                      loop: false,
                      physics: AppsCubit.get(context).currentPageIndex == 0
                          ? const NeverScrollableScrollPhysics() // Stop scrolling left
                          : (AppsCubit.get(context).currentPageIndex ==
                          AppsCubit.get(context).pages.length - 1
                          ? const NeverScrollableScrollPhysics() // Stop scrolling right
                          : const ScrollPhysics()),
                      onIndexChanged: (index) {
                        AppsCubit.get(context).changeIndex(index);
                      },

                      indicatorLayout: PageIndicatorLayout.WARM,
                      containerHeight: 542.h,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(33.r),
                              color: ColorsManager.white),
                          child: AppsCubit.get(context).pages[index],
                        );
                      },
                      itemCount: AppsCubit.get(context).pages.length,
                      itemWidth: 327.0.w,
                      itemHeight: 500.0.h,
                      layout: SwiperLayout.TINDER,
                    );
                  },
                ),
                verticalSpace(26),
                BlocBuilder<AppsCubit, AppsState>(
                    builder: (context, state) {
                      return AppsCubit.get(context).currentPageIndex == 3
                          ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 45.w),
                            child: AppTextButton(
                                                    buttonText: S.of(context).Done,
                                                    textStyle: TextStyles.inter12SemiBoldWhite,
                                                    onPressed: () {

                            if(AppsCubit.get(context).checkSendRequest()){
                              context.pushReplacementNamed(Routes.addAppFinalScreen);
                              AppsCubit.get(context).addAppRequest();
                            }
                            else{
                              showSnackBar(context: context, text: S.of(context).Allfieldmustnotbeempty, color: Colors.red,style: TextStyles.inter12SemiBoldWhite);

                            }

                                                    },
                                                    backgroundColor: Color(0x26D9D9D9),
                                                    buttonWidth: 184,
                                                    buttonHeight: 42.h,
                                                    borderRadius: 52.r,
                                                  ),
                          )
                          : SizedBox();
                    })
              ],
            )),
      ),
    );
  }
}
