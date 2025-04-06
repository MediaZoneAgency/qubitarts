import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/routing/routes.dart';
import '../../../generated/l10n.dart';
import '../../../qubitarts.dart';
import '../data/model/service_container_model.dart';

part 'services_list_state.dart';

class ServicesListCubit extends Cubit<ServicesListState> {
  ServicesListCubit() : super(ServicesListInitial());
  static ServicesListCubit get(context) => BlocProvider.of(context);
  List<ServiceContainerModel> data = [
    ServiceContainerModel(title: S.of(NavigationService.navigatorKey.currentContext!).BrandIdentity, description: '', image:'assets/images/bbi.png', route: Routes.brandIdentityScreen,),
    ServiceContainerModel(title: S.of(NavigationService.navigatorKey.currentContext!).MobileApp, description: '', image:'assets/images/maa.png', route: Routes.addAppScreen,),
     ServiceContainerModel(title: S.of(NavigationService.navigatorKey.currentContext!).DigitalMarketing, description: '', image:'assets/images/gm.png', route: Routes.addDMarketingScreen),
    ServiceContainerModel(title: S.of(NavigationService.navigatorKey.currentContext!).MotionGraphic, description: '', image:'assets/images/mgg.png', route: Routes.motionGraphicScreen,),
    ServiceContainerModel(title: S.of(NavigationService.navigatorKey.currentContext!).PrintOuts, description: '', image:'assets/images/pos.png', route: Routes.printOutsScreen,),
    ServiceContainerModel(title: S.of(NavigationService.navigatorKey.currentContext!).Ads, description: '', image:'assets/images/ac.png', route: Routes.addAdsScreen,)

  ];
}
