import 'package:freezed_annotation/freezed_annotation.dart';

part 'withtone_user.freezed.dart';
part 'withtone_user.g.dart';

/// アプリ内で利用するユーザーモデルを定義
/// firebase_auth の User と区別するために Prefix: WithTone を付けている
@freezed
class WithToneUser with _$WithToneUser {
  const factory WithToneUser({
    // FirebaseAuth User の uid と一致する id
    required String id,

    // ユーザが編集可能な表示名
    // FIXME: X や Tiktok のように nickName に変更する？
    required String userName,

    // @hoge のように @から始まるユーザの名前（編集不可かつ重複しない）
    // TODO: 作成時にユニークになるようバリデーションを行う
    // FIXME: id と紛らわしいため、X や Tiktok のように userName に変更する？
    @Default('@withTone') String userId,

    // ユーザアイコンに表示する画像
    @Default('') String userImage,

    // マイページに表示する自己紹介文
    @Default('') String selfIntroduction,

    // Major SNS URLs
    @Default('') String tiktokUrl,
    @Default('') String youtubeUrl,
  }) = _WithToneUser;

  factory WithToneUser.fromJson(Map<String, dynamic> json) =>
      _$WithToneUserFromJson(json);
}
