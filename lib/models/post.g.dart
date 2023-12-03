// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as String,
      uid: json['uid'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      movieUrl: json['movieUrl'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt:
          const TimestampField().fromJson(json['createdAt'] as Timestamp?),
      updatedAt:
          const TimestampField().fromJson(json['updatedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'title': instance.title,
      'body': instance.body,
      'movieUrl': instance.movieUrl,
      'tags': instance.tags,
      'createdAt': const TimestampField().toJson(instance.createdAt),
      'updatedAt': const TimestampField().toJson(instance.updatedAt),
    };
