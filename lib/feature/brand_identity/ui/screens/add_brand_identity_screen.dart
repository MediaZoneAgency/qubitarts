import 'package:flutter/material.dart';
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
import 'package:qubitarts/feature/brand_identity/logic/brand_identity_cubit.dart';

import '../../../../core/function/snack_bar.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgts/business_details_progress_bar.dart';
import '../../../../generated/l10n.dart';
import '../widgets/add_brand_states_ui.dart';

class AddBrandIdentityScreen extends StatelessWidget {
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
              BlocBuilder<BrandIdentityCubit, BrandIdentityState>(
                builder: (context, state) {
                  return BusinessDetailsProgressBar(
                    currentPageIndex: BrandIdentityCubit.get(context)
                        .currentPageIndex, //changed
                    //NewBrandCubit.get(context).currentPageIndex,
                    totalPages: BrandIdentityCubit.get(context).pages.length,
      
                    width: 44.w,
                  );
                },
              ),
              BlocBuilder<BrandIdentityCubit, BrandIdentityState>(
                builder: (context, state) {
                  return BrandIdentityCubit.get(context).currentPageIndex == 5
                      ? SizedBox()
                      : Container(
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
              BlocBuilder<BrandIdentityCubit, BrandIdentityState>(
                builder: (context, state) {
                  return Swiper(
                    loop: false,
                    physics: BrandIdentityCubit.get(context).currentPageIndex == 0
                        ? const NeverScrollableScrollPhysics() // Stop scrolling left
                        : (BrandIdentityCubit.get(context).currentPageIndex ==
                                BrandIdentityCubit.get(context).pages.length - 1
                            ? const NeverScrollableScrollPhysics() // Stop scrolling right
                            : const ScrollPhysics()),
                    onIndexChanged: (index) {
                      BrandIdentityCubit.get(context).changeIndex(index);
                    },
                    controller: SwiperController(),
                    indicatorLayout: PageIndicatorLayout.WARM,
                    containerHeight: 542.h,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimatedContainer(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(33.r),
                            color: ColorsManager.white),
                        duration: Duration(milliseconds: 300),
                        child: BrandIdentityCubit.get(context).pages[index],
                      );
                    },
                    itemCount: BrandIdentityCubit.get(context).pages.length,
                    itemWidth: 327.0.w,
                    itemHeight: 500.0.h,
                    layout: SwiperLayout.TINDER,
                  );
                },
              ),
              verticalSpace(26.h),
              BlocBuilder<BrandIdentityCubit, BrandIdentityState>(
                  builder: (context, state) {
                return BrandIdentityCubit.get(context).currentPageIndex == 5
                    ? Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 36.w),
                      child: AppTextButton(
                        buttonText: S.of(context).Done,
                        textStyle: TextStyles.inter12SemiBoldWhite,
                        onPressed: () {
      
                          if(BrandIdentityCubit.get(context).checkSendRequest()){
                            BrandIdentityCubit.get(context).addBrandRequest();
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
              AddBrandRequestStateUi()
            ],
          )),
        ),
      ),
    );
  }
}
