import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/assets/images.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/core/helpers/spacing.dart';
import 'package:qubitarts/core/theming/colors.dart';
import 'package:qubitarts/core/theming/text_styles.dart';
import 'package:qubitarts/core/widgts/back_to_home.dart';
import 'package:qubitarts/feature/profile/logic/profile_cubit.dart';

import '../../data/model/user_model.dart';
import '../widgets/profile_info_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await ProfileCubit.get(context).fetchUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            print('loading');
            return const Center(child: CircularProgressIndicator(color: ColorsManager.yellow,));
          } else if (state is ProfileSuccessState) {
            print('succes');
            print('user ${ProfileCubit.get(context).user?.displayName}');
            return ListView(
              children: [
                BackToHomeButton(),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 72.r,
                      child: Image.asset(
                        'assets/images/person1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      ProfileCubit.get(context).user?.displayName ?? 'N/A',
                      style: TextStyles.poppins17SemiBoldBlack,
                    ),
                    Text(
                      ProfileCubit.get(context).user?.status ?? 'Unknown Role',
                      style: TextStyles.poppins12RegularBlack.copyWith(
                        color: const Color(0xffABABAB),
                      ),
                    ),
                  ],
                ),
                verticalSpace(29.h),
                ProfileInfoItem(
                  title: 'Your Email',
                  hintText: ProfileCubit.get(context).user?.email ?? 'No email available',
                  preIcon: ImagesManager.mail,
                ),
                ProfileInfoItem(
                  title: 'Your Phone',
                  hintText: ProfileCubit.get(context).user?.phoneNumber ?? 'No phone number available',
                  preIcon: ImagesManager.phone,
                ),
                ProfileInfoItem(
                  title: 'City',
                  hintText: 'Egypt-Cairo',
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 170.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Delete Your Account",
                        style: TextStyles.poppins11SemiBoldred,
                      ),
                      horizontalSpace(3.w),
                      Image.asset(
                        ImagesManager.trash,
                        width: 18.w,
                        height: 18.h,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is ProfileErrorState) {
            return const Center(
              child: Text('Failed to load profile data. Please try again.'),
            );
          }
          return Center(child: Text('empty',style: TextStyles.lato26RegularDarkBlack,),);
        },
      ),
    );
  }
}



