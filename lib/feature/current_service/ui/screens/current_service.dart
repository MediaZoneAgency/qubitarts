import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/project_card.dart';
import '../../logic/current_services_cubit.dart';
import '../widgets/service_card_loader.dart';

class CurrentServiceScreen extends StatefulWidget {
  const CurrentServiceScreen({super.key});

  @override
  State<CurrentServiceScreen> createState() => _CurrentServiceScreenState();
}

class _CurrentServiceScreenState extends State<CurrentServiceScreen> {
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await CurrentServicesCubit.get(context).getRequests();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentServicesCubit, CurrentServicesState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.0.h, bottom: 29.h),
                child: Image.asset(
                  'assets/images/agency.png',
                  height: 40.h,
                  width: 171.5.w,
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(bottom: 12.w, start: 14.w),
                height: 33.5.h,
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return horizontalSpace(8.w);
                    },
                    itemCount: CurrentServicesCubit.get(context)
                        .currentServicesState
                        .length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          CurrentServicesCubit.get(context).changeIndex(index);
                          CurrentServicesCubit.get(context).fetchRequestsByState();
                        },
                        child: Container(
                          //width: 89.w,
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
                          decoration: BoxDecoration(
                              color: CurrentServicesCubit.get(context)
                                          .selectedIndex ==
                                      index
                                  ? ColorsManager.yellow
                                  : Color(0xffF8F8F8),
                              borderRadius: BorderRadius.circular(18.r)),
                          height: 33.5.h,
                          child: Center(
                              child: Text(
                            CurrentServicesCubit.get(context)
                                .currentServicesState[index],
                            style: TextStyles.roboto12RegularBlack
                                .copyWith(fontSize: 10.5.sp),
                            textAlign: TextAlign.center,
                          )),
                        ),
                      );
                    }),
              ),
              BlocBuilder<CurrentServicesCubit, CurrentServicesState>(
                builder: (context, state) {
                  if (state is CurrentServicesLoading) {
                    return const ServiceCardLoader();
                  } else if (state is CurrentServicesError) {
                    return const Text('There is an error, please try again');
                  } else if (CurrentServicesCubit.get(context)
                      .requests
                      .isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        verticalSpace(170.h),
                        Text(
                          S.of(context).Norequestsfound,
                          style: TextStyles.lato33BoldBlack,
                        ),
                        verticalSpace(10.h),
                        Text(
                          '${S.of(context).norequests} ${CurrentServicesCubit.get(context).currentServicesState[CurrentServicesCubit.get(context).selectedIndex]} ',
                          style: TextStyles.lato16MediumGray,
                        )
                      ],
                    );
                  } else if (state is CurrentServicesSuccess) {
                    return ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0.w,
                            ),
                            child: BlocBuilder<CurrentServicesCubit,
                                CurrentServicesState>(
                              builder: (context, state) {
                                return ProjectCard(
                                  id: (index + 1).toString(),
                                  title:
                                      "${CurrentServicesCubit.get(context).requests[index].type} ",
                                  startDate: CurrentServicesCubit.get(context)
                                      .requests[index]
                                      .createdTime!,
                                  status: CurrentServicesCubit.get(context)
                                      .requests[index]
                                      .status!,
                                  stages: [
                                    "UI UX",
                                    "Development",
                                    "Testing",
                                    "Publish"
                                  ],
                                  stageDates: ["25/1", "30/1", "12/2", "25/3"],
                                );
                              },
                            ),
                          );
                        },
                        itemCount:
                            CurrentServicesCubit.get(context).requests.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics());
                  }
                  return Text('empty');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
