import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:qubitarts/feature/add_app/data/model/app_request_model.dart';
import 'package:qubitarts/feature/add_app/ui/widgets/mobile_app3.dart';

import '../../../core/db/cash_helper.dart';
import '../data/repo/app_request_repo.dart';
import '../ui/widgets/mobile_app1.dart';
import '../ui/widgets/mobile_app2.dart';
import '../ui/widgets/mobile_app4.dart';

part 'apps_state.dart';

class AppsCubit extends Cubit<AppsState> {
  AppsCubit() : super(AppsInitial());
  static AppsCubit get(context) => BlocProvider.of(context);
  List<String> pervious = [
    'assets/images/perwebsite.jpg'
    ,'assets/images/perwibsite3.jpg',
    'assets/images/perwebsite2.jpg'
  ];
  int currentPageIndex = 0;
   String domainName='';
  late AppRequestModel appRequestModel;
  void changeIndex(int index) {
    currentPageIndex = index;
    emit(ChangeIndexState());
  }
  final pages = [
    mobileapp1()
    ,MobileApp2()
    ,MobileApps3()
    ,MobileApp4(),


  ];
  String isIos='';
  void toggleStatePlatform(String state) {

    isIos=state;

    emit(ToggleStatePlatform());
  }
  String isYes='';
  void toggleStateYes(String state) {

    isYes=state;

    emit(ToggleStateYes());
  }
  void toggleFeature(String feature) {

    if (selectedFeatures.contains(feature)) {
      selectedFeatures.remove(feature);
    } else {
      selectedFeatures.add(feature);
    }

    emit(ToggleFeaturesState());
  }
  bool checkSendRequest(){
    if(domainName.isEmpty||selectedFeatures.isEmpty||needAssistant.isEmpty||selectedDeadlineDate.isEmpty||isYes.isEmpty||isIos.isEmpty||visionForDigital.isEmpty){
      return false;
    }
    else {
      return true;
    }
  }
  String needAssistant='';
  void toggleStateAssistant(String state) {

    needAssistant=state;

    emit(ToggleStateAssistant());
  }

  List<String> selectedFeatures=[];
  List <String> Features=['Online Payment','Notifications','Booking','Registration','Interior Design','Clothing',' Automotive'];
  void selectLaunchDate(DateTime dateTime) {
    selectedDeadlineDate  = DateFormat('EEE, d/M/y').format(dateTime);
    emit(ChangeDate());
  }
  String selectedDeadlineDate = DateFormat('EEE, d/M/y').format(DateTime.now());

   String visionForDigital='';
 Future< void> addAppRequest() async {
    String? userId = await CashHelper.getStringScoured(key: Keys.token);
    appRequestModel = AppRequestModel(
      domainName: domainName,
      features: selectedFeatures,
      assistance: needAssistant,
      launchDate: selectedDeadlineDate,
      willProvideHighResolutionImage: isYes,
      iosOrAndroid: isIos,
      visionDigitalMarketing: visionForDigital,
      createdTime: DateTime.now(),
      userREF: FirebaseFirestore.instance.collection('users').doc(userId),
      status: 'In Review',
      type: 'Mobile App',
    );
    await AppRequestRepo().addAppRequest(appRequestModel);
    print(appRequestModel);
  }
}
