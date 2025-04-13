import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/printout_request_model.dart';

class PrintoutRequestRepo {
  Future<void> addBrandRequest(PrintoutRequestModel  data) async {
    try{
      final dataRequest= await FirebaseFirestore.instance.collection('Requests').add(data.toMap());
      await FirebaseFirestore.instance.collection('PrintoutRequests').add(data.toMap());
      print(dataRequest.id);
    }catch(e) {
      print(e);
    }
  }
}