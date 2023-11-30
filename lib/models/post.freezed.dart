// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  /// posts/{id} で表されるドキュメントのID
  String get id => throw _privateConstructorUsedError;

  /// uid は、投稿したユーザーのID
  ///
  /// uid は Auth でログインした時に取得できる
  String get uid => throw _privateConstructorUsedError;

  /// タイトル
  String get title => throw _privateConstructorUsedError;

  /// 本文
  String get body => throw _privateConstructorUsedError;

  /// 動画のURL
  String get movieUrl => throw _privateConstructorUsedError;

  /// 紐づけられたタグ一覧
  ///
  /// タグ名がそのまま入る
  List<String> get tags => throw _privateConstructorUsedError;

  /// 作成日時
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// 更新日時
  ///
  /// [body] や [title] が更新されたら更新される。
  /// コメントやいいね数などが増えても更新されない。
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {String id,
      String uid,
      String title,
      String body,
      String movieUrl,
      List<String> tags,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? title = null,
    Object? body = null,
    Object? movieUrl = null,
    Object? tags = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      movieUrl: null == movieUrl
          ? _value.movieUrl
          : movieUrl // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String uid,
      String title,
      String body,
      String movieUrl,
      List<String> tags,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? title = null,
    Object? body = null,
    Object? movieUrl = null,
    Object? tags = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      movieUrl: null == movieUrl
          ? _value.movieUrl
          : movieUrl // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  const _$PostImpl(
      {required this.id,
      required this.uid,
      required this.title,
      required this.body,
      required this.movieUrl,
      required final List<String> tags,
      required this.createdAt,
      required this.updatedAt})
      : _tags = tags;

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  /// posts/{id} で表されるドキュメントのID
  @override
  final String id;

  /// uid は、投稿したユーザーのID
  ///
  /// uid は Auth でログインした時に取得できる
  @override
  final String uid;

  /// タイトル
  @override
  final String title;

  /// 本文
  @override
  final String body;

  /// 動画のURL
  @override
  final String movieUrl;

  /// 紐づけられたタグ一覧
  ///
  /// タグ名がそのまま入る
  final List<String> _tags;

  /// 紐づけられたタグ一覧
  ///
  /// タグ名がそのまま入る
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  /// 作成日時
  @override
  final DateTime createdAt;

  /// 更新日時
  ///
  /// [body] や [title] が更新されたら更新される。
  /// コメントやいいね数などが増えても更新されない。
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Post(id: $id, uid: $uid, title: $title, body: $body, movieUrl: $movieUrl, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.movieUrl, movieUrl) ||
                other.movieUrl == movieUrl) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, uid, title, body, movieUrl,
      const DeepCollectionEquality().hash(_tags), createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {required final String id,
      required final String uid,
      required final String title,
      required final String body,
      required final String movieUrl,
      required final List<String> tags,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override

  /// posts/{id} で表されるドキュメントのID
  String get id;
  @override

  /// uid は、投稿したユーザーのID
  ///
  /// uid は Auth でログインした時に取得できる
  String get uid;
  @override

  /// タイトル
  String get title;
  @override

  /// 本文
  String get body;
  @override

  /// 動画のURL
  String get movieUrl;
  @override

  /// 紐づけられたタグ一覧
  ///
  /// タグ名がそのまま入る
  List<String> get tags;
  @override

  /// 作成日時
  DateTime get createdAt;
  @override

  /// 更新日時
  ///
  /// [body] や [title] が更新されたら更新される。
  /// コメントやいいね数などが増えても更新されない。
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
