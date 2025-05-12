import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:qubitarts/feature/add_dMarkiting/data/model/digital_request_model.dart';
import 'package:qubitarts/feature/add_dMarkiting/data/repo/digital_market_request_repo.dart';

import '../../../core/db/cash_helper.dart';
import '../ui/widgets/digital_marketing2.dart';
import '../ui/widgets/digital_marketing3.dart';
import '../ui/widgets/digital_marketing1.dart';
import '../ui/widgets/digital_marketing4.dart';

part 'dmarketing_state.dart';

class DmarketingCubit extends Cubit<DmarketingState> {
  DmarketingCubit() : super(DmarketingInitial());
  static DmarketingCubit get(context) => BlocProvider.of(context);
  List<String> pervious = [
    'assets/images/perwebsite.jpg',
    'assets/images/perwibsite3.jpg',
    'assets/images/perwebsite2.jpg'
  ];
  int currentPageIndex = 0;
  void changeIndex(int index) {
    currentPageIndex = index;
    emit(ChangeIndexState());
  }

  Future<void> getPdfAndUpload() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      String fileName = '${result?.files.first.name}.pdf';
      print(fileName);
      emit(GetfileSucces());
    } catch (e) {
      print(e.toString());
    }
  }

  RangeValues currentRangeValues = RangeValues(0, 100);
  final pages = [
    DMarketing1(),
    DMarketing2(),
    DMarketing3(),
    DMarketing4(),
  ];
  void toggleCampaignPlatforms(String feature) {
    if (selectedCampaignPlatform.contains(feature)) {
      selectedCampaignPlatform.remove(feature);
    } else {
      selectedCampaignPlatform.add(feature);
    }

    emit(ToggleCampaignPlatformState());
  }

  List<String> selectedCampaignPlatform = [];
  List<String> CampaignPlatform = [
    'Instagram',
    'FaceBook',
    'X(twitter)',
    'SnapChat',
    'YouTube',
    'TikTok'
  ];
  void togglePlatforms(String feature) {
    if (selectedPlatform.contains(feature)) {
      selectedPlatform.remove(feature);
    } else {
      selectedPlatform.add(feature);
    }

    emit(TogglePlatformState());
  }

  List<String> selectedPlatform = [];
  List<String> Platform = [
    'Instagram',
    'FaceBook',
    'X(twitter)',
    'SnapChat',
    'YouTube',
    'TikTok'
  ];
  void changeRangeValues(RangeValues values) {
    currentRangeValues = values;
    emit(ChangeRangeValuesState());
  }

  void selectLaunchDate(DateTime dateTime) {
    selectedDeadlineDate = DateFormat('EEE, d/M/y').format(dateTime);
    emit(ChangeDate());
  }

  String selectedDeadlineDate = DateFormat('EEE, d/M/y').format(DateTime.now());

  String businessGoal = '';

  String usp = '';

  String brandGuideline = '';

  String visionformarketing = '';
  bool checkSendRequest() {
    if (selectedCampaignPlatform.isEmpty ||
        selectedPlatform.isEmpty ||
        brandGuideline.isEmpty ||
        businessGoal.isEmpty ||
        selectedDeadlineDate.isEmpty) {
      return false;
    } else
      return true;
  }

  late DigitalRequestModel digitalRequestModel;
  void addDigitalMarketingRequest() async {
    emit(AddRequestLoadingState());
    String? userId = await CashHelper.getStringScoured(key: Keys.token);
    digitalRequestModel = DigitalRequestModel(
      paidCampaigns: selectedCampaignPlatform,
      brandGuideLines: brandGuideline,
      budget: currentRangeValues.toString(),
      businessGoals: businessGoal,
      platforms: selectedPlatform,
      dateLaunchTime: selectedDeadlineDate,
      createdTime: DateTime.now(),
      userREF: FirebaseFirestore.instance.collection('users').doc(userId),
      status: 'In Review',
      type: 'Digital Marketing',
      visionForMarketing: visionformarketing,
    );
    var response = await DigitalMarketingRequestRepo()
        .addDigitalMarketRequest(digitalRequestModel);
    response.fold((l) {
      emit(AddRequestErrorState());
    }, (r) {
      emit(AddRequestSuccessState());
    });
    print(digitalRequestModel);
  }
}
