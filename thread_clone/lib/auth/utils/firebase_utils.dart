import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void showFirebaseExceptionSnackBar(BuildContext context, Object error) {
  final snack = SnackBar(
    showCloseIcon: true,
    content: Text(
      "please check your email and password, again. "
      "${(error as FirebaseException).message}",
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snack);
}
