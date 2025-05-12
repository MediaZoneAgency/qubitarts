import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../model/ads_request_model.dart';

class AdsRequestRepo {
  Future<Either<String,String>> addAdsRequest(AdsRequestModel data) async {
    try{
      final dataRequest= await FirebaseFirestore.instance.collection('Requests').add(data.toMap());
      await FirebaseFirestore.instance.collection('ADsRequests').add(data.toMap());
      print(dataRequest.id);
      return right('Success');
    }catch(e) {
      print(e);
      return left('error');
    }
  }
  
}