import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/Networking/api_constants.dart';
import '../../../../core/error/api_error_model.dart';
import '../../../../core/error/error_handler.dart';

import '../model/login_model.dart';
import '../model/login_response_model.dart';

class LoginRepoImpl {


  LoginRepoImpl();
  Future<Either<String, User>> loginUser(String email, String password) async {
    try {
      // Authenticate the user with email and password
      final userCredentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // Return the user object on success
      return right(userCredentials.user!);
    } on FirebaseAuthException catch (e) {
      String errorMessage;
        print(e.message);
      // Handle specific FirebaseAuth error codes
      if (e.message == 'The supplied auth credential is incorrect, malformed or has expired.') {
        errorMessage = "Incorrect email or password";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Incorrect password.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "Invalid email address.";
      } else {
        errorMessage = e.message ?? "An unexpected error occurred.";
      }

      // Return the error message
      return left(errorMessage);
    } catch (e) {
      // Handle unexpected errors
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
 //Future<Either<ApiErrorModel, LoginResponseModel>> LoginUser(LoginModel loginModel)  async {
 //  try {
 //    var data = await apiService.post(
 //        endPoint: ApiConstants.login, data: loginModel.toMap());
 //    return right(LoginResponseModel.fromMap(data));
 //  } catch (e) {
 //    return left(ApiErrorHandler.handle(e));
 //  }
 //}
}