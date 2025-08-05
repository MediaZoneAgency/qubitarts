import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/function/snack_bar.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/app_text_button.dart';
import '../../../../core/widgts/business_details_progress_bar.dart';

import '../../../../generated/l10n.dart';
import '../../logic/motion_graphic_cubit.dart';
import '../widget/Add_motion_request_states.dart';

class MotionGraphicDetails extends StatelessWidget {
  const MotionGraphicDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                  verticalSpace(20.h),
                  Center(
                      child: Image.asset(
                        'assets/images/logo-white.png',
                        height: 40.h,
                        width: 171.5.w,
                      )),
                  BlocBuilder<MotionGraphicCubit, MotionGraphicState>(
                    builder: (context, state) {
                      return BusinessDetailsProgressBar(
                        currentPageIndex:
                        MotionGraphicCubit.get(context).currentPageIndex, //changed
      
                        totalPages: MotionGraphicCubit.get(context).pages.length,
      
                        width: 55.w,
                      );
                    },
                  ),
                  BlocBuilder<MotionGraphicCubit, MotionGraphicState>(
                    builder: (context, state) {
                      return MotionGraphicCubit.get(context).currentPageIndex == 4?SizedBox():Container(
                        margin: EdgeInsets.only(bottom: 24.h,left: 28.w,right: 28.w),
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
                  BlocBuilder<MotionGraphicCubit, MotionGraphicState>(
                    builder: (context, state) {
                      return Swiper(
                        loop: false,
                        physics: MotionGraphicCubit.get(context).currentPageIndex == 0
                            ? const NeverScrollableScrollPhysics() // Stop scrolling left
                            : (MotionGraphicCubit.get(context).currentPageIndex ==
                            MotionGraphicCubit.get(context).pages.length - 1
                            ? const NeverScrollableScrollPhysics() // Stop scrolling right
                            : const ScrollPhysics()),
                        onIndexChanged: (index) {
                          MotionGraphicCubit.get(context).changeIndex(index);
                        },
      
                        indicatorLayout: PageIndicatorLayout.WARM,
                        containerHeight: 542.h,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(33.r),
                                color: ColorsManager.white),
                            child: MotionGraphicCubit.get(context).pages[index],
                          );
                        },
                        itemCount: MotionGraphicCubit.get(context).pages.length,
                        itemWidth: 327.0.w,
                        itemHeight: 500.0.h,
                        layout: SwiperLayout.TINDER,
                      );
                    },
                  ),
                  verticalSpace(26.h),
                  BlocBuilder<MotionGraphicCubit, MotionGraphicState>(
                      builder: (context, state) {
                        return MotionGraphicCubit.get(context).currentPageIndex == 4
                            ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 36.w),
                              child: AppTextButton(
                                                      buttonText: S.of(context).Done,
                                                      textStyle: TextStyles.inter12SemiBoldWhite,
                                                      onPressed: () {
                              if(MotionGraphicCubit.get(context).checkSendRequest()){
                                MotionGraphicCubit.get(context).addMotionGraphic();
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
                      }),
                  AddMotionRequestStateUi()
                ],
              )),
        ),
      ),
    );
  }
}