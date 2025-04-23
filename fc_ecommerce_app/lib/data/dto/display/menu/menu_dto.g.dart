// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuDto _$MenuDtoFromJson(Map<String, dynamic> json) => _MenuDto(
      title: json['title'] as String? ?? '',
      tabId: (json['tabId'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$MenuDtoToJson(_MenuDto instance) => <String, dynamic>{
      'title': instance.title,
      'tabId': instance.tabId,
    };
