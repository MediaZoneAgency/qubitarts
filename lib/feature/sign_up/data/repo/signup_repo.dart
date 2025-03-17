import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/Networking/api_constants.dart';
import '../../../../core/error/api_error_model.dart';
import '../../../../core/error/error_handler.dart';
import '../model/sign_up_model.dart';
import '../model/signup_response_model.dart';

class SignUPRepoImpl {
  //final ApiService apiService;

  SignUPRepoImpl();

  Future<Either<String, User>> signUpUser(SingUPModel signUpModel) async {
    try {
// Create user with email and password
      final userCredentials =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signUpModel.email.trim(),
        password: signUpModel.password.trim(),
      );
      print(userCredentials);
      //return right(userCredentials.user!);
      final String uid = userCredentials.user?.uid ?? "";


      await FirebaseFirestore.instance.collection('users').doc(uid).set({
             'uid': uid,
            'email': signUpModel.email,
            'display_name':signUpModel.username ?? "",
            'admin': false,
            'agreed': true,
            'created_time': FieldValue.serverTimestamp(),
            'last_login': FieldValue.serverTimestamp(),
            'status': "Active",
        'phone_number': signUpModel.phoneNumber,
      });

      // Return success
        return right(userCredentials.user!);
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      if (e.code == 'email-already-in-use') {
        errorMessage = "The email is already in use.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "The email address is invalid.";
      } else if (e.code == 'weak-password') {
        errorMessage = "The password is too weak.";
      } else {
        errorMessage = e.message ?? "An unexpected error occurred.";
      }

// Return error message
      return left(errorMessage);
    } catch (e) {
// Return generic error
      return left("An unexpected error occurred: $e");
    }
  }
}
