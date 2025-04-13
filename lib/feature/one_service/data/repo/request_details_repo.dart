import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/db/cash_helper.dart';
class RequestDetailsRepo {
  Future<Either<String, Map<String, dynamic>>> getRequestDetails(String requestId) async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('Requests')
          .doc(requestId)
          .get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        data['id'] = docSnapshot.id; // Optionally include the ID
        print(data);
        return Right(data);
      } else {
        return Left("Request not found");
      }
    } catch (e) {
      print(e.toString());
      return Left(e.toString());
    }
  }
}
