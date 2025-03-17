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

class BusinessDetails extends StatelessWidget {
  const BusinessDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9E9E9),
      body: Container(
        decoration: const BoxDecoration(
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
            BlocBuilder<AddWebsiteCubit, AddWebsiteState>(
              builder: (context, state) {
                return BusinessDetailsProgressBar(
                  currentPageIndex:
                      AddWebsiteCubit.get(context).currentPageIndex, //changed
                  //NewBrandCubit.get(context).currentPageIndex,
                  totalPages: AddWebsiteCubit.get(context).pages.length,

                  width: 60.w,
                );
              },
            ),
            BlocBuilder<AddWebsiteCubit, AddWebsiteState>(
              builder: (context, state) {
                return AddWebsiteCubit.get(context).currentPageIndex == 4?const SizedBox():Container(
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
            BlocBuilder<AddWebsiteCubit, AddWebsiteState>(
              builder: (context, state) {
                return Swiper(

                  loop: false,
                  physics: AddWebsiteCubit.get(context).currentPageIndex == 0
                      ? const NeverScrollableScrollPhysics() // Stop scrolling left
                      : (AddWebsiteCubit.get(context).currentPageIndex ==
                              AddWebsiteCubit.get(context).pages.length - 1
                          ? const NeverScrollableScrollPhysics() // Stop scrolling right
                          : const ScrollPhysics()),
                  onIndexChanged: (index) {
                    AddWebsiteCubit.get(context).changeIndex(index);
                  },
                  controller: SwiperController(),
                  indicatorLayout: PageIndicatorLayout.WARM,
                  containerHeight: 542.h,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(33.r),
                          color: ColorsManager.white),
                      child: AddWebsiteCubit.get(context).pages[index],
                    );
                  },
                  itemCount: AddWebsiteCubit.get(context).pages.length,
                  itemWidth: 327.0.w,
                  itemHeight: 500.0.h,
                  layout: SwiperLayout.TINDER,
                );
              },
            ),
            verticalSpace(26.h),
            BlocBuilder<AddWebsiteCubit, AddWebsiteState>(
                builder: (context, state) {
              return AddWebsiteCubit.get(context).currentPageIndex == 4
                  ? AppTextButton(
                      buttonText: S.of(context).Done,
                      textStyle: TextStyles.inter12SemiBoldWhite,
                      onPressed: () {
                        if(AddWebsiteCubit.get(context).checkSendRequest()){
                          context.pushReplacementNamed(Routes.finalWebsiteRequest);
                          AddWebsiteCubit.get(context).addWebRequest();
                        }
                        else{
                          showSnackBar(context: context, text: S.of(context).Allfieldmustnotbeempty, color: Colors.red,style: TextStyles.inter12SemiBoldWhite);

                        }

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
