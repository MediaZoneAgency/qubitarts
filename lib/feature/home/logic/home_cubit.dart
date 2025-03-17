import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qubitarts/feature/home/data/model/services_Card_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
 // final List<ServicesCardModel> data = [
 //   ServicesCardModel(image:'assets/images/ma.png', title:  'Mobile Apps', subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', route: ''),
 //   ServicesCardModel(image:'assets/images/bi.png', title:  'Brand Identity', subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', route: ''),
 //   ServicesCardModel(image:'assets/images/dm.png', title:  'Digital Marketing', subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', route: ''),
 //   ServicesCardModel(image:'assets/images/mg.png', title:  'Motion Graphics', subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', route: ''),
 //   ServicesCardModel(image:'assets/images/po.png', title:  'Print Outs', subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', route: ''),
 //   ServicesCardModel(image:'assets/images/ads.png', title:  'Ads and Campaigns', subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', route: ''),
//
//
 // ];
}
