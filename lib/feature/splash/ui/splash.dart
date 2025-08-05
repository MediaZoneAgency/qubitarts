import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/assets/images.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/core/localization/localization_cubit.dart';
import 'package:qubitarts/core/theming/text_styles.dart';
import 'package:qubitarts/qubitarts.dart';

import '../../../core/db/cash_helper.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgts/background_widget.dart';
import '../../../generated/l10n.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    tohome();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                const Background(
                  backgroundImage: ImagesManager.background,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LocalizationCubit.get(context).locale.languageCode=='en'?Image.asset(
                        ImagesManager.qubitarts,
                        height: 53.h,
                        width: 53.w,
                      ):SizedBox.shrink(),
                      AnimatedTextKit(animatedTexts: [
                        TyperAnimatedText(
                          S.of(context).Ubitarts,
                          textStyle: TextStyles.plusJakartaSans48ExtraBoldWhite,
                        )
                      ]),
                      LocalizationCubit.get(context).locale.languageCode=='en'?SizedBox.shrink():Image.asset(
                        ImagesManager.qubitarts,
                        height: 53.h,
                        width: 53.w,
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  void tohome() {
    Future.delayed(Duration(seconds: 5), () async {
      //context.pushNamed(Routes.welcome);
      //    WidgetsFlutterBinding.ensureInitialized();
      String? token = await CashHelper.getStringScoured(key: Keys.token);
      token == null
          ? NavigationService.navigatorKey.currentContext!
              .pushReplacementNamed(Routes.welcome)
          : NavigationService.navigatorKey.currentContext!
              .pushReplacementNamed(Routes.navigationBar);
      print(token);
      //    //context.pushReplacementNamed(Routes.welcome);
      //    //  DioFactory.setTokenIntoHeaderAfterLogin(response.token!);
      //  if(  token == null){
      //    context.pushReplacementNamed(Routes.welcome);
      //  }else{
      //    if(await SplashCubit.get(context).checkToken(token)){
      //      DioFactory.setTokenIntoHeaderAfterLogin(token);
      //      context.pushReplacementNamed(Routes.navigationBar);
      //    }else{
      //      await CashHelper.clear();
      //      context.pushReplacementNamed(Routes.welcome);
      //    }
      //      //   .then((value) {
      //      // if (value) {
      //      //   context.pushReplacementNamed(Routes.welcome);
      //      // }
      //   // });
    });
  }
}
