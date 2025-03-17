import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/localization/localization_cubit.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'generated/l10n.dart';
import 'dart:ui' as ui;
class QubitartsApp extends StatelessWidget {
  final AppRouter appRouter;

  const QubitartsApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        child: BlocBuilder<LocalizationCubit, LocalizationState>(
          builder: (context, localizationState) {
            Locale currentLocale;
            if (localizationState is LocalizationChanged) {
              currentLocale = localizationState.locale;
            } else {
              currentLocale = ui.window.locale;
            }

            return MaterialApp(
              locale: currentLocale,
              navigatorKey: NavigationService.navigatorKey,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              title: 'qubitarts',
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.splashScreen,
              onGenerateRoute: appRouter.generateRoute,
            );
          },
        )
    );
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}