import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubitarts/core/di/depandancy%20injection.dart';
import 'package:qubitarts/feature/add_app/logic/apps_cubit.dart';
import 'package:qubitarts/feature/add_website/logic/add_website_cubit.dart';
import 'package:qubitarts/feature/ads/logic/ads_cubit.dart';
import 'package:qubitarts/feature/blog/logic/blog_cubit.dart';
import 'package:qubitarts/feature/blog/ui/screens/blog_screen.dart';
import 'package:qubitarts/feature/brand_identity/ui/widgets/brandId7.dart';
import 'package:qubitarts/feature/chat/logic/chat_cubit.dart';
import 'package:qubitarts/feature/chat/ui/screen/Chat.dart';
import 'package:qubitarts/feature/forget_password/logic/forget_password_cubit.dart';
import 'package:qubitarts/feature/forget_password/ui/screens/reset_password.dart';
import 'package:qubitarts/feature/login/ui/screen/login_screen.dart';
import 'package:qubitarts/feature/motion_graphic/ui/widget/Motion_graphic6.dart';
import 'package:qubitarts/feature/nav_bar/logic/nav_bar_cubit.dart';
import 'package:qubitarts/feature/nav_bar/ui/screens/nav_bar_screen.dart';
import 'package:qubitarts/feature/notification/logic/notification_cubit.dart';
import 'package:qubitarts/feature/on_boarding/logic/onboarding_cubit.dart';
import 'package:qubitarts/feature/on_boarding/ui/screen/on_boarding_screen.dart';
import 'package:qubitarts/feature/one_service/logic/one_service_cubit.dart';
import 'package:qubitarts/feature/print-out/logic/print_out_cubit.dart';
import 'package:qubitarts/feature/print-out/ui/widgets/print_out5.dart';
import 'package:qubitarts/feature/profile/logic/profile_cubit.dart';
import 'package:qubitarts/feature/sign_up/logic/sign_up_cubit.dart';
import 'package:qubitarts/feature/sign_up/ui/screens/sign_up_screen.dart';

