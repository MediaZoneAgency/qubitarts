import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/db/cash_helper.dart';
import '../model/user_model.dart';

class ProfileRepo {
  Future<Either<String,UserModel?>> fetchUser() async {
    try {
      String? userId = await CashHelper.getStringScoured(key: Keys.token);
      print(userId);
      if (userId == null || userId.isEmpty) {
        print("User ID is null or empty.");
        return left('User ID is null or empty.');
      }

      // Reference the document
      final userDoc =
          FirebaseFirestore.instance.collection('users').doc(userId);

      // Get the document snapshot
      final snapshot = await userDoc.get();

      // print(snapshot.data());
      if (snapshot.exists) {
        print('here');
        // Convert to UserModel
        return right(UserModel.fromMap(snapshot.data()!, snapshot.id));
      } else {
        print("User not found!");
        return left('User not found.');
      }
    } catch (e) {
      print("Error fetching user data: $e");
      return left(e.toString());
    }
  }
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
