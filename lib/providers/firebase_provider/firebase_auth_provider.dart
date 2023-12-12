import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// FirebaseAuthのインスタンス
final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);

/// ユーザーのuid
final uidProvider = Provider((ref) {
  return ref.read(firebaseAuthProvider).currentUser?.uid;
});
