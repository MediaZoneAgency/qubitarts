import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:qubitarts/feature/ads/data/model/ads_request_model.dart';
import 'package:qubitarts/feature/ads/ui/widgets/ads3.dart';
import 'package:qubitarts/feature/ads/ui/widgets/ads5.dart';
import 'package:qubitarts/generated/l10n.dart';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart'; // new import
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import '../../../core/db/cash_helper.dart';
import '../data/repo/ads_request_repo.dart';
import '../ui/widgets/ads1.dart';
import '../ui/widgets/ads2.dart';
import '../ui/widgets/ads4.dart';

part 'ads_state.dart';

class AdsCubit extends Cubit<AdsState> {
  AdsCubit() : super(AdsInitial());
  static AdsCubit get(context) => BlocProvider.of(context);
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

  final pages = [Ads1(), Ads2(), Ads3(), Ads4(),Ads5()];
  void changeRangeValues(RangeValues values) {
    currentRangeValues = values;
    //print(currentRangeValues.toString());

    emit(ChangeRangeValuesState());
  }
  List<String> selectedCustomer = [];
  List<String> Customer = [
    'Adults',
    'Children',
    'Women',
    'Students',
    'Elderly',
    'Arabians'
  ];
  List<String> campaignPlatform = [
    'Google ADS',
    'FaceBook ADS',
    'X(twitter)',
    'SnapChat',
    'YouTube',
    'TikTok'
  ];
  bool checkSendRequest(){
    if(selectedCustomer.isEmpty&&selectedCampaignPlatform.isEmpty&&businessGoal.isEmpty&&Usp.isEmpty&&visionforMarketing.isEmpty){
      return false;
    }
    else return true;
  }
  List<String> selectedPlatform = [];
  void toggleSelectedCampaign(String feature) {
    if ( selectedCampaignPlatform.contains(feature)) {
      selectedCampaignPlatform.remove(feature);
    } else {
      selectedCampaignPlatform.add(feature);
    }

    emit(ToggleCustomerState());
  }
  void toggleSelectedCustomer(String feature) {
    if (selectedCustomer.contains(feature)) {
      selectedCustomer.remove(feature);
    } else {
      selectedCustomer.add(feature);
    }

    emit(ToggleCustomerState());
  }
  RangeValues currentRangeValues = RangeValues(0, 100);
  List<String> selectedCampaignPlatform = [];
  List<String> Platform = [
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

   String businessGoal='';

  String Usp='';
  void selectLaunchDate(DateTime dateTime) {
    selectedDeadlineDate = DateFormat('EEE, d/M/y').format(dateTime);
    emit(ChangeDate());
  }

  String selectedDeadlineDate = DateFormat('EEE, d/M/y').format(DateTime.now());

  String visionforMarketing='';
 late AdsRequestModel adsRequestModel;

   String brandGuidline='';
  String? brandGuidlineFile='';
  Future< void> addAdsRequest() async {
    emit(AddRequestLoadingState());
    String? userId = await CashHelper.getStringScoured(key: Keys.token);
    //getPdfAndUpload();
    adsRequestModel = AdsRequestModel(
      releventPlatforms: selectedPlatform,
      campaignsPlatforms: selectedCampaignPlatform,
      idealCustomer: selectedCustomer,
      uniqueSellingPropostion: Usp,
      brandGuideline:brandGuidline ,
      launchDate: selectedDeadlineDate,
      businessGoal:businessGoal,
      budgetRange: currentRangeValues.toString(),
      visionDigitalMarketing: visionforMarketing,
      createdTime: DateTime.now(),
      userREF: FirebaseFirestore.instance.collection('users').doc(userId),
      status: 'In Review',
      type: 'Ads and Campaigns',
      brandGuidelineFile: brandGuidlineFile,
    );
    var response=await AdsRequestRepo().addAdsRequest(adsRequestModel);
    response.fold((l){emit(AddRequestErrorState());}, (r){emit(AddRequestSuccessState());});
    print(adsRequestModel);
  }
  Future<void> getPdfAndUpload() async {
  try {
    // Pick file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf','docx'],
    );

    if (result != null && result.files.single.path != null) {
      File file = File(result.files.single.path!);

      // Generate random name
      String randomName = List.generate(20, (_) => Random().nextInt(100).toString()).join();
      String fileName = '$randomName.pdf';

      // Upload and get download URL
      String downloadUrl = await uploadPdfFile(file, fileName);

      // Save URL in your state
      brandGuidlineFile = downloadUrl;
      print("Uploaded file URL: $downloadUrl");
    } else {
      print("No file selected.");
    }
  } catch (e) {
    print("File upload error: $e");
  }}
  Future<String> uploadPdfFile(File file, String fileName) async {
  try {
    final storageRef = FirebaseStorage.instance.ref().child(fileName);
    final uploadTask = await storageRef.putFile(file);
    final downloadUrl = await storageRef.getDownloadURL();
    return downloadUrl;
  } catch (e) {
    throw Exception("Error uploading file: $e");
  }
}

}
