import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:withtone/providers/firebase_provider/firestore_provider.dart';
import 'package:withtone/views/pages/edit_profile/model/user.dart';

final usersReference = Provider.autoDispose((ref) {
  final firestore = ref.watch(firestoreProvider);
  return firestore.collection('users').withConverter(
        fromFirestore: (ds, _) {
          final data = ds.data();
          if (data == null) {
            return null;
          }
          return User.fromJson(data);
        },
        toFirestore: (value, _) => value?.toJson() ?? {},
      );
});
