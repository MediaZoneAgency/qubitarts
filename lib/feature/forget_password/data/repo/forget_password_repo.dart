import 'package:firebase_auth/firebase_auth.dart';


class ForgetPassWord {
  // Define the AuthStatus enum (success or failure)
  Future<AuthStatus> sendRecoveryEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return AuthStatus.success; // Return success status
    } catch (e) {
      print("Error: $e");
      return AuthStatus.failure; // Return failure status if error occurs
    }
  }
}

// Enum to represent the result of the password reset attempt
enum AuthStatus {
  success,
  failure,
}
