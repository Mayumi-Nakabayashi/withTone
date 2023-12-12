import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withtone/models/created_at_field.dart';
import 'package:withtone/models/time_stamp_field.dart';

part 'post.freezed.dart';
part 'post.g.dart';

/// 投稿のデータモデル
@freezed
class Post with _$Post {
  const factory Post({
    /// posts/{id} で表されるドキュメントのID
    required String id,

    /// uid は、投稿したユーザーのID
    ///
    /// uid は Auth でログインした時に取得できる
    required String uid,

    /// タイトル
    required String title,

    /// 本文
    required String body,

    /// 動画のURL
    required String movieUrl,

    /// 紐づけられたタグ一覧
    ///
    /// タグ名がそのまま入る
    required List<String> tags,

    /// 作成日時
    @CreatedAtField() required DateTime? createdAt,

    /// 更新日時
    ///
    /// [body] や [title] が更新されたら更新される。
    /// コメントやいいね数などが増えても更新されない。
    @UpdatedAtField() required DateTime? updatedAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
