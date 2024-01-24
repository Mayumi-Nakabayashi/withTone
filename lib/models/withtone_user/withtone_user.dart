import 'package:freezed_annotation/freezed_annotation.dart';

part 'withtone_user.freezed.dart';
part 'withtone_user.g.dart';

/// アプリ内で利用するユーザーモデルを定義
/// firebase_auth の User と区別するために Prefix: WithTone を付けている
@freezed
class WithToneUser with _$WithToneUser {
  const factory WithToneUser({
    required String id,
    required String userName,
    @Default('@withTone') String userId,
    @Default('') String userImage,
    @Default('') String selfIntroduction,
    @Default('') String tiktokUrl,
    @Default('') String youtubeUrl,
  }) = _WithToneUser;

  factory WithToneUser.fromJson(Map<String, dynamic> json) =>
      _$WithToneUserFromJson(json);
}
