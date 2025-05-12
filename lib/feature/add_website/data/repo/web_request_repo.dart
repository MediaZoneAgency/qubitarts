import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:qubitarts/feature/add_website/data/model/web_request_model.dart';

class webRequestRepo {
  Future<Either<String,String>> addWebRequest(WebRequestModel data) async {
    try{
      final dataRequest= await FirebaseFirestore.instance.collection('Requests').add(data.toMap());
      await FirebaseFirestore.instance.collection('webRequests').add(data.toMap());
return right('succes');
    }catch(e) {
      print(e);
      return left('error');
    }
  }
}