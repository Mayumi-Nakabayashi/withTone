import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  AuthRepository(this.firebaseAuth);
  final FirebaseAuth firebaseAuth;

  Future<dynamic> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (error) {
      return null;
    }
  }

  Future<dynamic> signIn({
    required String email,
    required String password,
  }) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
