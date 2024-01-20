import 'package:animation_wallet/views/widgets/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      body: Column(
        children: [
          const CreditCard(backgroundColor: Colors.purple),
          const CreditCard(backgroundColor: Colors.black),
          const CreditCard(backgroundColor: Colors.blue),
        ]
            .animate(
              interval: 500.ms,
            )
            .fadeIn(begin: 0)
            .slideX(
              begin: -1,
              end: 0,
            ),
      ),
    );
  }
}
