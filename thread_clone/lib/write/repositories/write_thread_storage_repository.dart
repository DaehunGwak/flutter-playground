import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WriteThreadStorageRepository {
  final _storage = FirebaseStorage.instance;

  Future<List<String>> uploadImages(
    String uid,
    List<File> images,
    int createdTime,
  ) async {
    final List<String> imageUrls = [];
    final ref = _storage.ref();

    for (int i = 0; i < images.length; i++) {
      final taskSnapshot = await ref
          .child('threads/images/$uid/$createdTime-$i')
          .putFile(images.elementAt(i));
      imageUrls.add(await taskSnapshot.ref.getDownloadURL());
    }
    return imageUrls;
  }
}

final writeThreadStorageRepository =
    Provider((ref) => WriteThreadStorageRepository());
