// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuDto {
  String get title;
  int get tabId;

  /// Create a copy of MenuDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MenuDtoCopyWith<MenuDto> get copyWith =>
      _$MenuDtoCopyWithImpl<MenuDto>(this as MenuDto, _$identity);

  /// Serializes this MenuDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MenuDto &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.tabId, tabId) || other.tabId == tabId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, tabId);

  @override
  String toString() {
    return 'MenuDto(title: $title, tabId: $tabId)';
  }
}

/// @nodoc
abstract mixin class $MenuDtoCopyWith<$Res> {
  factory $MenuDtoCopyWith(MenuDto value, $Res Function(MenuDto) _then) =
      _$MenuDtoCopyWithImpl;
  @useResult
  $Res call({String title, int tabId});
}

/// @nodoc
class _$MenuDtoCopyWithImpl<$Res> implements $MenuDtoCopyWith<$Res> {
  _$MenuDtoCopyWithImpl(this._self, this._then);

  final MenuDto _self;
  final $Res Function(MenuDto) _then;

  /// Create a copy of MenuDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? tabId = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tabId: null == tabId
          ? _self.tabId
          : tabId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MenuDto implements MenuDto {
  const _MenuDto({this.title = '', this.tabId = -1});
  factory _MenuDto.fromJson(Map<String, dynamic> json) =>
      _$MenuDtoFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final int tabId;

  /// Create a copy of MenuDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MenuDtoCopyWith<_MenuDto> get copyWith =>
      __$MenuDtoCopyWithImpl<_MenuDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MenuDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MenuDto &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.tabId, tabId) || other.tabId == tabId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, tabId);

  @override
  String toString() {
    return 'MenuDto(title: $title, tabId: $tabId)';
  }
}

/// @nodoc
abstract mixin class _$MenuDtoCopyWith<$Res> implements $MenuDtoCopyWith<$Res> {
  factory _$MenuDtoCopyWith(_MenuDto value, $Res Function(_MenuDto) _then) =
      __$MenuDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String title, int tabId});
}

/// @nodoc
class __$MenuDtoCopyWithImpl<$Res> implements _$MenuDtoCopyWith<$Res> {
  __$MenuDtoCopyWithImpl(this._self, this._then);

  final _MenuDto _self;
  final $Res Function(_MenuDto) _then;

  /// Create a copy of MenuDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? tabId = null,
  }) {
    return _then(_MenuDto(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tabId: null == tabId
          ? _self.tabId
          : tabId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
