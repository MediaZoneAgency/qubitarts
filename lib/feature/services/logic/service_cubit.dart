import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/routing/routes.dart';
import '../../../generated/l10n.dart';
import '../../../qubitarts.dart';
import '../../home/data/model/services_Card_model.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitial());
  static ServiceCubit get(context)=> BlocProvider.of(context);
  final List<ServicesCardModel> data = [
    ServicesCardModel(image:'assets/images/ma.png', title:  'Websites', subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', route: Routes.addWebsite),
    ServicesCardModel(image:'assets/images/we.png', title:  'Mobile Apps', subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', route: Routes.addAppScreen),
    ServicesCardModel(image:'assets/images/bi.png', title:  'Brand Identity', subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', route: Routes.addAppScreen),
    ServicesCardModel(image:'assets/images/dm.png', title:  'Digital Marketing', subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', route: Routes.addAppScreen),
    ServicesCardModel(image:'assets/images/mg.png', title:  'Motion Graphics', subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', route: Routes.addAppScreen),
    ServicesCardModel(image:'assets/images/po.png', title:  S.of(NavigationService.navigatorKey.currentContext!).PrintOuts, subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', route: Routes.addAppScreen),
    ServicesCardModel(image:'assets/images/ads.png', title:  'Ads and Campaigns', subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', route: Routes.addAppScreen),


  ];
}
