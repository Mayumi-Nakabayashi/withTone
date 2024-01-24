import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:withtone/models/withtone_user/withtone_user.dart';
import 'package:withtone/providers/firebase_provider/firestore_provider.dart';

part 'users_reference.g.dart';

// users collectionの参照を取得する
@riverpod
class UsersReference extends _$UsersReference {
  @override
  CollectionReference<WithToneUser> build() {
    final firestore = ref.watch(firestoreProvider);
    return firestore.collection('users').withConverter(
          fromFirestore: (ds, _) {
            final data = ds.data() ?? {};
            return WithToneUser.fromJson(data);
          },
          toFirestore: (user, _) => user.toJson(),
        );
  }
}
