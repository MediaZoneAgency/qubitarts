import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/brand_request_model.dart';

class BrandRequestRepo {
  Future<void> addBrandRequest(BrandRequestModel  data) async {
    try{
      final dataRequest= await FirebaseFirestore.instance.collection('Requests').add(data.toMap());
      print(dataRequest.id);
    }catch(e) {
      print(e);
    }
  }
}