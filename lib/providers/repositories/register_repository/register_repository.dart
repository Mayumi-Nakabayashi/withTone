import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:withtone/models/user/register.dart';

class RegisterRepository {
  static final fireStore = FirebaseFirestore.instance;
  static final registerCollection = fireStore.collection('register');
  static DocumentReference getDocumentRef(String uid) =>
      registerCollection.doc(uid);

  static Future<void> updateRegister(Register register) async {
    await registerCollection
        .doc(register.id)
        .set(register.toJson(), SetOptions(merge: true));
  }
}
