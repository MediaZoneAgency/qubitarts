import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
import 'core/service/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await SetupLocatore();
  await CashHelper.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await NotificationService.initialize(); // <-- ADD THIS

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    print('Notification: ${message.notification?.title}');

    final notification = message.notification;
    if (notification != null) {
      NotificationService.showNotification(
        title: notification.title ?? 'No title',
        body: notification.body ?? 'No body',
      );
    }
  });

  runApp(BlocProvider(
    create: (context) => LocalizationCubit(),
    child: QubitartsApp(
      appRouter: AppRouter(),
    ),
  ));
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  print( message.notification?.title);
  final notification = message.notification;
  NotificationService.showNotification(
    title: notification?.title ?? 'No title',
    body: notification?.body ?? 'No body',
  );
  // NotificationService().showNotification(
  //   title: message.notification?.title ?? message.data['title'],
  //   body: message.notification?.body ?? message.data['body'],
  //   payload: message.data['route'],
  // );
}