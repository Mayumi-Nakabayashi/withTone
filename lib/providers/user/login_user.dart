import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:withtone/models/withtone_user/withtone_user.dart';
import 'package:withtone/providers/auth/uid.dart';
import 'package:withtone/providers/user/users_reference.dart';

part 'login_user.g.dart';

// ログインしているユーザを取得する
@riverpod
class LoginUser extends _$LoginUser {
  @override
  Future<WithToneUser> build() async {
    final loginUserId = ref.watch(uidProvider);
    final usersRef = ref.watch(usersReferenceProvider);

    // ログインユーザのidで絞り込んだ結果(Query)のsnapshot
    final querySnapshot =
        await usersRef.where('id', isEqualTo: loginUserId).get();

    // QuerySnapshotに含まれるすべてのDocを要素に持つリストを取得
    final userDocs = querySnapshot.docs;

    // users document は、idがpkのため、最初の要素を取得すれば良い
    // NOTE: 上記担保されているか要検討
    final loginUser = userDocs.first.data();
    return loginUser;
  }
}
