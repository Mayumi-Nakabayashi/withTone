import 'package:freezed_annotation/freezed_annotation.dart';

part 'register.freezed.dart';
part 'register.g.dart';

@freezed
class Register with _$Register {
  const factory Register({
    required String id,
    required String userName,
    @Default('@withTone') String userId,
    @Default('') String userImage,
    @Default('') String selfIntroduction,
    @Default('') String tiktokUrl,
    @Default('') String youtubeUrl,
  }) = _Register;

  factory Register.fromJson(Map<String, dynamic> json) =>
      _$RegisterFromJson(json);
}
