import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/write/models/thread_model.dart';

class WriteThreadFirestoreRepository {
  final _db = FirebaseFirestore.instance;

  Future<void> addThread(ThreadModel thread) async {
    await _db.collection('threads').add(thread.toJson());
  }
}

final writeThreadFirestoreRepository =
    Provider((ref) => WriteThreadFirestoreRepository());
