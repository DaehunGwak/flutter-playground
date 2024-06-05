import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'sizes.dart';

abstract class Logos {
  static const xTwitter = FaIcon(
    FontAwesomeIcons.xTwitter,
    size: Sizes.size32,
    color: Colors.black,
  );

  static const google = FaIcon(
    FontAwesomeIcons.google,
    size: Sizes.size24,
    color: Colors.black,
  );

  static const apple = FaIcon(
    FontAwesomeIcons.apple,
    size: Sizes.size24,
    color: Colors.black,
  );
}
