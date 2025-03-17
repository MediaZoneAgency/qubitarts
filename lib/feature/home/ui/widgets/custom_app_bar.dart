import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/feature/profile/data/model/user_model.dart';
import 'package:qubitarts/feature/profile/logic/profile_cubit.dart';

import '../../../../core/assets/images.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../profile/data/repo/profile_repo.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key, required this.openDrawer,
  });
final Function() openDrawer;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsetsDirectional.only(start: 18.w, top: 12.h, end: 25.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: openDrawer,
                      child: SvgPicture.asset(ImagesManager.sort)),
                  Container(
                    margin: EdgeInsetsDirectional.only(start: 4.w),
                    child: GestureDetector(

                      child: Center(
                        child: Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        context.pushNamed(Routes.notification);
                      },
                    ),
                    height: 46.h,
                    width: 46.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xff2C2C2C)),
                  )
                ],
              ),
              GestureDetector(
                onTap: () async {
                  context.pushNamed(Routes.profile);
                  // ProfileCubit.get(context).fetchUser();
                },
                child: CircleAvatar(
                  radius: 26.r,
                  child: Image.asset('assets/images/person1.png'),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
