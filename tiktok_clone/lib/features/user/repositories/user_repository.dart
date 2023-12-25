import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/user/models/user_profile_model.dart';

class UserRepository {
  static const _userCollectionName = "users";

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // create profile
  Future<void> createProfile(UserProfileModel profile) async {
    await _db
        .collection(_userCollectionName)
        .doc(profile.uid)
        .set(profile.toJson());
  }
}

final userRepository = Provider((ref) => UserRepository());
