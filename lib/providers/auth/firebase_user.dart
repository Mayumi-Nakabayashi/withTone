import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:withtone/providers/auth/auth.dart';

part 'firebase_user.g.dart';

@riverpod
class FirebaseUser extends _$FirebaseUser {
  @override
  User? build() {
    final auth = ref.watch(authProvider);
    final user = auth.currentUser;
    return user;
  }
}
