import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../model/brand_request_model.dart';

class BrandRequestRepo {
  Future<Either<String,String>> addBrandRequest(BrandRequestModel  data) async {
    try{
      final dataRequest= await FirebaseFirestore.instance.collection('Requests').add(data.toMap());
      await FirebaseFirestore.instance.collection('BrandingRequests').add(data.toMap());
      print(dataRequest.id);
      return right('success');
    }catch(e) {
      print(e);
      return left('error');
    }
  }
}