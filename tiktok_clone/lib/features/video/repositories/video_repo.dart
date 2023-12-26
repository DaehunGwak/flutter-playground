import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/video/models/video_model.dart';

class VideoRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// firebase store path: /videos/{userId}/{videoId}
  UploadTask uploadVideoFile(File file, String uid) {
    final fileRef = _storage
        .ref()
        .child('/videos/$uid/${DateTime.now().millisecondsSinceEpoch}');
    return fileRef.putFile(file);
  }

  Future<void> saveVideo(VideoModel videoModel) async {
    await _db.collection('videos').add(videoModel.toJson());
  }
}

final videoRepoProvider = Provider((ref) => VideoRepository());
