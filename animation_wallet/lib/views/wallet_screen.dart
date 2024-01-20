import 'package:animation_wallet/views/widgets/credit_card.dart';
import 'package:flutter/material.dart';

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
      body: const Column(
        children: [
          CreditCard(backgroundColor: Colors.purple),
          CreditCard(backgroundColor: Colors.black),
          CreditCard(backgroundColor: Colors.blue),
        ],
      ),
    );
  }
}
