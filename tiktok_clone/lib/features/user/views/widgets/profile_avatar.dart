import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/features/user/view_models/avatar_view_model.dart';

class ProfileAvatar extends ConsumerWidget {
  const ProfileAvatar({
    super.key,
    required this.name,
    required this.hasAvatar,
    required this.uid,
  });

  final String name;
  final bool hasAvatar;
  final String uid;

  Future<void> _onAvatarTap(WidgetRef ref) async {
    final xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
      maxHeight: 150,
      maxWidth: 150,
    );
    if (xFile != null) {
      final file = File(xFile.path);
      await ref.read(avatarProvider.notifier).uploadAvatar(file);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(avatarProvider).isLoading;
    return GestureDetector(
      onTap: isLoading ? null : () => _onAvatarTap(ref),
      child: isLoading
          ? Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const CircularProgressIndicator.adaptive(),
            )
          : CircleAvatar(
              radius: 50,
              foregroundColor: Colors.blue,
              foregroundImage: hasAvatar
                  ? NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/'
                      'ordi-test-tiktok-clone.appspot.com/o/avatars%2F'
                      '$uid'
                      '?alt=media&token=8e3bb537-5267-4609-8609-a6f86bd69dbe'
                      'timestamp=${DateTime.now()}',
                    )
                  : null,
              child: Text(name),
            ),
    );
  }
}
