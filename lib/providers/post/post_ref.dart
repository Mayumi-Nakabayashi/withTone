import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:withtone/models/post.dart';

part 'post_ref.g.dart';

@riverpod
class PostRef extends _$PostRef {
  @override
  CollectionReference<Post> build() {
    final postRef =
        FirebaseFirestore.instance.collection('posts').withConverter<Post>(
              fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
              toFirestore: (feedback, _) => feedback.toJson(),
            );
    return postRef;
  }
}
