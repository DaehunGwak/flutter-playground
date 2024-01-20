import 'package:animation_wallet/views/widgets/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool _isExpanded = false;

  void _onExpand() {
    setState(() {
      _isExpanded = true;
    });
  }

  void _onShrink() {
    setState(() {
      _isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      body: GestureDetector(
        onTap: _onExpand,
        onVerticalDragEnd: (_) => _onShrink(),
        child: Column(
          children: [
            CreditCard(
              backgroundColor: Colors.purple,
              isExpanded: _isExpanded,
            )
                .animate(
                  target: _isExpanded ? 0 : 1,
                  delay: 1.5.seconds,
                )
                .flipV(
                  end: 0.1,
                ),
            CreditCard(
              backgroundColor: Colors.black,
              isExpanded: _isExpanded,
            )
                .animate(
                  target: _isExpanded ? 0 : 1,
                  delay: 1.5.seconds,
                )
                .flipV(
                  end: 0.1,
                )
                .slideY(
                  end: -0.8,
                ),
            CreditCard(
              backgroundColor: Colors.blue,
              isExpanded: _isExpanded,
            )
                .animate(
                  target: _isExpanded ? 0 : 1,
                  delay: 1.5.seconds,
                )
                .flipV(
                  end: 0.1,
                )
                .slideY(
                  end: -0.8 * 2,
                ),
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
      ),
    );
  }
}
