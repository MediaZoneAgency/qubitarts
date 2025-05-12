import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:qubitarts/feature/motion_graphic/data/model/motion_graphic_model.dart';

class MotionGraphicRepo {
  Future<Either<String,String>> addMotionGraphicRequest(MotionGraphicModel data) async {
    try{
      final dataRequest= await FirebaseFirestore.instance.collection('Requests').add(data.toMap());
      await FirebaseFirestore.instance.collection('GraphicsRequests').add(data.toMap());
      print(dataRequest.id);
      return right('success');
    }catch(e) {
      print(e);
      return left('error');
    }
  }
}