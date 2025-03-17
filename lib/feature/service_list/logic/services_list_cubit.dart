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
    ServiceContainerModel(title: 'Brand Identity', description: 'Lorem Ipsum is simply dummy text of the printing and \ntypesetting industry.', image:'assets/images/bbi.png', route: Routes.brandIdentityScreen,),
    ServiceContainerModel(title: 'Mobile Apps', description: 'Lorem Ipsum is simply dummy \ntext of the printing and typesetting industry.', image:'assets/images/maa.png', route: Routes.addAppScreen,),
     ServiceContainerModel(title: 'Digital Marketing', description: 'Lorem Ipsum is simply dummy text of the printing and \ntypesetting industry.', image:'assets/images/gm.png', route: Routes.addDMarketingScreen),
    ServiceContainerModel(title: 'Motion Graphics', description: 'Lorem Ipsum is simply dummy \ntext of the printing and typesetting industry.', image:'assets/images/mgg.png', route: Routes.motionGraphicScreen,),
    ServiceContainerModel(title: S.of(NavigationService.navigatorKey.currentContext!).PrintOuts, description: 'Lorem Ipsum is simply dummy text of the printing and \ntypesetting industry.', image:'assets/images/pos.png', route: Routes.printOutsScreen,),
    ServiceContainerModel(title: 'Ads and Campaigns', description: 'Lorem Ipsum is simply dummy \ntext of the printing and typesetting industry.', image:'assets/images/ac.png', route: '',)

  ];
}
