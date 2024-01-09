import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withtone/models/created_at_field.dart';

part 'feedback.freezed.dart';
part 'feedback.g.dart';

@freezed
class Feedback with _$Feedback {
  const factory Feedback({
    required String id, /// ドキュメントID
    required String uid, /// 投稿者のUID
    required String comment, /// コメント
    @Default([]) List<String> favoriteUsers, /// お気に入りユーザーのUIDリスト
    @Default('') String url, /// 動画URL
    @CreatedAtField() DateTime? createdAt, /// 投稿時刻
  }) = _Feedback;
  factory Feedback.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFromJson(json);
}
