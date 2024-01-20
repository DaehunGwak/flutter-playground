import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
    super.key,
    required this.backgroundColor,
    required this.isExpanded,
  });

  final Color backgroundColor;
  final bool isExpanded;

  void _onTap() {
    debugPrint("tap card: $backgroundColor");
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !isExpanded,
      child: GestureDetector(
        onTap: _onTap,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 40,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: backgroundColor,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCardText(),
                  _buildCardLogo(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _buildCardText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nomad Coders",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        Text(
          "**** **** **** **75",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildCardLogo() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
        ),
        Positioned(
          right: 20,
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber,
            ),
          ),
        ),
      ],
    );
  }
}
