import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:qubitarts/feature/brand_identity/ui/widgets/brandId1.dart';
import 'package:qubitarts/feature/brand_identity/ui/widgets/brandId2.dart';

import '../../../core/db/cash_helper.dart';
import '../data/model/brand_request_model.dart';
import '../data/model/brand_request_model.dart';
import '../data/repo/brand_request_repo.dart';
import '../ui/widgets/brandId3.dart';
import '../ui/widgets/brandId4.dart';
import '../ui/widgets/brandId5.dart';
import '../ui/widgets/brandId6.dart';

part 'brand_identity_state.dart';

class BrandIdentityCubit extends Cubit<BrandIdentityState> {
  BrandIdentityCubit() : super(BrandIdentityInitial());
  static BrandIdentityCubit get(context) => BlocProvider.of(context);
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

  final pages = [
    BrandIdentity1(),
    BrandIdentity2(),
    BrandIdentity3(),
    BrandIdentity4(),
    BrandIdentity5(),
    BrandIdentity6()
  ];
  void selectLaunchDate(DateTime dateTime) {
    selectedDeadlineDate = DateFormat('EEE, d/M/y').format(dateTime);
    emit(ChangeDate());
  }
  Future<void> getPdfAndUpload()async{
    try{
      FilePickerResult? result  = await FilePicker.platform.pickFiles();
      String fileName = '${result?.files.first.name}.pdf';
      print(fileName);
      emit(GetfileSucces());
    }catch(e){
      print(e.toString());
    }
  }
  String selectedDeadlineDate = DateFormat('EEE, d/M/y').format(DateTime.now());
  List<String> selectedCustomer = [];
  List<String> Customer = [
    'Adults',
    'Children',
    'Women',
    'Students',
    'Elderly',
    'Arabians'
  ];
  void toggleSelectedCustomer(String feature) {
    if (selectedCustomer.contains(feature)) {
      selectedCustomer.remove(feature);
    } else {
      selectedCustomer.add(feature);
    }

    emit(ToggleCustomerState());
  }

  List<String> selectedFontStyle = [];
  List<String> fontStyle = [
    'Bold',
    'Thin',
    'Women',
    'Sans-serif',
    'Lato',
    'Signature',
    'Italic',
    'Inter'
  ];
  void toggleSelectedFontStyle(String feature) {
    if (selectedFontStyle.contains(feature)) {
      selectedFontStyle.remove(feature);
    } else {
      selectedFontStyle.add(feature);
    }

    emit(ToggleCustomerState());
  }

  List<String> selectedBrandVisual = [];
  List<String> brandVisual = ['Minimalistic', 'Simple', 'Sophisticated'];
  void toggleSelectedBrandVisual(String feature) {
    if (selectedBrandVisual.contains(feature)) {
      selectedBrandVisual.remove(feature);
    } else {
      selectedBrandVisual.add(feature);
    }

    emit(ToggleCustomerState());
  }

  List<String> selectedPlaces = [];
  List<String> places = [
    'website',
    'Social Media',
    'Print Materials',
    'Mobile App'
  ];
  void toggleSelectedPlaces(String feature) {
    if (selectedPlaces.contains(feature)) {
      selectedPlaces.remove(feature);
    } else {
      selectedPlaces.add(feature);
    }

    emit(ToggleCustomerState());
  }
  bool checkSendRequest(){
    if(brandGuidelines.isEmpty&&specificTextOrPhrases.isEmpty&&assistanceCreatingScript.isEmpty&&messagesToConvey.isEmpty&&selectedPlaces.isEmpty&&visionForDigital.isEmpty&&selectedCustomer.isEmpty&&selectedDeadlineDate.isEmpty){
      return false;
    }
    else return true;
  }
  List<String> colorPalette = [
    'assets/images/platte1.png',
    'assets/images/platte2.png',
    'assets/images/platte3.png',
    'assets/images/platte4.png',
  ];
  String selectedColorPalette='';
  void toggleStatePalette(String palette) {

    selectedColorPalette=palette;

    emit(ToggleColorPalette());
  }
  late BrandRequestModel brandRequestModel;
   String visionForDigital='';
   String brandGuidelines='';
   String messagesToConvey='';
   String specificTextOrPhrases='';
   String assistanceCreatingScript='';
  void addBrandRequest() async {
    String? userId = await CashHelper.getStringScoured(key: Keys.token);
    brandRequestModel = BrandRequestModel(
      brandVisual: selectedBrandVisual,
      palette: selectedColorPalette,
      brandUsedPlaces: selectedPlaces,
      assistanceCreatingScript:assistanceCreatingScript ,
      brandGuidelines: brandGuidelines,
      messagesToConvey: messagesToConvey,
      specificTextOrPhrases: specificTextOrPhrases,
      yourVision: visionForDigital,
      launchDate: selectedDeadlineDate,
      idealCustomer: selectedCustomer,
      fontStyles: selectedFontStyle,
      createdTime: DateTime.now(),
      userREF: FirebaseFirestore.instance.collection('users').doc(userId),
      status: 'In Review',
      type: 'brand identity',
    );
    await BrandRequestRepo().addBrandRequest(brandRequestModel);
    print(brandRequestModel);
  }
}
