import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../model/digital_request_model.dart';

class DigitalMarketingRequestRepo{
  Future<Either<String,String>> addDigitalMarketRequest(DigitalRequestModel data) async {
    try{
      final dataRequest= await FirebaseFirestore.instance.collection('Requests').add(data.toMap());
      await FirebaseFirestore.instance.collection('DigitalMarketingRequest').add(data.toMap());
      print(dataRequest.id);
      return right('success');
    }catch(e) {
      print(e);
      return left('error');
    }
  }
}