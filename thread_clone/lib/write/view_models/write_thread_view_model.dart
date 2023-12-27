import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/auth/repositories/firebase_auth_repository.dart';
import 'package:thread_clone/write/models/thread_model.dart';
import 'package:thread_clone/write/repositories/write_thread_firestore_repository.dart';
import 'package:thread_clone/write/repositories/write_thread_storage_repository.dart';

class WriteThreadViewModel extends AsyncNotifier<void> {
  late final WriteThreadFirestoreRepository _firestoreRepository;
  late final WriteThreadStorageRepository _storageRepository;

  @override
  FutureOr<void> build() {
    _firestoreRepository = ref.read(writeThreadFirestoreRepository);
    _storageRepository = ref.read(writeThreadStorageRepository);
  }

  Future<void> addThread({
    required String content,
    required List<File> images,
  }) async {
    state = const AsyncValue.loading();

    final uid = ref.read(firebaseAuthRepoProvider).user!.uid;
    final createdTime = DateTime.now().millisecondsSinceEpoch;

    state = await AsyncValue.guard(() async {
      final imageUrls =
          await _storageRepository.uploadImages(uid, images, createdTime);
      await _firestoreRepository.addThread(
        ThreadModel(
          userId: uid,
          content: content,
          imageUrls: imageUrls,
          createdTime: createdTime,
        ),
      );
    });

    if (!state.hasError) {
      // TODO: timeline reload
    }
  }
}

final writeThreadViewModel = AsyncNotifierProvider<WriteThreadViewModel, void>(
  () => WriteThreadViewModel(),
);
