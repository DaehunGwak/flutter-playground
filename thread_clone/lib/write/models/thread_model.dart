import 'package:freezed_annotation/freezed_annotation.dart';

part 'thread_model.freezed.dart';
part 'thread_model.g.dart';

@freezed
@immutable
class ThreadModel with _$ThreadModel {
  const factory ThreadModel({
    required String userId,
    @Default("annonymous") String userName,
    @Default("") String content,
    @Default([]) List<String> imageUrls,
    required int createdTime,
  }) = _ThreadModel;

  factory ThreadModel.fromJson(Map<String, dynamic> json) =>
      _$ThreadModelFromJson(json);
}
