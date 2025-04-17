import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:qubitarts/feature/add_website/data/model/web_request_model.dart';

import '../../../core/db/cash_helper.dart';
import '../data/repo/web_request_repo.dart';
import '../ui/widgets/business_details1.dart';
import '../ui/widgets/business_details2.dart';
import '../ui/widgets/bussiness_details3.dart';
import '../ui/widgets/bussiness_details4.dart';
import '../ui/widgets/bussiness_details5.dart';

part 'add_website_state.dart';

class AddWebsiteCubit extends Cubit<AddWebsiteState> {
  AddWebsiteCubit() : super(AddWebsiteInitial());
  static  AddWebsiteCubit get(context) => BlocProvider.of(context);
  List<String> pervious = [
    'assets/images/perwebsite.jpg'
    ,'assets/images/perwibsite3.jpg',
    'assets/images/perwebsite2.jpg'
  ];
  final pages = [
    BusinessDetails1()
    ,BusinessDetails2()
    ,BusinessDetails3()
    ,BusinessDetails4(),
    BusinessDetails5()

  ];
  bool screenIndexValdite=false;
  getscreenvalidate(bool value){
    screenIndexValdite=value;
    emit(ScreenValditeState());
  }
  String selectedIndustry='';
  List <String> sizes=['standard', 'custom'];
  void toggleSelectedSize(String value) {
    selectedIndustry=value;
    print(selectedIndustry);
    emit(SelectIndustryState());
  }
  List<String> industries = [
    "Technology",
    "Healthcare",
    "Education",
    "Retail",
    "Finance",
    "Hospitality",
    "Real Estate",
    "Manufacturing",
    "Entertainment",
    "Transportation",
    "Food & Beverage",
    "Agriculture",
    "Construction",
    "Consulting",
    "Legal Services",
    "Media & Advertising",
    "Energy & Utilities",
    "Fashion & Apparel",
    "Nonprofit",
    "Sports & Recreation",
  ];

  void selectLaunchDate(DateTime dateTime) {
    selectedDeadlineDate  = DateFormat('EEE, d/M/y').format(dateTime);
    emit(ChangeDate());
  }
  String selectedDeadlineDate = DateFormat('EEE, d/M/y').format(DateTime.now());
  void toggleFeature(String feature) {

    if (selectedFeatures.contains(feature)) {
      selectedFeatures.remove(feature);
    } else {
      selectedFeatures.add(feature);
    }

    emit(ToggleFeaturesState());
  }
  List<String> selectedFeatures=[];
List <String> Features=['Online Payment','Notifications','Booking','Registration','Interior Design','Clothing',' Automotive'];
  String isNew='';
  void toggleState(String state) {

    isNew=state;

    emit(ToggleState());
  }
  String needAssistant='';
  void toggleStateAssistant(String state) {

    needAssistant=state;

    emit(ToggleStateAssistant());
  }
 String isYes='';
  void toggleStateYes(String state) {

    isYes=state;

    emit(ToggleStateYes());
  }
  int currentPageIndex = 0;

   String businessName='';
  bool checkSendRequest(){
    if(businessName.isEmpty||selectedIndustry.isEmpty||isYes.isEmpty||businessVision.isEmpty||businessDescription.isEmpty||selectedFeatures.isEmpty||preferredDomain.isEmpty||needAssistant.isEmpty||selectedDeadlineDate.isEmpty||isYes.isEmpty||businessVision.isEmpty){
      return false;
    }
    else return true;
  }
   String businessDescription='';

   String preferredDomain='';

  late String businessVision;
  void changeIndex(int index) {
    currentPageIndex = index;
    emit(ChangeIndexState());
  }
  WebRequestModel webRequestModel=WebRequestModel();
  void addWebRequest() async {
    String? userId = await CashHelper.getStringScoured(key: Keys.token);
    webRequestModel = WebRequestModel(
      businessState: isNew,
      industry: selectedIndustry,
      websiteFeatures: selectedFeatures,
      assistanceWithDomainName: needAssistant,
      launchDate: selectedDeadlineDate,
      ProvideHighResoImage: isYes,
      businessName: businessName,
      businessDescription: businessDescription,
      preferredDomain: preferredDomain,
      businessVision: businessVision,
      createdTime: DateTime.now(),
      userREF: FirebaseFirestore.instance.collection('users').doc(userId),
      status: 'In Review',
      type: 'Website System',
    );
    await webRequestRepo().addWebRequest(webRequestModel);
    print(webRequestModel);
  }
}
