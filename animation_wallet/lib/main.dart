import 'package:animation_wallet/views/wallet_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimationWalletApp());
}

class AnimationWalletApp extends StatelessWidget {
  const AnimationWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nomad Wallet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WalletScreen(),
    );
  }
}
