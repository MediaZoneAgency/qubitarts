import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qubitarts/feature/motion_graphic/data/model/motion_graphic_model.dart';

class MotionGraphicRepo {
  Future<void> addMotionGraphicRequest(MotionGraphicModel data) async {
    try{
      final dataRequest= await FirebaseFirestore.instance.collection('Requests').add(data.toMap());
      print(dataRequest.id);
    }catch(e) {
      print(e);
    }
  }
}