import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:qubitarts/feature/motion_graphic/data/model/motion_graphic_model.dart';
import 'package:qubitarts/feature/motion_graphic/ui/widget/Motion_graphic5.dart';

import '../../../core/db/cash_helper.dart';
import '../data/repo/motion_graphic_repo.dart';
import '../ui/widget/motion_graphic1.dart';
import '../ui/widget/motion_graphic2.dart';
import '../ui/widget/motion_graphic3.dart';
import '../ui/widget/motion_graphic4.dart';

part 'motion_graphic_state.dart';

class MotionGraphicCubit extends Cubit<MotionGraphicState> {
  MotionGraphicCubit() : super(MotionGraphicInitial());
  static MotionGraphicCubit get(context) => BlocProvider.of(context);
  late MotionGraphicModel motionGraphicModel;
   String primaryGoal='';
   String brandGuidelines='';
   String messagesToConvey='';
   String specificTextOrPhrases='';
   String visionForMarketing='';
  List<String> colorPalette = [
    'assets/images/platte1.png',
    'assets/images/platte2.png',
    'assets/images/platte3.png',
    'assets/images/platte4.png',
  ];
  String selectedColorPalette='';
  void toggleStatePalette(String palette) {

    selectedColorPalette=palette;

    emit(ToggleStateYes());
  }
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
    MotionGraphic1(),
    MotionGraphic2(),
    MotionGraphic3(),
    MotionGraphic4(),
    MotionGraphic5(),
  ];
  List<String> selectedCustomer=[];
  List <String> Customer=['Adults','Children','Women','Students','Elderly','Arabians'];
  void toggleSelectedCustomer(String feature) {

    if (selectedCustomer.contains(feature)) {
      selectedCustomer.remove(feature);
    } else {
      selectedCustomer.add(feature);
    }

    emit(ToggleCustomerState());
  }
  List<String> selectedFontStyle=[];
  List <String> fontStyle=['Bold','Thin','Women','Sans-serif','Lato','Signature','Italic','Inter'];
  void toggleSelectedFontStyle(String feature) {

    if (selectedFontStyle.contains(feature)) {
      selectedFontStyle.remove(feature);
    } else {
      selectedFontStyle.add(feature);
    }

    emit(ToggleFontStyleState());
  }
  void selectLaunchDate(DateTime dateTime) {
    selectedDeadlineDate  = DateFormat('EEE, d/M/y').format(dateTime);
    emit(ChangeDate());
  }
  String selectedDeadlineDate = DateFormat('EEE, d/M/y').format(DateTime.now());
  String isYes='';
  void toggleStateYes(String state) {

    isYes=state;

    emit(ToggleStateYes());
  }
  bool checkSendRequest(){
    if(selectedColorPalette.isEmpty&&selectedFontStyle.isEmpty&&brandGuidelines.isEmpty&&specificTextOrPhrases.isEmpty&&isYes.isEmpty&&messagesToConvey.isEmpty&&primaryGoal.isEmpty&&visionForMarketing.isEmpty&&selectedCustomer.isEmpty&&selectedDeadlineDate.isEmpty&&selectedCustomer.isEmpty){
      return false;
    }
    else return true;
  }
  Future< void> addMotionGraphic() async {
    String? userId = await CashHelper.getStringScoured(key: Keys.token);
    emit(AddRequestLoadingState());
    motionGraphicModel = MotionGraphicModel(
      assistanceCreatingScript: isYes,
      colorPalette: selectedColorPalette,
      primaryGoal: primaryGoal,
      brandGuidelines:brandGuidelines ,
      messagesToConvey: messagesToConvey,
      specificTextOrPhrases: specificTextOrPhrases,
      visionForMarketing:visionForMarketing ,
      launchDate: selectedDeadlineDate,
      idealCustomer: selectedCustomer,
      fontStyles: selectedFontStyle,
      createdTime: DateTime.now(),
      userREF: FirebaseFirestore.instance.collection('users').doc(userId),
      status: 'In Review',
      type: 'Motion Graphic',
    );
  var response=  await MotionGraphicRepo().addMotionGraphicRequest(motionGraphicModel);
  response.fold((l){emit(AddRequestErrorState());}, (r){emit(AddRequestSuccessState());});
    print(motionGraphicModel);
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
}
