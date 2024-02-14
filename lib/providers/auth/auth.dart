import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  FirebaseAuth build() {
    final auth = FirebaseAuth.instance;
    return auth;
  }
}
