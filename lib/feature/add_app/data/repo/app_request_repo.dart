import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/app_request_model.dart';

class AppRequestRepo {
  Future<void> addAppRequest(AppRequestModel data) async {
    try{
     final dataRequest= await FirebaseFirestore.instance.collection('Requests').add(data.toMap());
     await FirebaseFirestore.instance.collection('APPsRequests').add(data.toMap());
     print(dataRequest.id);
    }catch(e) {
      print(e);
    }
  }
}