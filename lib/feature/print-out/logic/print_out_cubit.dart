import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:qubitarts/feature/print-out/ui/widgets/print_out1.dart';
import 'package:qubitarts/feature/print-out/ui/widgets/print_out2.dart';
import 'package:qubitarts/feature/print-out/ui/widgets/print_out3.dart';
import 'package:qubitarts/feature/print-out/ui/widgets/print_out4.dart';

import '../../../core/db/cash_helper.dart';
import '../data/model/printout_request_model.dart';
import '../data/repo/printout_repo.dart';

part 'print_out_state.dart';

class PrintOutCubit extends Cubit<PrintOutState> {
  PrintOutCubit() : super(PrintOutInitial());
  static PrintOutCubit get(context) => BlocProvider.of(context);
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
    PrintOut1(),
    PrintOut2(),
    PrintOut3(),
    PrintOut4(),

  ];
  List<String> printOutType = [
    "Business Card",
    "Brochures",
    "Flyers",
    "Posters",
    "Outdoors"
  ];
  List<String> selectedPrintOut = [];
  void toggleSelectedPrintType(String feature) {

    if (selectedPrintOut.contains(feature)) {
      selectedPrintOut.remove(feature);
    } else {
      selectedPrintOut.add(feature);
    }

    emit(ToggleFontStyleState());
  }
  List<String> Quantity = [
    "50-100",
    "100-200",
    "500-1000",

  ];
  String selectedQuantity = '';
  void toggleSelectedQuantity(String feature) {
selectedQuantity=feature;

    emit(ToggleFontStyleState());
  }
  List<String> paperType = [
    "Glossy",
    "Matte",
    "Recycled",
    "Hard",
    "Soft"
  ];
  List<String> selectedPaperType = [];
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
  bool checkSendRequest(){
    if(brandGuidelines.isEmpty&&selectedQuantity.isEmpty&&selectedPrintOut.isEmpty&&selectedPaperType.isEmpty&&selectedSize.isEmpty&&visionForMarketing.isEmpty&&selectedDeadlineDate.isEmpty){
      return false;
    }
    else return true;
  }
  void toggleSelectedPaperType(String feature) {

    if (selectedPaperType.contains(feature)) {
      selectedPaperType.remove(feature);
    } else {
      selectedPaperType.add(feature);
    }

    emit(ToggleFontStyleState());
  }
String selectedSize='';
  List <String> sizes=['standard', 'custom'];
  void toggleSelectedSize(String value) {
    selectedSize=value;
    print(selectedSize);
    emit(SelectSizeState());
  }
  void selectLaunchDate(DateTime dateTime) {
    selectedDeadlineDate  = DateFormat('EEE, d/M/y').format(dateTime);
    emit(ChangeDate());
  }
  String selectedDeadlineDate = DateFormat('EEE, d/M/y').format(DateTime.now());
  late PrintoutRequestModel printoutRequestModel;

  String brandGuidelines='';

  String visionForMarketing='';
  void addPrintoutRequest() async {
    emit(AddRequestLoadingState());
    String? userId = await CashHelper.getStringScoured(key: Keys.token);
    printoutRequestModel = PrintoutRequestModel(
      printoutTypes: selectedPrintOut,
visionForMarketing: visionForMarketing,
      dateLaunch: selectedDeadlineDate,
      size: selectedSize,
      paperType: selectedPaperType,
      quantityNeeded: selectedQuantity,
      brandGuidelines: brandGuidelines,
      createdTime: DateTime.now(),
      userREF: FirebaseFirestore.instance.collection('users').doc(userId),
      status: 'in Review',
      type: 'Print Outs',
    );
   var response= await PrintoutRequestRepo().addBrandRequest(printoutRequestModel);
    response.fold((l){emit(AddRequestErrorState());}, (r){emit(AddRequestSuccessState());});

    print(printoutRequestModel);
  }
}
