import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qubitarts/core/error/error_handler.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/core/helpers/spacing.dart';
import 'package:qubitarts/core/routing/routes.dart';
import 'package:qubitarts/core/theming/text_styles.dart';
import 'package:qubitarts/core/widgts/app_text_form_field.dart';
import 'package:qubitarts/feature/profile/logic/profile_cubit.dart';
import '../../../../generated/l10n.dart';
import '../../../blog/logic/blog_cubit.dart';
import '../../../current_service/logic/current_services_cubit.dart';
import '../../../current_service/ui/widgets/service_card_loader.dart';
import '../../../nav_bar/logic/nav_bar_cubit.dart';
import '../../../profile/ui/widgets/profile_loader.dart';
import '../../../side_menu/ui/screen/side_menu.dart';
import '../widgets/blog_post.dart';
import '../widgets/custom_switch_state.dart';
import '../widgets/hello_container.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/post_loader.dart';
import '../widgets/project_card.dart';
import '../widgets/swiped_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void didChangeDependencies() async {
    super.didChangeDependencies();
    NavBarCubit.get(context).changeIndex(0);
    await ProfileCubit.get(context).fetchUser();
    await BlogCubit.get(context).getPosts();
    await CurrentServicesCubit.get(context).getRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     key: _scaffoldKey,
      drawerEnableOpenDragGesture: false,
      drawer: const CustomDrawer(),
      backgroundColor: const Color(0xffFEDC32),
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  CustomHomeAppBar(
                    openDrawer: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 20.0.w, top: 29.h, bottom: 20.h),
                    child: BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        if (state is ProfileLoadingState) {
                          return ProfileLoader();
                        }
                        if (state is ProfileErrorState) {
                          return Text(
                              'Failed to load profile data. Please try again.');
                        }
                        if (ProfileCubit.get(context).user?.displayName != '') {
                          return HelloContainer(
                            name: ProfileCubit.get(context).user?.displayName ??
                                'N/A',
                          );
                        }
                        return Container(
                          child: Text('N/A'),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 310.h, child: SwipeImageGallery()),
                  verticalSpace(10),
                  // AppTextFormField(
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: const BorderSide(
                  //         color: Color(0xff2C2C2C),
                  //         width: 1.3,
                  //       ),
                  //       borderRadius: BorderRadius.circular(50.0.r),
                  //     ),
                  //     hintText: S.of(context).Searchforanything,
                  //     suffixIcon: Image.asset('assets/images/Search_light.png',
                  //         width: 20.w, height: 25.h),
                  //     backgroundColor: Color(0xff2C2C2C),
                  //     hintStyle: TextStyles.inter16RegularWhite,
                  //     width: 342.w),
                  verticalSpace(12)
                ],
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(66.r),
                    topLeft: Radius.circular(66.r))),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 73.w, vertical: 16.h),
                  child: BlocBuilder<CurrentServicesCubit, CurrentServicesState>(
                    builder: (context,state) {
                      return CustomSwitchState();
                    }
                  ),
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
                          //verticalSpace(170.h),
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
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 130.w, top: 29.h, end: 16.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).QubitartsBlog,
                        style: TextStyles.lato20BoldBlack,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(Routes.blog);
                            },
                            child: Text(
                              S.of(context).SeeMore,
                              style: TextStyles.lato12grayBold
                                  .copyWith(color: Color(0xff797979)),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Color(0xff797979),
                            size: 18.h,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                BlocBuilder<BlogCubit, BlogState>(
                  builder: (context, state) {
                    if (state is BlogLoadingState) {
                      return PostLoader();
                    } else if (state is BlogErrorState) {
                      return Text('error');
                    } else if (BlogCubit.get(context).posts.isNotEmpty) {
                      final post = BlogCubit.get(context).posts;
                      final bool isLiked = BlogCubit.get(context).likes.isEmpty?false:BlogCubit.get(context).likes[0];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 13.h),
                        child: SizedBox(
                          height: 387.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                            itemCount: post.length,
                            itemBuilder: (context,index) {
                              return BlogPostItem(
                                background: Color(0x80f2f2f2),
                                title: post[index].postTitle,
                                description:
                                post[index].postDescription,
                                image: post[index].postPhoto,
                                onTap: () {
                                  context.pushNamed(Routes.postDetails,
                                      arguments: {
                                    'postModel': post[index],
                                        'isLiked': isLiked
                                      });
                                },
                                isLiked: isLiked, like: () {
                                BlogCubit.get(context).likes[index]?BlogCubit.get(context).disLikePost(index,BlogCubit.get(context).posts[index].id):BlogCubit.get(context).likePost(index, post[index].id);
                              },
                              );
                            }, separatorBuilder: (BuildContext context, int index) { return horizontalSpace(16); },
                          ),
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0.h),
                  child: Center(
                      child: Text(
                    S.of(context).OurServices,
                    style: TextStyles.lato33BoldBlack,
                  )),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        serviceHomeCard(
                          title: S.of(context).BrandIdentity,
                          image: 'assets/images/BrandIdentity.png',
                          background: Color(0xffEB7A53),
                          padding: EdgeInsetsDirectional.only(
                              start: 16.w, end: 14.w, bottom: 10.h, top: 2.5.h),
                          onTap: () {
                            context.pushNamed(Routes.brandIdentityScreen);
                          },
                        ),
                        MobileHomeCard()
                      ],
                    ),
                    verticalSpace(9.h),
                    HomeCard(
                      title: S.of(context).Website,
                      image: 'assets/images/website-service.png',
                      background: Color(0xffF6DBC9),
                      onTap: () {

                        context.pushNamed(Routes.addWebsite);
                      },
                    ),
                    verticalSpace(16.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HomeCard(
                              title: S.of(context).PrintOuts,
                              image: 'assets/images/pri.png',
                              background: Color(0xffA8D672),
                              width: 177.w,
                              onTap: () {
                                context.pushNamed(Routes.printOutsScreen);
                              },
                            ),
                            verticalSpace(16.h),
                            serviceHomeCard(
                              title: S.of(context).MotionGraphic,
                              image: 'assets/images/image-motion.png',
                              background: Color(0xff2E2E2E),
                              padding: EdgeInsetsDirectional.only(top: 2.5.h),
                              onTap: () {
                                context.pushNamed(Routes.motionGraphicScreen);
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            HomeCard(
                              title:" ${ S.of(context).DigitalMarketing}",
                              image: 'assets/images/digi.png',
                              background: Color(0xffFFE55E),
                              width: 177.w,
                              onTap: () {
                                context.pushNamed(Routes.addDMarketingScreen);
                              },
                            ),
                            verticalSpace(12.h),
                            HomeCard(
                              title: S.of(context).Ads,
                              image: 'assets/images/ads-cam.png',
                              background: Color(0xffDA73A0),
                              width: 177.w,
                              onTap: () {
                                context.pushNamed(Routes.addAdsScreen);
                              },
                            ),
                          ],
                        )
                      ],
                    )
                  ]),
                )
              ],
            ),
          )

          // ,verticalSpace(100)
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard(
      {super.key,
      required this.title,
      required this.image,
      required this.background,
      this.width,
      required this.onTap});
  final String title;
  final String image;
  final Color background;
  final double? width;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          //height: 293.h,
          width: width,
          padding: EdgeInsetsDirectional.only(top: 2.5.h),
          decoration: BoxDecoration(
              color: background,
              image: DecorationImage(
                  image: AssetImage('assets/images/shadowbackground.png'),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(50.r)),
          child: Column(

              children: [
                Image.asset(
                  'assets/images/Frame.png',
                  width: 36.w,
                  height: 3.5.h,
                ),
                verticalSpace(14.h),
                Text(
                  textAlign: TextAlign.center,
                  overflow:TextOverflow.clip,
                  title,
                  style: TextStyles.workSans21SemiBoldWhite
                      .copyWith(color: Colors.black, fontSize: 24.sp),
                ),
                verticalSpace(13.h),
                Image.asset(
                  image,
                  fit: BoxFit.fill,
                )
              ])),
    );
  }
}

