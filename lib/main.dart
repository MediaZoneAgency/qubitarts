import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/routing/app_router.dart';
import 'package:qubitarts/qubitarts.dart';
import 'package:qubitarts/firebase_options.dart';
import 'core/db/cash_helper.dart';
import 'core/di/depandancy injection.dart';
import 'core/localization/localization_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();
  await SetupLocatore();
  await CashHelper.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Lock to portrait only
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(BlocProvider(
    create: (context) => LocalizationCubit(),
    child: QubitartsApp(
      appRouter: AppRouter(),
    ),
  ));
}
