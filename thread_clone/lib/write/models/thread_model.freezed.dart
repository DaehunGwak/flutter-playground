// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ThreadModel _$ThreadModelFromJson(Map<String, dynamic> json) {
  return _ThreadModel.fromJson(json);
}

/// @nodoc
mixin _$ThreadModel {
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  int get createdTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThreadModelCopyWith<ThreadModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadModelCopyWith<$Res> {
  factory $ThreadModelCopyWith(
          ThreadModel value, $Res Function(ThreadModel) then) =
      _$ThreadModelCopyWithImpl<$Res, ThreadModel>;
  @useResult
  $Res call(
      {String userId,
      String userName,
      String content,
      List<String> imageUrls,
      int createdTime});
}

/// @nodoc
class _$ThreadModelCopyWithImpl<$Res, $Val extends ThreadModel>
    implements $ThreadModelCopyWith<$Res> {
  _$ThreadModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? content = null,
    Object? imageUrls = null,
    Object? createdTime = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThreadModelImplCopyWith<$Res>
    implements $ThreadModelCopyWith<$Res> {
  factory _$$ThreadModelImplCopyWith(
          _$ThreadModelImpl value, $Res Function(_$ThreadModelImpl) then) =
      __$$ThreadModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String userName,
      String content,
      List<String> imageUrls,
      int createdTime});
}

/// @nodoc
class __$$ThreadModelImplCopyWithImpl<$Res>
    extends _$ThreadModelCopyWithImpl<$Res, _$ThreadModelImpl>
    implements _$$ThreadModelImplCopyWith<$Res> {
  __$$ThreadModelImplCopyWithImpl(
      _$ThreadModelImpl _value, $Res Function(_$ThreadModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? content = null,
    Object? imageUrls = null,
    Object? createdTime = null,
  }) {
    return _then(_$ThreadModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThreadModelImpl implements _ThreadModel {
  const _$ThreadModelImpl(
      {required this.userId,
      this.userName = "annonymous",
      this.content = "",
      final List<String> imageUrls = const [],
      required this.createdTime})
      : _imageUrls = imageUrls;

  factory _$ThreadModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThreadModelImplFromJson(json);

  @override
  final String userId;
  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final String content;
  final List<String> _imageUrls;
  @override
  @JsonKey()
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  final int createdTime;

  @override
  String toString() {
    return 'ThreadModel(userId: $userId, userName: $userName, content: $content, imageUrls: $imageUrls, createdTime: $createdTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, userName, content,
      const DeepCollectionEquality().hash(_imageUrls), createdTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadModelImplCopyWith<_$ThreadModelImpl> get copyWith =>
      __$$ThreadModelImplCopyWithImpl<_$ThreadModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThreadModelImplToJson(
      this,
    );
  }
}

abstract class _ThreadModel implements ThreadModel {
  const factory _ThreadModel(
      {required final String userId,
      final String userName,
      final String content,
      final List<String> imageUrls,
      required final int createdTime}) = _$ThreadModelImpl;

  factory _ThreadModel.fromJson(Map<String, dynamic> json) =
      _$ThreadModelImpl.fromJson;

  @override
  String get userId;
  @override
  String get userName;
  @override
  String get content;
  @override
  List<String> get imageUrls;
  @override
  int get createdTime;
  @override
  @JsonKey(ignore: true)
  _$$ThreadModelImplCopyWith<_$ThreadModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
