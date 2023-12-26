import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:withtone/providers/auth/firebase_user.dart';

part 'uid.g.dart';

@riverpod
class Uid extends _$Uid {
  @override
  String build() {
    final user = ref.watch(firebaseUserProvider);
    final uid = user!.uid;
    return uid;
  }
}
