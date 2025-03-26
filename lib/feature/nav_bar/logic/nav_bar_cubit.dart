import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qubitarts/core/assets/images.dart';
import 'package:qubitarts/feature/blog/logic/blog_cubit.dart';
import 'package:qubitarts/feature/home/logic/home_cubit.dart';
import 'package:qubitarts/feature/home/ui/screen/home.dart';
import 'package:qubitarts/feature/profile/logic/profile_cubit.dart';
import 'package:qubitarts/feature/profile/ui/screens/profile_screen.dart';

import '../../blog/ui/screens/blog_screen.dart';
import '../../current_service/logic/current_services_cubit.dart';
import '../../current_service/ui/screens/current_service.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());
  static NavBarCubit get(context)=> BlocProvider.of(context);
//bool isSelected=false;
//  getSelectedIndex(int index){
//  if(selectedIndex==index){
//    isSelected=true;
//    emit(ChangeIndexState());
//  }
//}
  PageController pageController = PageController(initialPage: 0);
  final screens = [
    MultiBlocProvider(
  providers: [
    BlocProvider.value(
  value:  HomeCubit(),
),
    BlocProvider.value(
      value: ProfileCubit(),
    ),
    BlocProvider.value(
      value:  BlogCubit(),
    ),
    BlocProvider(
      create: (context) => CurrentServicesCubit(),
    ),
  ],
  child: HomeScreen(),
),
    BlocProvider(
  create: (context) => CurrentServicesCubit(),
  child: CurrentServiceScreen(),
),
    BlocProvider.value(
  value:  BlogCubit(),
  child: BlogScreen(),
),
    BlocProvider.value(
  value:  ProfileCubit(),
  child: ProfileScreen(),
),

  ];
  List<String> navIcon =[
    ImagesManager.homeWhite
    ,ImagesManager.bag
    ,ImagesManager.blog
    ,ImagesManager.profile

  ];
  List<String> navIconYellow =[
    ImagesManager.homefill
    ,ImagesManager.bagFill
    ,ImagesManager.blogFill
    ,ImagesManager.profileYellow

  ];
  int selectedIndex=0;
  void changeIndex(int index){
    selectedIndex=index;
    emit(ChangeIndexState());
}}
