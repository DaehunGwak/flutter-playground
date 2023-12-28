// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThreadModelImpl _$$ThreadModelImplFromJson(Map<String, dynamic> json) =>
    _$ThreadModelImpl(
      userId: json['userId'] as String,
      userName: json['userName'] as String? ?? "annonymous",
      content: json['content'] as String? ?? "",
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdTime: json['createdTime'] as int,
    );

Map<String, dynamic> _$$ThreadModelImplToJson(_$ThreadModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'content': instance.content,
      'imageUrls': instance.imageUrls,
      'createdTime': instance.createdTime,
    };
