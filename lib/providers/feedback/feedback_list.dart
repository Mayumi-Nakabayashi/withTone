import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:withtone/models/feedback/feedback.dart';
import 'package:withtone/models/post.dart';
import 'package:withtone/providers/auth/uid.dart';
import 'package:withtone/providers/feedback/feedback_ref.dart';

part 'feedback_list.g.dart';

@riverpod
class FeedbackList extends _$FeedbackList {
  //フィードバックを取得してくるメソッド
  Future<List<Feedback>> fetchFeedback(Post post) async {
    final feedbackRef = ref.watch(feedbackRefProvider(post));
    final doc = await feedbackRef.get();
    final feedbacks = doc.docs.map((e) => e.data()).toList();
    return feedbacks;
  }

  @override
  FutureOr<List<Feedback>> build(Post post) async {
    return fetchFeedback(post);
  }

  //フィードバックを再取得するメソッド
  Future<void> refreshFeedback(Post post) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      return fetchFeedback(post);
    });
  }

  //フィードバックを追加するメソッド
  Future<void> addFeedback(String comment, Post post) async {
    if (comment == '') {
      throw ('コメントを入力してください');
    }
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final feedbackRef = ref.read(feedbackRefProvider(post)).doc();
      final uid = ref.read(uidProvider);
      final feedback = Feedback(id: feedbackRef.id, uid: uid, comment: comment);
      await feedbackRef.set(feedback);
      return fetchFeedback(post);
    });
  }
}
