import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/ads_request_model.dart';

class AdsRequestRepo {
  Future<void> addAdsRequest(AdsRequestModel data) async {
    try{
      final dataRequest= await FirebaseFirestore.instance.collection('Requests').add(data.toMap());
      print(dataRequest.id);
    }catch(e) {
      print(e);
    }
  }
  
}