class MobileHomeCard extends StatelessWidget {
  const MobileHomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.addAppScreen);
      },
      child: Container(
        //height: 293.h,
        width: 170.w,
        padding: EdgeInsetsDirectional.only(start: 16.w, end: 14.w, top: 2.5.h),
        decoration: BoxDecoration(
            color: Color(0xffFEDC32),
            image: DecorationImage(
                image: AssetImage('assets/images/shadowbackground.png'),
                fit: BoxFit.fill),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(45.r),
              topLeft: Radius.circular(45.r),
              bottomLeft: Radius.circular(45.r),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Frame.png',
              width: 36.w,
              height: 3.5.h,
            ),
            verticalSpace(14.h),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Mobile\nApp",
                style: TextStyles.workSans21SemiBoldWhite,
              ),
            ),
            verticalSpace(13.h),
            Image.asset(
              'assets/images/mobileapp.png',
              height: 202.h,
            )
          ],
        ),
      ),
    );
  }
}

class serviceHomeCard extends StatelessWidget {
  const serviceHomeCard({
    super.key,
    required this.title,
    required this.image,
    required this.background,
    this.padding,
    required this.onTap,
  });
  final String title;
  final String image;
  final Color background;
  final EdgeInsetsGeometry? padding;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //height: 293.h,
        width: 170.w,
        padding: padding,
        decoration: BoxDecoration(
            color: background,
            image: DecorationImage(
                image: AssetImage('assets/images/shadowbackground.png'),
                fit: BoxFit.fill),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(45.r),
              bottomRight: Radius.circular(45.r),
              bottomLeft: Radius.circular(45.r),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Frame.png',
              width: 36.w,
              height: 3.5.h,
            ),
            verticalSpace(14.h),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextStyles.workSans21SemiBoldWhite,
              ),
            ),
            verticalSpace(13.h),
            Image.asset(
              image,
            )
          ],
        ),
      ),
    );
  }
}
