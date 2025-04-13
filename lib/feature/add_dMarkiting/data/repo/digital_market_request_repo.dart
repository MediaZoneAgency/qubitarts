import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/digital_request_model.dart';

class DigitalMarketingRequestRepo{
  Future<void> addDigitalMarketRequest(DigitalRequestModel data) async {
    try{
      final dataRequest= await FirebaseFirestore.instance.collection('Requests').add(data.toMap());
      await FirebaseFirestore.instance.collection('DigitalMarketingRequest').add(data.toMap());
      print(dataRequest.id);
    }catch(e) {
      print(e);
    }
  }
}