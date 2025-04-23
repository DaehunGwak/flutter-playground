// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Menu {
  int get tabId;
  String get title;

  /// Create a copy of Menu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MenuCopyWith<Menu> get copyWith =>
      _$MenuCopyWithImpl<Menu>(this as Menu, _$identity);

  /// Serializes this Menu to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Menu &&
            (identical(other.tabId, tabId) || other.tabId == tabId) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tabId, title);

  @override
  String toString() {
    return 'Menu(tabId: $tabId, title: $title)';
  }
}

/// @nodoc
abstract mixin class $MenuCopyWith<$Res> {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) _then) =
      _$MenuCopyWithImpl;
  @useResult
  $Res call({int tabId, String title});
}

/// @nodoc
class _$MenuCopyWithImpl<$Res> implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(this._self, this._then);

  final Menu _self;
  final $Res Function(Menu) _then;

  /// Create a copy of Menu
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabId = null,
    Object? title = null,
  }) {
    return _then(_self.copyWith(
      tabId: null == tabId
          ? _self.tabId
          : tabId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Menu implements Menu {
  const _Menu({required this.tabId, required this.title});
  factory _Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  @override
  final int tabId;
  @override
  final String title;

  /// Create a copy of Menu
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MenuCopyWith<_Menu> get copyWith =>
      __$MenuCopyWithImpl<_Menu>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MenuToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Menu &&
            (identical(other.tabId, tabId) || other.tabId == tabId) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tabId, title);

  @override
  String toString() {
    return 'Menu(tabId: $tabId, title: $title)';
  }
}

/// @nodoc
abstract mixin class _$MenuCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$MenuCopyWith(_Menu value, $Res Function(_Menu) _then) =
      __$MenuCopyWithImpl;
  @override
  @useResult
  $Res call({int tabId, String title});
}

/// @nodoc
class __$MenuCopyWithImpl<$Res> implements _$MenuCopyWith<$Res> {
  __$MenuCopyWithImpl(this._self, this._then);

  final _Menu _self;
  final $Res Function(_Menu) _then;

  /// Create a copy of Menu
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tabId = null,
    Object? title = null,
  }) {
    return _then(_Menu(
      tabId: null == tabId
          ? _self.tabId
          : tabId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
