import 'package:animation_wallet/views/widgets/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
          ...[for (var i = 0; i < 5; i++) _buildPaymentInfo()]
              .animate(interval: 300.ms)
              .fadeIn(begin: 0)
              .flipV(
                begin: -0.5,
                end: 0,
                curve: Curves.bounceOut,
              ),
        ],
      ),
    );
  }

  Container _buildPaymentInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: ListTile(
        tileColor: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        leading: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: const Icon(
            Icons.shopping_bag,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Uniqlo',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          'Gangnam Branch',
          style: TextStyle(
            color: Colors.grey.shade800,
          ),
        ),
        trailing: const Text(
          "\$431,152",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
