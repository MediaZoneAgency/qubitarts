import 'package:firebase_auth/firebase_auth.dart';

class ForgetPassword {
  // Define the AuthStatus enum (success or failure)
  Future<String> sendRecoveryEmail(String email) async {
    try {
      // Send password reset email
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return "success"; // Return success status
    } catch (e) {
      print("Error: $e"); // Log the error for debugging
      return "failure"; // Return failure status if error occurs
    }
  }
}

// Enum to represent the result of the password reset attempt
enum AuthStatus {
  success,
  failure,
}
