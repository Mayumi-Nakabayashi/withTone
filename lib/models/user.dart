import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String userName,
    @Default('@withTone') String userId,
    @Default('') String userImage,
    @Default('') String selfIntroduction,
    @Default('') String tiktokUrl,
    @Default('') String youtubeUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
