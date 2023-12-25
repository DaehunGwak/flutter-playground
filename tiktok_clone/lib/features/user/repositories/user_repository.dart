import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/user/models/user_profile_model.dart';

class UserRepository {
  static const _userCollectionName = "users";
  static const _avatarStoragePath = "avatars";

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // create profile
  Future<void> createProfile(UserProfileModel profile) async {
    await _db
        .collection(_userCollectionName)
        .doc(profile.uid)
        .set(profile.toJson());
  }

  Future<UserProfileModel> findProfile(String uid) async {
    final doc = await _db.collection(_userCollectionName).doc(uid).get();
    return UserProfileModel.fromJson(doc.data()!);
  }

  Future<void> uploadProfileAvatar(String uid, File file) async {
    final storageRef = _storage.ref().child('$_avatarStoragePath/$uid');
    await storageRef.putFile(file);
  }

  Future<void> updateProfile(UserProfileModel profile) async {
    await _db
        .collection(_userCollectionName)
        .doc(profile.uid)
        .update(profile.toJson());
  }
}

final userRepository = Provider((ref) => UserRepository());
