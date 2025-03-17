
import 'package:dio/dio.dart';
import 'package:qubitarts/feature/home/logic/home_cubit.dart';
import 'package:qubitarts/feature/print-out/data/repo/printout_repo.dart';
import 'package:qubitarts/feature/print-out/logic/print_out_cubit.dart';
import 'package:qubitarts/feature/profile/data/repo/profile_repo.dart';
import 'package:qubitarts/feature/profile/logic/profile_cubit.dart';

import '../../feature/add_website/data/repo/web_request_repo.dart';
import '../../feature/add_website/logic/add_website_cubit.dart';
import '../../feature/blog/data/repo/blogs_repo.dart';
import '../../feature/blog/logic/blog_cubit.dart';
import '../../feature/brand_identity/data/repo/brand_request_repo.dart';
import '../../feature/brand_identity/logic/brand_identity_cubit.dart';
import '../../feature/login/data/repo/login_repo.dart';
import '../../feature/login/logic/login_cubit.dart';
import '../../feature/nav_bar/logic/nav_bar_cubit.dart';
import '../../feature/sign_up/data/repo/signup_repo.dart';
import '../../feature/sign_up/logic/sign_up_cubit.dart';


import 'package:get_it/get_it.dart';
final GetIt locator = GetIt.instance;
Future<void> SetupLocatore() async {

  locator.registerLazySingleton<NavBarCubit>(() => NavBarCubit());

 // locator.registerLazySingleton<ApiService>(() => ApiService(dio));
  locator.registerLazySingleton<SignUPRepoImpl>(() =>SignUPRepoImpl());
  locator.registerFactory<SignUpCubit>(() => SignUpCubit());
  locator.registerLazySingleton<LoginRepoImpl>(() => LoginRepoImpl());
  locator.registerFactory<LoginCubit>(() => LoginCubit());
  locator.registerFactory<ProfileRepo>(() => ProfileRepo());
  locator.registerLazySingleton<ProfileCubit>(() => ProfileCubit());
  locator.registerFactory<PostsRepo>(() => PostsRepo());
  locator.registerLazySingleton<BlogCubit>(() => BlogCubit());
  locator.registerLazySingleton<HomeCubit>(() => HomeCubit());
  locator.registerFactory<webRequestRepo>(() => webRequestRepo());
  locator.registerLazySingleton<AddWebsiteCubit>(() => AddWebsiteCubit());
  locator.registerFactory<BrandRequestRepo>(() => BrandRequestRepo());
  locator.registerLazySingleton<BrandIdentityCubit>(() => BrandIdentityCubit());
  locator.registerFactory<PrintoutRequestRepo>(() => PrintoutRequestRepo());
  locator.registerLazySingleton<PrintOutCubit>(() => PrintOutCubit());
}