import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:withtone/models/feedback/feedback.dart';
import 'package:withtone/providers/auth/uid.dart';
import 'package:withtone/providers/feedback/feedback_ref.dart';

part 'add_feedback.g.dart';

@riverpod
class AddFeedback extends _$AddFeedback {
  @override
  void build() {
    return;
  }

  Future<void> addFeedback(String comment) async {
    if (comment == '') {
      throw ('コメントを入力してください');
    }
    final feedbackRef = ref.read(feedbackRefProvider).doc();
    final uid = ref.read(uidProvider);
    final feedback = Feedback(id: feedbackRef.id, uid: uid, comment: comment);
    await feedbackRef.set(feedback);
  }
}
