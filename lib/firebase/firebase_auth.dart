import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_2/screens/homepage/home_page.dart';

class FirebaseAuthHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Registration method
  Future<void> registerUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // Create a new user with Firebase
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registered successfully")),
      );
    } on FirebaseAuthException catch (e) {
      // Handle Firebase errors
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("The email is already in use")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.message}")),
        );
      }
    } catch (e) {
      // Handle other errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An unexpected error occurred: $e")),
      );
    }
  }

  static Future<void> userLogin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // Attempt to sign in the user
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // Navigate to HomePage upon successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      // Handle specific error codes
      String errorMessage;

      if (e.code == 'user-not-found') {
        errorMessage = "The email address is not registered.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "The password you entered is incorrect.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "The email address is not valid.";
      } else {
        errorMessage = "Enter valid email and password";
      }

      // Show error message using SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      // Handle other unexpected errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: ${e.toString()}")),
      );
    }
  }
}
