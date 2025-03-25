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
  Future<Either<dynamic,dynamic>> reAuthenticateAndDelete() async {
    try {
      final providerData = FirebaseAuth.instance.currentUser?.providerData.first;

      if (AppleAuthProvider().providerId == providerData!.providerId) {
        await FirebaseAuth.instance.currentUser!
            .reauthenticateWithProvider(AppleAuthProvider());
      } else if (GoogleAuthProvider().providerId == providerData.providerId) {
        await FirebaseAuth.instance.currentUser!
            .reauthenticateWithProvider(GoogleAuthProvider());
      }
 await FirebaseAuth.instance.currentUser?.delete();
      await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).delete();
      return right('deleted');
    } catch (e) {
     return left(e);
    }
  }
}
