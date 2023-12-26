import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withtone/models/created_at_field.dart';

part 'feedback.freezed.dart';
part 'feedback.g.dart';

@freezed
class Feedback with _$Feedback {
  const factory Feedback({
    required String id,
    required String uid,
    required String comment,
    @Default([]) List<String> favoriteUsers,
    @Default('') String url,
    @CreatedAtField() DateTime? createdAt,
  }) = _Feedback;
  factory Feedback.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFromJson(json);
}
