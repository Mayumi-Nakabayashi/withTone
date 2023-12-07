// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterImpl _$$RegisterImplFromJson(Map<String, dynamic> json) =>
    _$RegisterImpl(
      id: json['id'] as String,
      userName: json['userName'] as String,
      userId: json['userId'] as String? ?? '@withTone',
      userImage: json['userImage'] as String? ?? '',
      selfIntroduction: json['selfIntroduction'] as String? ?? '',
      tiktokUrl: json['tiktokUrl'] as String? ?? '',
      youtubeUrl: json['youtubeUrl'] as String? ?? '',
    );

Map<String, dynamic> _$$RegisterImplToJson(_$RegisterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'userId': instance.userId,
      'userImage': instance.userImage,
      'selfIntroduction': instance.selfIntroduction,
      'tiktokUrl': instance.tiktokUrl,
      'youtubeUrl': instance.youtubeUrl,
    };
