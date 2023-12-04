import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:withtone/models/feedback/feedback.dart';
import 'package:withtone/providers/feedback/feedback_ref.dart';

part 'feedback_list.g.dart';

@riverpod
class FeedbackList extends _$FeedbackList {
  @override
  Future<List<Feedback>> build() async {
    List<Feedback> feedbackList = [];

    final feedbackRef = ref.watch(feedbackRefProvider);
    final doc = await feedbackRef.get();
    final feedbacks = doc.docs.map((e) => e.data()).toList();
    feedbackList = feedbacks;
    return feedbackList;
  }
}
