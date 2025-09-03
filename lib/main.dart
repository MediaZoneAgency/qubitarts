import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:qubitarts/qubitarts.dart';
import 'package:qubitarts/core/routing/app_router.dart';
import 'package:qubitarts/firebase_options.dart';
import 'core/db/cash_helper.dart';
import 'core/di/depandancy injection.dart';
import 'core/localization/localization_cubit.dart';
import 'core/service/notification_service.dart';
import 'feature/payment/logic/payment_cubit.dart';
import 'feature/payment/data/repo/payment_repo.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  await CashHelper.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService.initialize();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    final notification = message.notification;
    if (notification != null) {
      NotificationService.showNotification(
        title: notification.title ?? 'No title',
        body: notification.body ?? 'No body',
      );
    }
  });
  await SetupLocatore();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LocalizationCubit>(
          create: (_) => LocalizationCubit(),
        ),
        BlocProvider<KashierCubit>(
          create: (_) => KashierCubit(
            KashierRepository(
              publicKey: 'd4a56ce345c8380589ee83a5d8397f06\$ba5dbdcffd328f91aa9563e84d80ca7049e18be14bfa8c6015642eebefec713504caf718bdfc58d3e4c077b9f0682f58',
              merchantId: '571362c4-24aa-4060-b980-46fc5622dc9b',
            ),
          ),
        ),
      ],
      child: QubitartsApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  final notification = message.notification;
  if (notification != null) {
    NotificationService.showNotification(
      title: notification.title ?? 'No title',
      body: notification.body ?? 'No body',
    );
  }
}
