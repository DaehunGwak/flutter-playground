import 'package:animation_wallet/views/widgets/credit_card.dart';
import 'package:flutter/material.dart';

class CreditCardDetailScreen extends StatelessWidget {
  const CreditCardDetailScreen({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: Column(
        children: [
          CreditCard(
            index: index,
          ),
        ],
      ),
    );
  }
}
