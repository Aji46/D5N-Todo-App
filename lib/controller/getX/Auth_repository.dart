import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      throw Exception("Failed to register: $e");
    }
  }

  Future<void> storeUserData(String uid, String name, String email) async {
    try {
      await _firestore.collection("users").doc(uid).set({
        "name": name,
        "email": email,
        "createdAt": FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception("Failed to save user data: $e");
    }
  }
}
