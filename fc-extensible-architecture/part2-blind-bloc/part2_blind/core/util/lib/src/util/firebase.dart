import 'package:firebase_core/firebase_core.dart';

abstract class ICoreFirebase {
  static Future<void> initialize() async {
    await Firebase.initializeApp();
  }
}
