// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackImpl _$$FeedbackImplFromJson(Map<String, dynamic> json) =>
    _$FeedbackImpl(
      id: json['id'] as String,
      uid: json['uid'] as String,
      comment: json['comment'] as String,
      favoriteUsers: (json['favoriteUsers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      url: json['url'] as String? ?? '',
      createdAt: const CreatedAtField().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$FeedbackImplToJson(_$FeedbackImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'comment': instance.comment,
      'favoriteUsers': instance.favoriteUsers,
      'url': instance.url,
      'createdAt': const CreatedAtField().toJson(instance.createdAt),
    };
