// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withtone_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WithToneUser _$WithToneUserFromJson(Map<String, dynamic> json) {
  return _WithToneUser.fromJson(json);
}

/// @nodoc
mixin _$WithToneUser {
// FirebaseAuth User の uid と一致する id
  String get id => throw _privateConstructorUsedError; // ユーザが編集可能な表示名
// FIXME: X や Tiktok のように nickName に変更する？
  String get userName =>
      throw _privateConstructorUsedError; // @hoge のように @から始まるユーザの名前（編集不可かつ重複しない）
// TODO: 作成時にユニークになるようバリデーションを行う
// FIXME: id と紛らわしいため、X や Tiktok のように userName に変更する？
  String get userId => throw _privateConstructorUsedError; // ユーザアイコンに表示する画像
  String get userImage => throw _privateConstructorUsedError; // マイページに表示する自己紹介文
  String get selfIntroduction =>
      throw _privateConstructorUsedError; // Major SNS URLs
  String get tiktokUrl => throw _privateConstructorUsedError;
  String get youtubeUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WithToneUserCopyWith<WithToneUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithToneUserCopyWith<$Res> {
  factory $WithToneUserCopyWith(
          WithToneUser value, $Res Function(WithToneUser) then) =
      _$WithToneUserCopyWithImpl<$Res, WithToneUser>;
  @useResult
  $Res call(
      {String id,
      String userName,
      String userId,
      String userImage,
      String selfIntroduction,
      String tiktokUrl,
      String youtubeUrl});
}

/// @nodoc
class _$WithToneUserCopyWithImpl<$Res, $Val extends WithToneUser>
    implements $WithToneUserCopyWith<$Res> {
  _$WithToneUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? userId = null,
    Object? userImage = null,
    Object? selfIntroduction = null,
    Object? tiktokUrl = null,
    Object? youtubeUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String,
      selfIntroduction: null == selfIntroduction
          ? _value.selfIntroduction
          : selfIntroduction // ignore: cast_nullable_to_non_nullable
              as String,
      tiktokUrl: null == tiktokUrl
          ? _value.tiktokUrl
          : tiktokUrl // ignore: cast_nullable_to_non_nullable
              as String,
      youtubeUrl: null == youtubeUrl
          ? _value.youtubeUrl
          : youtubeUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WithToneUserImplCopyWith<$Res>
    implements $WithToneUserCopyWith<$Res> {
  factory _$$WithToneUserImplCopyWith(
          _$WithToneUserImpl value, $Res Function(_$WithToneUserImpl) then) =
      __$$WithToneUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userName,
      String userId,
      String userImage,
      String selfIntroduction,
      String tiktokUrl,
      String youtubeUrl});
}

/// @nodoc
class __$$WithToneUserImplCopyWithImpl<$Res>
    extends _$WithToneUserCopyWithImpl<$Res, _$WithToneUserImpl>
    implements _$$WithToneUserImplCopyWith<$Res> {
  __$$WithToneUserImplCopyWithImpl(
      _$WithToneUserImpl _value, $Res Function(_$WithToneUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? userId = null,
    Object? userImage = null,
    Object? selfIntroduction = null,
    Object? tiktokUrl = null,
    Object? youtubeUrl = null,
  }) {
    return _then(_$WithToneUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String,
      selfIntroduction: null == selfIntroduction
          ? _value.selfIntroduction
          : selfIntroduction // ignore: cast_nullable_to_non_nullable
              as String,
      tiktokUrl: null == tiktokUrl
          ? _value.tiktokUrl
          : tiktokUrl // ignore: cast_nullable_to_non_nullable
              as String,
      youtubeUrl: null == youtubeUrl
          ? _value.youtubeUrl
          : youtubeUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WithToneUserImpl implements _WithToneUser {
  const _$WithToneUserImpl(
      {required this.id,
      required this.userName,
      this.userId = '@withTone',
      this.userImage = '',
      this.selfIntroduction = '',
      this.tiktokUrl = '',
      this.youtubeUrl = ''});

  factory _$WithToneUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$WithToneUserImplFromJson(json);

// FirebaseAuth User の uid と一致する id
  @override
  final String id;
// ユーザが編集可能な表示名
// FIXME: X や Tiktok のように nickName に変更する？
  @override
  final String userName;
// @hoge のように @から始まるユーザの名前（編集不可かつ重複しない）
// TODO: 作成時にユニークになるようバリデーションを行う
// FIXME: id と紛らわしいため、X や Tiktok のように userName に変更する？
  @override
  @JsonKey()
  final String userId;
// ユーザアイコンに表示する画像
  @override
  @JsonKey()
  final String userImage;
// マイページに表示する自己紹介文
  @override
  @JsonKey()
  final String selfIntroduction;
// Major SNS URLs
  @override
  @JsonKey()
  final String tiktokUrl;
  @override
  @JsonKey()
  final String youtubeUrl;

  @override
  String toString() {
    return 'WithToneUser(id: $id, userName: $userName, userId: $userId, userImage: $userImage, selfIntroduction: $selfIntroduction, tiktokUrl: $tiktokUrl, youtubeUrl: $youtubeUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithToneUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.selfIntroduction, selfIntroduction) ||
                other.selfIntroduction == selfIntroduction) &&
            (identical(other.tiktokUrl, tiktokUrl) ||
                other.tiktokUrl == tiktokUrl) &&
            (identical(other.youtubeUrl, youtubeUrl) ||
                other.youtubeUrl == youtubeUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userName, userId, userImage,
      selfIntroduction, tiktokUrl, youtubeUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WithToneUserImplCopyWith<_$WithToneUserImpl> get copyWith =>
      __$$WithToneUserImplCopyWithImpl<_$WithToneUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WithToneUserImplToJson(
      this,
    );
  }
}

abstract class _WithToneUser implements WithToneUser {
  const factory _WithToneUser(
      {required final String id,
      required final String userName,
      final String userId,
      final String userImage,
      final String selfIntroduction,
      final String tiktokUrl,
      final String youtubeUrl}) = _$WithToneUserImpl;

  factory _WithToneUser.fromJson(Map<String, dynamic> json) =
      _$WithToneUserImpl.fromJson;

  @override // FirebaseAuth User の uid と一致する id
  String get id;
  @override // ユーザが編集可能な表示名
// FIXME: X や Tiktok のように nickName に変更する？
  String get userName;
  @override // @hoge のように @から始まるユーザの名前（編集不可かつ重複しない）
// TODO: 作成時にユニークになるようバリデーションを行う
// FIXME: id と紛らわしいため、X や Tiktok のように userName に変更する？
  String get userId;
  @override // ユーザアイコンに表示する画像
  String get userImage;
  @override // マイページに表示する自己紹介文
  String get selfIntroduction;
  @override // Major SNS URLs
  String get tiktokUrl;
  @override
  String get youtubeUrl;
  @override
  @JsonKey(ignore: true)
  _$$WithToneUserImplCopyWith<_$WithToneUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
