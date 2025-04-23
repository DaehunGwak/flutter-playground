// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Menu _$MenuFromJson(Map<String, dynamic> json) => _Menu(
      tabId: (json['tabId'] as num).toInt(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$MenuToJson(_Menu instance) => <String, dynamic>{
      'tabId': instance.tabId,
      'title': instance.title,
    };
