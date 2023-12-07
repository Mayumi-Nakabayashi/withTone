import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:withtone/views/pages/edit_profile/model/register.dart';

import '../../../../providers/firebase_provider/firestore_provider.dart';

final registerReference = Provider.autoDispose((ref) {
  final firestore = ref.watch(firestoreProvider);
  return firestore.collection('registers').withConverter(
        fromFirestore: (ds, _) {
          final data = ds.data();
          if (data == null) {
            return null;
          }
          return Register.fromJson(data);
        },
        toFirestore: (value, _) => value?.toJson() ?? {},
      );
});
