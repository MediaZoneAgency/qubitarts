import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/db/cash_helper.dart';
import '../model/user_request_model.dart';

class RequestRepo {

  Future<Either<String, List<UserRequestsModel>>> fetchRequestsByUserRef() async {
    String? userId=await CashHelper.getStringScoured(key: Keys.token);
    try {
      // Construct the reference for the user
      final userRef = FirebaseFirestore.instance.doc('users/$userId');

      // Reference to the Firestore collection
      final collection = FirebaseFirestore.instance.collection('Requests');

      // Query to filter posts by UserREF
      final querySnapshot = await collection.where('userREF', isEqualTo: userRef).get();

      // Process the retrieved posts
      final Requests = querySnapshot.docs.map((doc) => UserRequestsModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
return Right(Requests);
      print('Filtered Posts: $Requests');
    } catch (e) {
      print('Error fetching posts: $e');
      return Left(e.toString());
    }
  }
  Future<Either<String, List<UserRequestsModel>>> fetchRequestsByState(String category) async {
    String? userId = await CashHelper.getStringScoured(key: Keys.token);
    final userRef = FirebaseFirestore.instance.doc('users/$userId');

    try {
      if (category == 'All') {
        return fetchRequestsByUserRef();
      } else {
        final collection = FirebaseFirestore.instance
            .collection('Requests')
            .where('userREF', isEqualTo: userRef);

        final querySnapshot = await collection
            .where('status', isEqualTo: category)
            .get();
// print('iiiii${querySnapshot.docs[0].id}');
        // Include doc.id in your model
        final posts = querySnapshot.docs.map((doc) {
          final data = doc.data();
          print("docid${doc.id}");
          data['id'] = doc.id;
          print('ffff${data}');// Add document ID to the map
          return UserRequestsModel.fromMap(data);
        }).toList();

        print('Filtered Posts: $posts');
        return Right(posts);
      }
    } catch (e) {
      print(e.toString());
      return Left(e.toString());
    }
  }


}