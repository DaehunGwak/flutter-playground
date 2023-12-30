import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/write/models/thread_model.dart';

class SearchThreadsFirestoreRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// 현재 search text
  Future<List<ThreadModel>> searchThreadsByContent(
      String partialContent) async {
    final querySnapshot = await _db
        .collection("threads")
        .where("content", isGreaterThanOrEqualTo: partialContent)
        .where("content", isLessThan: "$partialContent\uf8ff")
        .get();

    final results = querySnapshot.docs
        .map(
          (e) => ThreadModel.fromJson(e.data()),
        )
        .toList();
    results.sort(
      (a, b) => (a.createdTime <= b.createdTime) ? 1 : 0,
    );

    return results;
  }
}

final searchThreadsFirestoreRepository =
    Provider((ref) => SearchThreadsFirestoreRepository());
