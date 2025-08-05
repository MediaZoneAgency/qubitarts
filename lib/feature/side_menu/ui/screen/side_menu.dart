import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/core/localization/localization_cubit.dart';
import 'package:qubitarts/core/theming/text_styles.dart';
import 'package:qubitarts/feature/profile/logic/profile_cubit.dart';
import '../../../../core/assets/images.dart';
import '../../../../core/db/cached_app.dart';
import '../../../../core/db/cash_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../generated/l10n.dart';
import '../../../ai_chat/data/repo/chat_repo.dart';
import '../../../ai_chat/logic/chat_cubit.dart';
import '../../../ai_chat/ui/chat_screen.dart';
import '../../../nav_bar/logic/nav_bar_cubit.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffF6E9A6),
      shape: RoundedRectangleBorder(
        borderRadius: LocalizationCubit.get(context).locale.languageCode == 'en'
            ? BorderRadius.only(bottomRight: Radius.circular(117.r))
            : BorderRadius.only(bottomLeft: Radius.circular(117.r)),
      ),
      width: 238.w,
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return DrawerHeader(
                    name: ProfileCubit.get(context).user?.displayName ?? '',
                  );
                },
              ),
              buildListTile(context, S.of(context).Home, ImagesManager.sideHome,
                      () {
                    context.pop();
                  }),
              buildListTile(context, S.of(context).Requests,
                  ImagesManager.sideRequest, () {
                    context.pop();
                    NavBarCubit.get(context).changeIndex(1);
                    NavBarCubit.get(context).pageController.jumpToPage(1);
                  }),
              buildListTile(context, S.of(context).chat, ImagesManager.sideChat,
                      () {
                    context.pop();
                    context.pushNamed(Routes.chatScreen);
                  }),
              buildListTile(context, S.of(context).Settings,
                  ImagesManager.sideSetting, () {
                    context.pushNamed(Routes.setting);
                  }),
              buildListTile(context, S.of(context).Bookmarks,
                  ImagesManager.sideBookmark, () {
                    context.pushNamed(Routes.savedBlogs);
                  }),
              buildListTile(context, 'Ai Chat', ImagesManager.sideChat, () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BlocProvider<AiChatCubit>(
                      create: (_) => AiChatCubit(
                        repository: AiChatRepository(
                          baseUrl:
                          'https://marketingstrategy-325557646262.us-central1.run.app',
                        ),
                      ),
                      child: ChatPage(),
                    ),
                  ),
                );
              }),
              buildListTile(
                context,
                S.of(context).Logout,
                ImagesManager.sideLogout,
                    () async {
                  final shouldLogout = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(S.of(context).Logout),
                      content: Text(S.of(context).areYouSureYouWantToLogout),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text(S.of(context).cancel),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text(S.of(context).Logout),
                        ),
                      ],
                    ),
                  );

                  if (shouldLogout == true) {
                    ProfileCubit.get(context).signOut();
                    await CashHelper.clear();
                    CachedApp.clearCache();
                    context.pushNamedAndRemoveUntil(
                      Routes.loginScreen,
                      predicate: (Route<dynamic> route) => false,
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(
      BuildContext context, String title, String icon, Function() onTap) {
    return ListTile(
      title: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              fit: BoxFit.scaleDown,
            ),
            horizontalSpace(24),
            Text(
              title,
              style: TextStyles.inter23MediumBlack.copyWith(fontSize: 19.sp),
            )
          ],
        ),
      ),
      onTap: () {},
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 20.w, top: 20.h, bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: const AssetImage('assets/images/person1.png'),
            backgroundColor: Colors.white,
            radius: 34.5.r,
          ),
          verticalSpace(15),
          Text(
            name,
            style: TextStyles.inter17BoldBlack,
          ),
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.profile);
            },
            child: Text(
              S.of(context).viewProfile,
              style: TextStyles.inter17RegularGray,
            ),
          )
        ],
      ),
    );
  }
}

