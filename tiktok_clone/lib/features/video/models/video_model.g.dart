// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoModelImpl _$$VideoModelImplFromJson(Map<String, dynamic> json) =>
    _$VideoModelImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      fileUrl: json['fileUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      creatorUid: json['creatorUid'] as String,
      creatorName: json['creatorName'] as String,
      likes: json['likes'] as int,
      comments: json['comments'] as int,
      createdAt: json['createdAt'] as int,
    );

Map<String, dynamic> _$$VideoModelImplToJson(_$VideoModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'fileUrl': instance.fileUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'creatorUid': instance.creatorUid,
      'creatorName': instance.creatorName,
      'likes': instance.likes,
      'comments': instance.comments,
      'createdAt': instance.createdAt,
    };