import '../../feature/add_app/ui/screen/add_app_screen.dart';
import '../../feature/add_app/ui/screen/mobile_app.dart';
import '../../feature/add_app/ui/widgets/mobile_app5.dart';
import '../../feature/add_dMarkiting/logic/dmarketing_cubit.dart';
import '../../feature/add_dMarkiting/ui/screen/add_dMarketing_screen.dart';
import '../../feature/add_dMarkiting/ui/screen/digital_markiting.dart';
import '../../feature/add_dMarkiting/ui/widgets/digital_marketing5.dart';
import '../../feature/add_website/ui/screens/add_website_screen.dart';
import '../../feature/add_website/ui/screens/business_details1.dart';
import '../../feature/add_website/ui/widgets/bussiness_details6.dart';
import '../../feature/ads/ui/screen/add_ads_screen.dart';
import '../../feature/ads/ui/screen/ads_screen.dart';
import '../../feature/blog/data/model/post_model.dart';
import '../../feature/brand_identity/logic/brand_identity_cubit.dart';
import '../../feature/brand_identity/ui/screens/add_brand_identity_screen.dart';
import '../../feature/brand_identity/ui/screens/brand_identity.dart';
import '../../feature/forget_password/ui/screens/forget_password.dart';
import '../../feature/forget_password/ui/screens/phone_recovery.dart';
import '../../feature/login/logic/login_cubit.dart';
import '../../feature/motion_graphic/logic/motion_graphic_cubit.dart';
import '../../feature/motion_graphic/ui/screen/add_motion_graphic_screen.dart';
import '../../feature/motion_graphic/ui/screen/motion_graphic.dart';
import '../../feature/notification/ui/screens/notification_screen.dart';
import '../../feature/one_service/ui/screens/one_service_screen.dart';
import '../../feature/post_details/ui/screen/post_details.dart';
import '../../feature/print-out/ui/screen/add_print_out.dart';
import '../../feature/print-out/ui/screen/print_out.dart';
import '../../feature/profile/ui/screens/profile_screen.dart';
import '../../feature/services/logic/service_cubit.dart';
import '../../feature/services/ui/screens/services_screen.dart';
import '../../feature/setting/ui/screen/setting_screen.dart';
import '../../feature/splash/ui/splash.dart';
import 'routes.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case Routes.navigationBar:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: locator<NavBarCubit>(),
            child: NavBarScreen(),
          ),
        );
      case Routes.welcome:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => OnboardingCubit(),
            child: OnBoardingScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => locator<SignUpCubit>(),
            child: SignUpScreen(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => locator<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ForgetPasswordCubit(),
            child: ForgetPasswordScreen(),
          ),
        );
      case Routes.addWebsite:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: locator<AddWebsiteCubit>(),
            child: AddWebsiteScreen(),
          ),
        );
      case Routes.addAppScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AppsCubit(),
            child: AddAppScreen(),
          ),
        );
      case Routes.motionGraphicScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => MotionGraphicCubit(),
            child: MotionGraphicScreen(),
          ),
        );
      case Routes.addMotionGraphicScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => MotionGraphicCubit(),
            child: MotionGraphicDetails(),
          ),
        );
      case Routes.addMotionGraphicFinalScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => MotionGraphicCubit(),
            child: MotionGraphic6(),
          ),
        );
      case Routes.AdsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AdsCubit(),
            child: AdsDetails(),
          ),
        );
      case Routes.addAdsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AdsCubit(),
            child: AddAdsScreen(),
          ),
        );
      case Routes.addPrintOutFinalScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: locator<PrintOutCubit>(),
            child: PrintOut5(),
          ),
        );
      case Routes.brandIdentityScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: locator<BrandIdentityCubit>(),
            child: BrandIdentityScreen(),
          ),
        );
      case Routes.printOutsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: locator<PrintOutCubit>(),
            child: PrintOutScreen(),
          ),
        );
      case Routes.addPrintOutScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: locator<PrintOutCubit>(),
            child: PrintOutsDetails(),
          ),
        );
      case Routes.addBrandIdentityScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: locator<BrandIdentityCubit>(),
            child: AddBrandIdentityScreen(),
          ),
        );
      case Routes.addBrandIdentityFinalScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: locator<BrandIdentityCubit>(),
            child: BrandIdentity7(),
          ),
        );
      case Routes.addDMarketingScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => DmarketingCubit(),
            child: AddDMarketingScreen(),
          ),
        );
      case Routes.addDMarketingDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => DmarketingCubit(),
            child: dMarketingDetails(),
          ),
        );
      case Routes.servicesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ServiceCubit(),
            child: ServicesScreen(),
          ),
        );
      case Routes.profile:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: locator<ProfileCubit>(),
            child: ProfileScreen(),
          ),
        );
      case Routes.addAppRequestScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AppsCubit(),
            child: MobileAppDetails(),
          ),
        );
      case Routes.addAppFinalScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AppsCubit(),
            child: MobileApp5(),
          ),
        );
      case Routes.addDMarketingFinalScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => DmarketingCubit(),
            child: DigitalMarketing5(),
          ),
        );
      case Routes.finalWebsiteRequest:
        return MaterialPageRoute(
          builder: (_) => BussinessDetails6(),
        );
      case Routes.oneServiceDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => OneServiceCubit(),
            child: OneServiceScreen(),
          ),
        );
      case Routes.businessDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: locator<AddWebsiteCubit>(),
            child: BusinessDetails(),
          ),
        );
      case Routes.phoneRecover:
        return MaterialPageRoute(
          builder: (_) => PhoneRecoveryScreen(),
        );
      case Routes.blog:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: locator<BlogCubit>(),
            child: BlogScreen(),
          ),
        );
      case Routes.resetPassword:
        return MaterialPageRoute(
          builder: (_) => ResetPassword(),
        );
      case Routes.notification:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => NotificationCubit(),
            child: NotificationScreen(),
          ),
        );
      case Routes.setting:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProfileCubit(),
            child: SettingScreen(),
          ),
        );
      case Routes.chatScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ChatCubit(),
            child: ChatScreen(),
          ),
        );
      case Routes.postDetails:
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => PostDetails(
            postModel: arguments['postModel'] as PostModel,
            isLiked: arguments['isLiked'] as bool,
          ),
        );
    }
    return null;
  }
}
