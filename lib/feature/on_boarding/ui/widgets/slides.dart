import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/feature/on_boarding/logic/onboarding_cubit.dart';
import 'package:qubitarts/feature/on_boarding/ui/widgets/progress_bar.dart';
import 'package:qubitarts/feature/on_boarding/ui/widgets/slide_item.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/font_weight.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';

class Slides extends StatefulWidget {
  const Slides({Key? key}) : super(key: key);

  @override
  State<Slides> createState() => _SlidesState();
}

class _SlidesState extends State<Slides> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
  builder: (context, state) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            onPageChanged: (index) {
              OnboardingCubit.get(context).changePageIndex(index);
            }
            ,controller: _pageController,
            children:
          [
            SlideItem(background:ColorsManager.yellow, title: S.of(context).MobileApp,description:S.of(context).Creatinghighperformanceappswiththebestuserexperience,textColor: Colors.black),
            SlideItem(background:ColorsManager.grayTwo, title: S.of(context).Website,description:S.of(context).Creatingsleekandeasytonavigatewebsites ,textColor: Colors.black,),
            SlideItem(background:ColorsManager.red, title: S.of(context).DigitalMarketing,description:S.of(context).Growyouronlinepresenceatalltimes ,textColor: Colors.white)
            ,SlideItem(background:ColorsManager.perple, title: S.of(context).MotionGraphic,description:S.of(context).Craftingvisuallystunninganimationsthataredynamicandengaging ,textColor: Colors.white)
            ,SlideItem(background:ColorsManager.green, title: S.of(context).Ads,description: S.of(context).Designingcampaignsthatcaptureattentionandgetresults,textColor: Colors.white)
            ,SlideItem(background:Color(0xffF1EEE5), title: S.of(context).PrintOuts,description:S.of(context).Highqualityprintmaterialsthatmakealastingimpression ,textColor: Colors.black)
            ,SlideItem(background:ColorsManager.blue, title: S.of(context).BrandIdentity,description:S.of(context).Creatingmemorableandpowerfulbrands ,textColor: Colors.white)


          ],),
        ),
        ProgressBar(currentPageIndex:OnboardingCubit.get(context).currentPageIndex , totalPages: 7, width: 8.w, height: 8.h)
      ],
    );
  },
);
  }
}

