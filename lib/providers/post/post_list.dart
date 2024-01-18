import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:withtone/models/post/post.dart';
import 'package:withtone/providers/auth/uid.dart';
import 'package:withtone/providers/post/post_ref.dart';

part 'post_list.g.dart';

@riverpod
class PostList extends _$PostList {
  // postを取得してくるメソッド（メインコンテンツ部分）
  Future<List<Post>> fetchPost() async {
    final postRef = ref.watch(postRefProvider);
    final doc = await postRef.orderBy('createdAt', descending: true).get();
    final posts = doc.docs.map((e) => e.data()).toList();
    return posts;
  }

  @override
  FutureOr<List<Post>> build() async {
    return fetchPost();
  }

// postを追加するメソッド
  Future<void> addPost({
    required String title,
    required String body,
    required String movieUrl,
    required List<String> tags,
  }) async {
    if (title.isEmpty) {
      throw ('コメントを入力してください');
    }

    final postRef = ref.read(postRefProvider).doc();
    final uid = ref.read(uidProvider);

    final post = Post(
      id: postRef.id,
      uid: uid,
      title: title,
      body: body,
      movieUrl: movieUrl,
      tags: tags,
      createdAt: null,
      updatedAt: null,
    );

    await postRef.set(post);
  }
}
