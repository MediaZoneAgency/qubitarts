import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qubitarts/feature/add_website/data/model/web_request_model.dart';

class webRequestRepo {
  Future<void> addWebRequest(WebRequestModel data) async {
    try{
      final dataRequest= await FirebaseFirestore.instance.collection('Requests').add(data.toMap());
      await FirebaseFirestore.instance.collection('webRequests').add(data.toMap());

    }catch(e) {
      print(e);
    }
  }
}