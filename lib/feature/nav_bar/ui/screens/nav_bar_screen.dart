import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qubitarts/core/theming/colors.dart';
import 'package:qubitarts/feature/nav_bar/logic/nav_bar_cubit.dart';

import '../widgets/navbar_container.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({Key? key}) : super(key: key);

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        return Scaffold(

          backgroundColor: Colors.white,
          body: Stack(children: [
            PageView(
              controller: NavBarCubit.get(context).pageController,

              children: NavBarCubit.get(context).screens,
             onPageChanged: (index){
               NavBarCubit.get(context).changeIndex(index);
             },
            ),
            NavBarContainer(pageController: NavBarCubit.get(context).pageController,)
          ]),
        );
      },
    );
  }
}


