import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Sign Up with Email and Password
  Future<UserCredential?> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      // 1. Create account in Firebase Authentication
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // 2. Store user details in Firestore
        UserModel newUser = UserModel(
          fullName: fullName,
          email: email,
          createdAt: DateTime.now(),
        );

        await _db.collection('users').doc(userCredential.user!.uid).set(
          newUser.toMap(password),
        );
      }
      
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e);
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  // Handle Firebase Auth Errors
  String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'invalid-email':
        return 'The email address is not valid.';
      default:
        return e.message ?? 'Authentication failed.';
    }
  }
}
