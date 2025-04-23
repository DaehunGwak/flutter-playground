// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResponseWrapper<T> implements DiagnosticableTreeMixin {
  String get status;
  String get code;
  String get message;
  T? get data;

  /// Create a copy of ResponseWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponseWrapperCopyWith<T, ResponseWrapper<T>> get copyWith =>
      _$ResponseWrapperCopyWithImpl<T, ResponseWrapper<T>>(
          this as ResponseWrapper<T>, _$identity);

  /// Serializes this ResponseWrapper to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ResponseWrapper<$T>'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseWrapper<T> &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, code, message,
      const DeepCollectionEquality().hash(data));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponseWrapper<$T>(status: $status, code: $code, message: $message, data: $data)';
  }
}

/// @nodoc
abstract mixin class $ResponseWrapperCopyWith<T, $Res> {
  factory $ResponseWrapperCopyWith(
          ResponseWrapper<T> value, $Res Function(ResponseWrapper<T>) _then) =
      _$ResponseWrapperCopyWithImpl;
  @useResult
  $Res call({String status, String code, String message, T? data});
}

/// @nodoc
class _$ResponseWrapperCopyWithImpl<T, $Res>
    implements $ResponseWrapperCopyWith<T, $Res> {
  _$ResponseWrapperCopyWithImpl(this._self, this._then);

  final ResponseWrapper<T> _self;
  final $Res Function(ResponseWrapper<T>) _then;

  /// Create a copy of ResponseWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _ResponseWrapper<T>
    with DiagnosticableTreeMixin
    implements ResponseWrapper<T> {
  const _ResponseWrapper(
      {this.status = '', this.code = '', this.message = '', this.data});
  factory _ResponseWrapper.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ResponseWrapperFromJson(json, fromJsonT);

  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String message;
  @override
  final T? data;

  /// Create a copy of ResponseWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResponseWrapperCopyWith<T, _ResponseWrapper<T>> get copyWith =>
      __$ResponseWrapperCopyWithImpl<T, _ResponseWrapper<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$ResponseWrapperToJson<T>(this, toJsonT);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ResponseWrapper<$T>'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResponseWrapper<T> &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, code, message,
      const DeepCollectionEquality().hash(data));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponseWrapper<$T>(status: $status, code: $code, message: $message, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$ResponseWrapperCopyWith<T, $Res>
    implements $ResponseWrapperCopyWith<T, $Res> {
  factory _$ResponseWrapperCopyWith(
          _ResponseWrapper<T> value, $Res Function(_ResponseWrapper<T>) _then) =
      __$ResponseWrapperCopyWithImpl;
  @override
  @useResult
  $Res call({String status, String code, String message, T? data});
}

/// @nodoc
class __$ResponseWrapperCopyWithImpl<T, $Res>
    implements _$ResponseWrapperCopyWith<T, $Res> {
  __$ResponseWrapperCopyWithImpl(this._self, this._then);

  final _ResponseWrapper<T> _self;
  final $Res Function(_ResponseWrapper<T>) _then;

  /// Create a copy of ResponseWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_ResponseWrapper<T>(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

// dart format on
