/// 投稿のデータモデル

import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    /// posts/{id} で表されるドキュメントのID
    required String id,

    // uid は、投稿したユーザーのID??
    required String uid,

    /// タイトル
    required String title,

    /// 本文
    required String body,

    /// 動画のURL
    ///
    /// 画像が入る可能性もある? 分けた方がよさそう
    required String movieUrl,

    /// お気に入りしたユーザー
    required List<String> favoriteUsers,

    /// 紐づけられたタグ一覧
    required List<String> tags,

    /// 作成日時
    required DateTime createdAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
