import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

/// we need to run below command after writing class wrapped by freezed
/// `dart run build_runner build`
@freezed
class VideoModel with _$VideoModel {
  const factory VideoModel({
    required String title,
    required String description,
    required String fileUrl,
    required String thumbnailUrl,
    required String creatorUid,
    required String creatorName,
    required int likes,
    required int comments,
    required int createdAt,
  }) = _VideoModel;

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);
}
