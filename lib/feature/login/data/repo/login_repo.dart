import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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