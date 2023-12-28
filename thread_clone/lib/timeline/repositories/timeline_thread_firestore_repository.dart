import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/write/models/thread_model.dart';

class TimelineThreadFirestoreRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<ThreadModel>> getAllThreadsOrderByCreatedTimeDesc() async {
    final querySnapshot = await _db
        .collection("threads")
        .orderBy("createdTime", descending: true)
        .get();
    return querySnapshot.docs
        .map((e) => ThreadModel.fromJson(e.data()))
        .toList();
  }
}

final timelineThreadFirestoreRepository =
    Provider((ref) => TimelineThreadFirestoreRepository());
