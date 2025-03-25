import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  Future<Either<PlatformException, dynamic>> signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In process
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Ensure the user is not null
      if (googleUser == null) {
        return left(PlatformException(
          code: 'USER_CANCELLED',
          message: 'The user cancelled the Google Sign-In process.',
          details: null,
        ));
      }

      // Retrieve authentication details
      final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

      // Ensure that the authentication tokens are not null
      if (googleAuth?.accessToken == null || googleAuth?.idToken == null) {
        return left(PlatformException(
          code: 'TOKEN_MISSING',
          message: 'Both ID token and access token are missing.',
          details: null,
        ));
      }

      // Create Firebase credential using the authentication tokens
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Sign in to Firebase
      final userCredentials = await FirebaseAuth.instance.signInWithCredential(credential);
      print("User is: ${userCredentials.user}");
      await FirebaseFirestore.instance.collection('users').doc(userCredentials.user?.uid).set({
        'uid': userCredentials.user?.uid,
        'email': userCredentials.user?.email,
        'display_name':userCredentials.user?.displayName,
        'admin': false,
        'agreed': true,
        'created_time': FieldValue.serverTimestamp(),
        'last_login': FieldValue.serverTimestamp(),
        'status': "Active",
        'phone_number': userCredentials.user?.phoneNumber??'',
      });
      return right(userCredentials.user?.uid);
    } on PlatformException catch (e) {
      // Catch and print PlatformException
      print('PlatformException->${e.message}');
      return left(e);
    } catch (e) {
      // Catch any other exceptions
      print('Exception->${e.toString()}');
      return left(PlatformException(
        code: 'UNKNOWN_ERROR',
        message: 'An unknown error occurred.',
        details: e.toString(),
      ));
    }
  }

  Future<Either<PlatformException, dynamic>> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Check if the login was successful
      if (loginResult.status != LoginStatus.success || loginResult.accessToken == null) {
        print('Facebook login failed or canceled');
        return left(PlatformException(
          code: 'FACEBOOK_LOGIN_FAILED',
          message: 'Facebook login was not successful.',
        ));
      }

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );

      // Once signed in, return the UserCredential
      final userCredentials = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      print("User is: ${userCredentials.user}");
      await FirebaseFirestore.instance.collection('users').doc(userCredentials.user?.uid).set({
        'uid': userCredentials.user?.uid,
        'email': userCredentials.user?.email,
        'display_name':userCredentials.user?.displayName,
        'admin': false,
        'agreed': true,
        'created_time': FieldValue.serverTimestamp(),
        'last_login': FieldValue.serverTimestamp(),
        'status': "Active",
        'phone_number': userCredentials.user?.phoneNumber??'',
      });
      print('User ID: ${userCredentials.user?.uid}');
      return right(userCredentials.user?.uid);
    } on PlatformException catch (e) {
      print('PlatformException -> ${e.message}');
      return left(e);
    } catch (e) {
      print('Exception -> ${e.toString()}');
      return left(PlatformException(
        code: 'UNKNOWN_ERROR',
        message: 'An unknown error occurred.',
        details: e.toString(),
      ));
    }}
  }
