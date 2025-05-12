import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/db/cash_helper.dart';
import '../model/user_request_model.dart';

class RequestRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Either<String, List<UserRequestsModel>>> fetchRequestsByUserRef() async {
    try {
      final userRef = await _getUserRef();
      final querySnapshot = await _firestore
          .collection('Requests')
          .where('userREF', isEqualTo: userRef)
          .get();

      final requests = _mapQueryToRequests(querySnapshot);
      return Right(requests);
    } catch (e) {
      print('Error in fetchRequestsByUserRef: $e');
      return Left(e.toString());
    }
  }

  Future<Either<String, List<UserRequestsModel>>> fetchRequestsByState(String category) async {
    try {
      if (category == 'All') {
        return await fetchRequestsByUserRef();
      }

      final userRef = await _getUserRef();
      final querySnapshot = await _firestore
          .collection('Requests')
          .where('userREF', isEqualTo: userRef)
          .where('status', isEqualTo: category)
          .get();

      final requests = _mapQueryToRequests(querySnapshot);
      return Right(requests);
    } catch (e) {
      print('Error in fetchRequestsByState: $e');
      return Left(e.toString());
    }
  }

  Future<DocumentReference> _getUserRef() async {
    final userId = await CashHelper.getStringScoured(key: Keys.token);
    return _firestore.doc('users/$userId');
  }

  List<UserRequestsModel> _mapQueryToRequests(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id; // Add document ID to the model
      return UserRequestsModel.fromMap(data);
    }).toList();
  }
}
