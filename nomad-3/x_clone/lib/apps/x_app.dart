import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class XApp extends StatelessWidget {
  const XApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(FontAwesomeIcons.xTwitter),
      ),
    );
  }
}
